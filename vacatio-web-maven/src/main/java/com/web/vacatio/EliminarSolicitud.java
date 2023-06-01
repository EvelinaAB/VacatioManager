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

/**
 * Servlet implementation class EliminarSolicitud
 */
@WebServlet("/EliminarSolicitud")
public class EliminarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EliminarSolicitud() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idSolicitud = request.getParameter("id");

		if (idSolicitud == null || idSolicitud.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/Menu.jsp");
			return;
		}


		try (Connection conexion = ConexionPool.getConnection()) {
			String sqlDelete = "DELETE FROM Solicitudes WHERE id = ?";
			try (PreparedStatement consulta = conexion.prepareStatement(sqlDelete)) {
				consulta.setInt(1, Integer.parseInt(idSolicitud));
				consulta.executeUpdate();
			}
			response.sendRedirect("ListaSolicitudesServlet");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}

}
