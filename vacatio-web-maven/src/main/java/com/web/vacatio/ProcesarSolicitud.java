package com.web.vacatio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProcesarSolicitud
 */
@WebServlet("/ProcesarSolicitud")
public class ProcesarSolicitud extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProcesarSolicitud() {
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

		HttpSession session = request.getSession(false);
		Connection conexion = null;

		String[] diasFestivos = { "2023-01-06", "2023-01-01", "2023-01-07", "2023-01-08", "2023-01-14", "2023-01-15",
				"2023-01-21", "2023-01-22", "2023-01-28", "2023-01-29", "2023-02-04", "2023-02-05", "2023-02-11",
				"2023-02-12", "2023-02-18", "2023-02-19", "2023-02-25", "2023-02-26", "2023-03-20", "2023-03-04",
				"2023-03-05", "2023-03-11", "2023-03-12", "2023-03-18", "2023-03-19", "2023-03-25", "2023-03-26",
				"2023-04-01", "2023-04-02", "2023-04-06", "2023-04-07", "2023-04-08", "2023-04-09", "2023-04-15",
				"2023-04-16", "2023-04-22", "2023-04-23", "2023-04-29", "2023-04-30", "2023-05-01", "2023-05-02",
				"2023-05-06", "2023-05-07", "2023-05-13", "2023-05-20", "2023-05-21", "2023-05-27", "2023-05-28",
				"2023-05-15", "2023-06-03", "2023-06-04", "2023-06-10", "2023-06-11", "2023-06-17", "2023-06-03",
				"2023-06-24", "2023-06-25", "2023-07-01", "2023-07-02", "2023-07-08", "2023-07-09", "2023-07-15",
				"2023-07-16", "2023-07-22", "2023-07-23", "2023-07-29", "2023-07-30", "2023-08-05", "2023-08-06",
				"2023-08-12", "2023-08-13", "2023-08-19", "2023-08-20", "2023-08-26", "2023-08-27", "2023-08-15",
				"2023-09-02", "2023-09-03", "2023-09-09", "2023-09-10", "2023-09-16", "2023-09-17", "2023-09-23",
				"2023-09-24", "2023-09-30", "2023-10-01", "2023-10-07", "2023-10-08", "2023-10-14", "2023-10-15",
				"2023-10-12", "2023-10-21", "2023-10-22", "2023-10-28", "2023-10-29", "2023-11-01", "2023-11-04",
				"2023-11-05", "2023-11-09", "2023-11-11", "2023-11-12", "2023-11-18", "2023-11-19", "2023-11-25",
				"2023-11-26", "2023-12-02", "2023-12-03", "2023-12-06", "2023-12-08", "2023-12-09", "2023-12-10",
				"2023-12-16", "2023-12-17", "2023-12-23", "2023-12-24", "2023-12-30", "2023-12-31", "2023-05-01",
				"2023-12-25" };

		if (session != null) {
			try {
				conexion = ConexionPool.getConnection();
				// Obtiene el usuario actual
				String usuario = (String) session.getAttribute("usuario");

				PreparedStatement consultaId = conexion.prepareStatement("SELECT id FROM Usuarios WHERE usuario = ?");
				consultaId.setString(1, usuario);
				ResultSet resultadoId = consultaId.executeQuery();
				resultadoId.next();
				int id_usuario = resultadoId.getInt("id");

				String fecha_inicio = request.getParameter("fecha_inicio");
				String fecha_fin = request.getParameter("fecha_fin");
				String descripcion = request.getParameter("descripcion");

				// Consulta si ya existe una solicitud con las mismas fechas
				PreparedStatement consultaSolicitudDuplicada = conexion.prepareStatement(
						"SELECT COUNT(*) AS count FROM Solicitudes WHERE ((fecha_inicio <= ? AND fecha_fin >= ?) OR (fecha_inicio <= ? AND fecha_fin >= ?)) AND usuario_id != ?");
				consultaSolicitudDuplicada.setDate(1, java.sql.Date.valueOf(fecha_inicio));
				consultaSolicitudDuplicada.setDate(2, java.sql.Date.valueOf(fecha_inicio));
				consultaSolicitudDuplicada.setDate(3, java.sql.Date.valueOf(fecha_fin));
				consultaSolicitudDuplicada.setDate(4, java.sql.Date.valueOf(fecha_fin));
				consultaSolicitudDuplicada.setInt(5, id_usuario);
				ResultSet resultadoSolicitudDuplicada = consultaSolicitudDuplicada.executeQuery();

				resultadoSolicitudDuplicada.next();
				int count = resultadoSolicitudDuplicada.getInt("count");
				if (count > 0) {
					// Muestra un mensaje de error indicando que las fechas ya están registradas
					request.setAttribute("error", "Las fechas ya están registradas");
					request.getRequestDispatcher("Solicitud.jsp").forward(request, response);
					return;
				}

				// Calcula la cantidad de días laborales entre las dos fechas
				int dias_laborales = 0;
				int dias_laborales_disponibles = 23;

				for (LocalDate date = LocalDate.parse(fecha_inicio); !date
						.isAfter(LocalDate.parse(fecha_fin)); date = date.plusDays(1)) {
					String fecha = date.toString();
					boolean es_dia_festivo = false;
					for (String diaFestivo : diasFestivos) {
						if (fecha.equals(diaFestivo)) {
							es_dia_festivo = true;
							break;
						}
					}
					if (!es_dia_festivo) {
						dias_laborales++;

					}
				}

				// Consulta para obtener el total de días solicitados por el usuario
				PreparedStatement consultaDiasSolicitados = conexion.prepareStatement(
						"SELECT SUM(dias_solicitados) as total_dias_solicitados FROM Solicitudes WHERE usuario_id = ?");
				consultaDiasSolicitados.setInt(1, id_usuario);
				ResultSet resultadoDiasSolicitados = consultaDiasSolicitados.executeQuery();
				int total_dias_solicitados = 0;
				if (resultadoDiasSolicitados.next()) {
					total_dias_solicitados = resultadoDiasSolicitados.getInt("total_dias_solicitados");
				}
				int dias_disponibles = dias_laborales_disponibles - total_dias_solicitados;

				if (dias_laborales > dias_disponibles) {
					request.setAttribute("error", "No hay suficientes días disponibles");
					request.getRequestDispatcher("Solicitud.jsp").forward(request, response);
					return;
				}

				// Inserta los valores en la tabla Solicitudes
				PreparedStatement consultaInsertar = conexion.prepareStatement(
						"INSERT INTO Solicitudes (usuario_id, fecha_inicio, fecha_fin, descripcion, dias_solicitados) VALUES (?, ?, ?, ?, ?)");
				consultaInsertar.setInt(1, id_usuario);
				consultaInsertar.setDate(2, java.sql.Date.valueOf(fecha_inicio));
				consultaInsertar.setDate(3, java.sql.Date.valueOf(fecha_fin));
				consultaInsertar.setString(4, descripcion);
				consultaInsertar.setInt(5, dias_laborales);
				consultaInsertar.executeUpdate();
				conexion.close();

				// Redirige a la página principal
				response.sendRedirect("ListaSolicitudesServlet");
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendError(500, "Error de base de datos");
			} finally {

				// Cierra la conexión y la consulta
				try {

					if (conexion != null) {
						conexion.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
		}
	}
}
