package com.web.vacatio;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.web.vacatio.ConexionPool;


/**
 * Servlet implementation class AceptarSolicitud
 */
@WebServlet("/AceptarSolicitud")
public class AceptarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AceptarSolicitud() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtiene la sesión actual
		HttpSession sesion = request.getSession(false);
		if (sesion == null) {
			// Si no hay sesión, redirige al inicio de sesión
			response.sendRedirect("Login.jsp");
			return;
		}
		// Obtiene el ID de la solicitud a aceptar desde el parámetro de solicitud
		int solicitudId = Integer.parseInt(request.getParameter("id"));

		Connection conexion = null;
		try {
			conexion = ConexionPool.getConnection();
			String sqlUpdate = "UPDATE Solicitudes SET estado = 'aprobado' WHERE id = ?";
			try (PreparedStatement consultaActualizacion = conexion.prepareStatement(sqlUpdate)) {
				consultaActualizacion.setInt(1, solicitudId);
				consultaActualizacion.executeUpdate();
			}
			response.sendRedirect("ListaSolicitudesServlet");
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
	}

}
