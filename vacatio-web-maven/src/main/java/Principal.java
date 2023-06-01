import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import com.web.vacatio.ConexionPool;
/**
 * Servlet implementation class Principal
 */
@WebServlet("/Principal")
public class Principal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Principal() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Recoge el usuario y la contraseña a través de los parámetros request

		String usuario = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");

		boolean credencialesCorrectas = false;
		int idRol = 0;
		Connection conexion = null;
		PreparedStatement consulta1 = null;
		PreparedStatement consulta2 = null;
		ResultSet resultado1 = null;
		ResultSet resultado2 = null;

		try {
			// Conecta con la base de datos
			conexion = ConexionPool.getConnection();

			// Selecciona la contraseña y idRol del usuario actual
			String sql = "SELECT contrasena_hash, id_rol FROM usuarios WHERE usuario = ?";
			consulta1 = conexion.prepareStatement(sql);
			consulta1.setString(1, usuario);
			resultado1 = consulta1.executeQuery();

			if (resultado1.next()) {
				String contrasenaCifrada = resultado1.getString("contrasena_hash");

				// A través de BCrypt verifica la contraseña proporcionada con la de base de
				// datos
				if (BCrypt.checkpw(contrasena, contrasenaCifrada)) {

					credencialesCorrectas = true;

					// Recoge el idRol del usuario
					idRol = resultado1.getInt("id_rol");

					// Comprueba los permisos que tiene el usuario
					String sql2 = "SELECT permiso FROM Permisos_Rol WHERE rol = ?";
					consulta2 = conexion.prepareStatement(sql2);
					consulta2.setInt(1, idRol);
					resultado2 = consulta2.executeQuery();

					List<String> permisos = new ArrayList<>();
					while (resultado2.next()) {
						permisos.add(resultado2.getString("permiso"));
					}

					// Agrega los permisos de usuario a la sesión
					HttpSession session = request.getSession();
					session.setAttribute("permisos", permisos);

					// Guarda el usuario
					session.setMaxInactiveInterval(900); 
					session.setAttribute("usuario", usuario);
				}
			}
		} catch (SQLException e) {
			System.out.println("Database error: " + e.getMessage());
			response.sendRedirect("Error.jsp");
			return;
		} finally {
			try {
				if (consulta1 != null) {
					consulta1.close();
				}
			} catch (SQLException e) {
				
			}
			try {
				if (resultado1 != null) {
					resultado1.close();
				}
				
			} catch (SQLException e) {
				
			}
			try {
				if (consulta2 != null) {
					consulta2.close();
				}
			} catch (SQLException e) {
				
			}
			try {
				if (resultado2 != null) {
					resultado2.close();
				}
				
			} catch (SQLException e) {
				
			}
			try {
				if (conexion != null) {
					conexion.close();
				}
			} catch (SQLException e) {
				
			}
		}

		if (credencialesCorrectas) {
			// Si las credenciales son correctas, redirige a la página de menu
			response.sendRedirect("CalendarioFechas");
		} else {
			// Si las credenciales no son correctas, redirije al login y muestra mensaje de
			// error
	
			response.sendRedirect("Login.jsp?error=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}