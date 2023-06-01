package com.web.vacatio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.web.vacatio.ConexionPool;
import java.util.List;

/**
 * Servlet implementation class EdicionPerfil
 */
@WebServlet("/EdicionPerfil")
public class EdicionPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EdicionPerfil() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario usuario = null;
		Connection conexion = null;
		HttpSession sesion = request.getSession();
		String usuarioActual = (String) sesion.getAttribute("usuario");
		int idUsuario = 0;

		try {
			conexion = ConexionPool.getConnection();
			String sqlId = "SELECT id FROM usuarios WHERE usuario = ?";
			try (PreparedStatement consultaId = conexion.prepareStatement(sqlId)) {
				consultaId.setString(1, usuarioActual);
				try (ResultSet resultadoId = consultaId.executeQuery()) {
					if (resultadoId.next()) {
						idUsuario = resultadoId.getInt("id");
						sesion.setAttribute("id", idUsuario);
					}
				}
			}

			String sqlRol = "SELECT r.rol FROM usuarios u JOIN rol r ON u.id_rol = r.id_rol WHERE u.usuario = ?";
			try (PreparedStatement consultaRol = conexion.prepareStatement(sqlRol)) {
				consultaRol.setString(1, usuarioActual);
				try (ResultSet resultadoRol = consultaRol.executeQuery()) {
					if (resultadoRol.next()) {
						String rol = resultadoRol.getString("rol");

						String query = "SELECT * FROM Usuarios WHERE id=?";
						try (PreparedStatement consulta = conexion.prepareStatement(query)) {
							consulta.setInt(1, idUsuario);
							try (ResultSet resultado = consulta.executeQuery()) {
								if (resultado.next()) {
									usuario = new Usuario(resultado.getInt("id"), resultado.getString("nombre"),
											resultado.getString("apellidos"), resultado.getString("usuario"), null,
											rol);
									request.setAttribute("usuario", usuario);
									RequestDispatcher dispatcher = request.getRequestDispatcher("EditarPerfil.jsp");
									dispatcher.forward(request, response);
								} else {
									// Manejar la situación en la que no se encuentra al usuario
								}
							}
						}
					} else {
						// Manejar la situación en la que no se encuentra el rol del usuario
					}
				}
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			if (conexion != null) {
				try {
					conexion.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	


	       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Obtener los datos enviados desde el formulario
	    int idUsuario = 0;
	    String nombre = request.getParameter("nombre");
	    String apellidos = request.getParameter("apellidos");
	    String usuario = request.getParameter("usuario");
	   
	    HttpSession sesion = request.getSession();
	    String usuarioActual = (String) sesion.getAttribute("usuario");
	    Connection conexion = null;
	    try {
	        conexion = ConexionPool.getConnection();
	        String sqlId = "SELECT id FROM usuarios WHERE usuario = ?";
	        try (PreparedStatement consultaId = conexion.prepareStatement(sqlId)) {
	            consultaId.setString(1, usuarioActual);
	            try (ResultSet resultadoId = consultaId.executeQuery()) {
	                if (resultadoId.next()) {
	                    idUsuario = resultadoId.getInt("id");
	                    sesion.setAttribute("id", idUsuario);
	                }
	            }
	        }
	        System.out.println(nombre);
	        System.out.println(apellidos);
	        System.out.println(usuario);
	     
	        
	        // Crear la consulta SQL para actualizar el perfil del usuario
	        String sql = "UPDATE Usuarios SET nombre=?, apellidos=?, usuario=? WHERE id=?";
	        
	        try (PreparedStatement ps = conexion.prepareStatement(sql)) {
	            // Establecer los valores de los parámetros en la consulta SQL
	            ps.setString(1, nombre);
	            ps.setString(2, apellidos);
	            ps.setString(3, usuario);
	            ps.setInt(4, idUsuario); 
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (conexion != null) {
	                try {
	                    conexion.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    // Redirige de vuelta a la página de detalles de la solicitud
	    response.sendRedirect("Perfil");
	}
}


