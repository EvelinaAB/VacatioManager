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

/**
 * Servlet implementation class RechazarSolicitud
 */
@WebServlet("/RechazarSolicitud")
public class RechazarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechazarSolicitud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtiene la sesión actual
				HttpSession session = request.getSession(false);
				if (session == null) {
					// Si no hay sesión, redirige al inicio de sesión
					response.sendRedirect("Login.jsp");
					return;
				}
		// Obtiene el ID de la solicitud a aceptar desde el parámetro de solicitud
		int solicitudId = Integer.parseInt(request.getParameter("id"));
		System.out.println(solicitudId);

		try (Connection connection = ConexionPool.getConnection()) {
			String sqlUpdate = "UPDATE Solicitudes SET estado = 'rechazado' WHERE id = ?";
			try (PreparedStatement consulta = connection.prepareStatement(sqlUpdate)) {
				consulta.setInt(1, solicitudId);
				consulta.executeUpdate();
			}
			response.sendRedirect("ListaSolicitudesServlet");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
