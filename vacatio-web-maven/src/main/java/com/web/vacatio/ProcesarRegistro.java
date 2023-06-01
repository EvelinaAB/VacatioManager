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
import org.mindrot.jbcrypt.BCrypt;



/**
 * Servlet implementation class ProcesarRegistro
 */
@WebServlet("/ProcesarRegistro")
public class ProcesarRegistro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProcesarRegistro() {
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
	    // Obtener los valores del formulario
		int idRol=0;
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String correo = request.getParameter("usuario");
		String contrasena = request.getParameter("contrasena");
		String tipoUsuario = request.getParameter("tipoUsuario");


	    // Encripta la contraseña usando bcrypt
	    String hashedContrasena = BCrypt.hashpw(contrasena, BCrypt.gensalt());

	    try (Connection conexion = ConexionPool.getConnection()){
	    	String sqlInsert= "INSERT INTO Usuarios (nombre, apellidos, usuario, contrasena_hash, id_rol) VALUES (?, ?, ?, ?, ?)";
	    
	          try(PreparedStatement consultaInsertar = conexion.prepareStatement(sqlInsert)){
	        	  
	        	  if(tipoUsuario.equals("gerente")) {
	        		  idRol=1;
	        	  }else {
	        		  idRol=2;
	        	  }
	        	  
	        	  consultaInsertar .setString(1, nombre);
	        	  consultaInsertar .setString(2, apellidos);
	        	  consultaInsertar .setString(3, correo);
	        	  consultaInsertar .setString(4, hashedContrasena);
	        	  consultaInsertar .setInt(5,idRol);
	        	  consultaInsertar .executeUpdate();

	          }
	       // Valida la entrada del usuario
	          if (nombre.isEmpty() || apellidos.isEmpty() || correo.isEmpty() || tipoUsuario.isEmpty()) {
	              response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros requeridos");
	              return;
	          }

	    
	        response.sendRedirect("Login.jsp");
	    } catch (SQLException e) {
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al registrar el usuario");
	        e.printStackTrace();
	    }
	}

}
