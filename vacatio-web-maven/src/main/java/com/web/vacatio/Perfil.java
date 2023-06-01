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

/**
 * Servlet implementation class Perfil
 */
@WebServlet("/Perfil")
public class Perfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Perfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
									RequestDispatcher dispatcher = request.getRequestDispatcher("Perfil.jsp");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
