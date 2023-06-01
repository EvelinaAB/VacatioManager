package com.web.vacatio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CalendarioFechas
 */
@WebServlet("/CalendarioFechas")
public class CalendarioFechas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalendarioFechas() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    // Obtiene los datos del usuario que ha iniciado la sesión
	    HttpSession sesion = request.getSession();
	    String usuarioActual = (String) sesion.getAttribute("usuario");
	    Connection conexion;
	    int idUsuario = 0;

	    try {
	        conexion = ConexionPool.getConnection();

	        // Obtien el id del usuario actual
	        String sqlId = "SELECT id FROM usuarios WHERE usuario = ?";

	        try (PreparedStatement consultaId = conexion.prepareStatement(sqlId)) {
	            consultaId.setString(1, usuarioActual);

	            try (ResultSet resultadoId = consultaId.executeQuery()) {
	                if (resultadoId.next()) {
	                    idUsuario = resultadoId.getInt("id");

	                    // Agrega el id del usuario a la sesión
	                    sesion.setAttribute("id", idUsuario);
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        // Obtiene los permisos del usuario actual
	        List<String> permisos = new ArrayList<>();
	        String sqlPermisos = "SELECT p.clave FROM Permisos p\n"
	                + "INNER JOIN Permisos_Rol pr ON p.id_permiso = pr.permiso\n"
	                + "INNER JOIN Rol r ON pr.rol = r.id_rol\n"
	                + "INNER JOIN Usuarios u ON u.id_rol = r.id_rol\n" + "WHERE u.usuario = ?";

	        try (PreparedStatement consultaPermisos = conexion.prepareStatement(sqlPermisos)) {
	            consultaPermisos.setString(1, usuarioActual);

	            try (ResultSet resultadoPermisos = consultaPermisos.executeQuery()) {
	                while (resultadoPermisos.next()) {
	                    String permiso = resultadoPermisos.getString("clave");
	                    permisos.add(permiso);
	                }
	            }

	        }

	        String fechasVacaciones = obtenerTodasLasSolicitudes();

	        // Consulta para obtener el total de días solicitados por el usuario
	        PreparedStatement consultaDiasSolicitados = conexion.prepareStatement(
	                "SELECT SUM(dias_solicitados) as total_dias_solicitados FROM Solicitudes WHERE estado = 'aprobado'");
	        ResultSet resultadoDiasSolicitados = consultaDiasSolicitados.executeQuery();
	        int totalDiasSolicitados = 0;

	        if (resultadoDiasSolicitados.next()) {
	            totalDiasSolicitados = resultadoDiasSolicitados.getInt("total_dias_solicitados");
	        }

	        int diasDisponibles = 23 - totalDiasSolicitados;

	        // Agrega los datos al request
	        request.setAttribute("fechasVacaciones", fechasVacaciones);
	        request.setAttribute("permisos", permisos);
	        request.setAttribute("diasDisponibles", diasDisponibles);

	        // Envia el request al JSP
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Menu.jsp");
	        dispatcher.forward(request, response);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	/** Método que devuelve las solcitudes de todos los usuarios **/
	private String obtenerTodasLasSolicitudes() {

		StringBuilder fechasVacaciones = new StringBuilder();

		try {
			// Conecta a la base de datos
			Connection conexion = ConexionPool.getConnection();

			// Crea la consulta SQL
			String consultaFechas = "SELECT fecha_inicio, fecha_fin FROM Solicitudes WHERE estado='aprobado'";

			// Ejecuta la consulta SQL
			PreparedStatement consulta = conexion.prepareStatement(consultaFechas);
			ResultSet resultado = consulta.executeQuery();

			// Recorre los resultados y agregar las fechas a la cadena
			while (resultado.next()) {
				Date fechaInicio = resultado.getDate("fecha_inicio");
				Date fechaFin = resultado.getDate("fecha_fin");
				List<Date> fechasEntre = obtenerFechasEntre(fechaInicio, fechaFin);
				for (Date fecha : fechasEntre) {
					// Elimina la hora de la fecha y la formatea como "yyyy-MM-dd"
					String fechaFormateada = new SimpleDateFormat("yyyy-MM-dd").format(fecha);
					if (fechasVacaciones.length() > 0) {
						fechasVacaciones.append(", ");
					}
					fechasVacaciones.append(fechaFormateada);
				}
			}

			// Cierra la conexión
			resultado.close();
			consulta.close();
			conexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return fechasVacaciones.toString();
	}

	/**
	 * Método que obtiene todas las fechas comprendidas entre las dos pasdas como
	 * parámetros
	 **/
	private List<Date> obtenerFechasEntre(Date fechaInicio, Date fechaFin) {
		List<Date> fechas = new ArrayList<>();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fechaInicio);
		while (calendar.getTime().before(fechaFin)) {
			Date fecha = calendar.getTime();
			fechas.add(fecha);
			calendar.add(Calendar.DATE, 1);
		}
		fechas.add(fechaFin);
		return fechas;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
