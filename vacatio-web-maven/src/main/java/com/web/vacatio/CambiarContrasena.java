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

import org.mindrot.jbcrypt.BCrypt;


/**
 * Servlet implementation class CambiarContrasena
 */
@WebServlet("/CambiarContrasena")
public class CambiarContrasena extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiarContrasena() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtiene los datos del usuario que ha iniciado la sesión
		HttpSession sesion = request.getSession();
		String usuarioActual = (String) sesion.getAttribute("usuario");
		String contrasena = request.getParameter("contrasena");
		// Encripta la nueva contraseña usando bcrypt
		String hashedContrasena = BCrypt.hashpw(contrasena, BCrypt.gensalt());

		try (Connection conexion = ConexionPool.getConnection()){
		    String sqlUpdate= "UPDATE Usuarios SET contrasena_hash = ? WHERE usuario = ?";
		    
		    try(PreparedStatement consultaActualizar = conexion.prepareStatement(sqlUpdate)){
		        consultaActualizar.setString(1, hashedContrasena);
		        consultaActualizar.setString(2, usuarioActual);
		        consultaActualizar.executeUpdate();
		    }
		    response.sendRedirect("Perfil");
		} catch (SQLException e) {
		    e.printStackTrace();
		}
	}


}
