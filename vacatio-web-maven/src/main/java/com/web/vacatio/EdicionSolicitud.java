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

/**
 * Servlet implementation class EdicionSolicitud
 */
@WebServlet("/EdicionSolicitud")
public class EdicionSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EdicionSolicitud() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	
 	    Solicitud solicitud = null;
 	 
 	    String idString = request.getParameter("id");
 	    try (Connection conexion = ConexionPool.getConnection()) {
 	        String query = "SELECT * FROM Solicitudes WHERE id=?";
 	        try (PreparedStatement consulta = conexion.prepareStatement(query)) {
 	            consulta.setInt(1, Integer.parseInt(idString));
 	            try (ResultSet resultado = consulta.executeQuery()) {
 	                if (resultado.next()) {  
 	                    solicitud = new Solicitud(0, null, null, query);
 	                    solicitud.setId(resultado.getInt("id"));
 	                    solicitud.setFechaInicio(resultado.getDate("fecha_inicio"));
 	                    solicitud.setFechaFin(resultado.getDate("fecha_fin"));
 	                    solicitud.setDescripcion(resultado.getString("descripcion"));
 	                
 	                } else {
 	                    // no se encontró ninguna fila con ese id
 	                }
 	                request.setAttribute("solicitud", solicitud);
 	               RequestDispatcher dispatcher = request.getRequestDispatcher("EditarSolicitud.jsp");
					dispatcher.forward(request, response);
 	                
 	            }
 	        }
 	 
 	    } catch (SQLException e) {

 	    }
 	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // Obtiene los parámetros del formulario
        int idSolicitud = Integer.parseInt(request.getParameter("id"));
        String fechaInicio = request.getParameter("fecha_inicio");
        String fechaFin = request.getParameter("fecha_fin");
        String descripcion = request.getParameter("descripcion");

        // Actualiza la solicitud en la base de datos
        try {
        	Connection conexion = ConexionPool.getConnection();
            String sql = "UPDATE Solicitudes SET fecha_inicio=?, fecha_fin=?, descripcion=? WHERE id=?";
            PreparedStatement consulta = conexion.prepareStatement(sql);
            consulta.setString(1, fechaInicio);
            consulta.setString(2, fechaFin);
            consulta.setString(3, descripcion);
            consulta.setInt(4, idSolicitud);
            consulta.executeUpdate();
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Redirige de vuelta a la página de detalles de la solicitud
        response.sendRedirect("ListaSolicitudesServlet");
    }
	

}
