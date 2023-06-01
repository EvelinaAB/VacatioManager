
package com.web.vacatio;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.web.vacatio.ConexionPool;

/**
 * Servlet implementation class ListaSolicitudesServlet
 */
@WebServlet("/ListaSolicitudesServlet")
public class ListaSolicitudesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListaSolicitudesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Obtiene la sesión actual
		HttpSession session = request.getSession(false);
		if (session == null) {
			// Si no hay sesión, redirige al inicio de sesión
			response.sendRedirect("Login.jsp");
			return;
		}

		// Obtiene el estado desde la petición
		String estadoFiltrado = request.getParameter("estadoFiltrado");
		if (estadoFiltrado == null || estadoFiltrado.isEmpty()) {
			estadoFiltrado = "todas";
		}

		String usuarioActual = (String) session.getAttribute("usuario");

		try (Connection conexion = ConexionPool.getConnection()) {

			// Obtiene el rol y permisos del usuario actual
			String sqlRol = "SELECT id_rol FROM usuarios WHERE usuario = ?";
			try (PreparedStatement consultatRol = conexion.prepareStatement(sqlRol);) {

				consultatRol.setString(1, usuarioActual);

				try (ResultSet resultadoRol = consultatRol.executeQuery();) {
					if (resultadoRol.next()) {
						int idRol = resultadoRol.getInt("id_rol");

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

						// Prepara la consulta SQL para obtener solicitudes
						String sql = "SELECT u.nombre, u.apellidos, s.id, s.usuario_id, s.fecha_inicio, s.fecha_fin, s.descripcion, s.estado "
								+ "FROM solicitudes s " + "INNER JOIN usuarios u ON s.usuario_id = u.id ";
						List<Object> parametros = new ArrayList<>();

						

						if (idRol == 2) {
							sql += "WHERE s.usuario_id = ?";
							parametros.add(obtenerIdUsuario(usuarioActual));
							if (!estadoFiltrado.equals("todas")) {
								sql += " AND s.estado = ?";
								parametros.add(estadoFiltrado);
							}
						} else if (idRol == 1) {
							if (!estadoFiltrado.equals("todas")) {
								sql += "WHERE s.estado = ?";
								parametros.add(estadoFiltrado);
							}
						}
						String contartSql = sql.replace(
								"u.nombre, u.apellidos, s.id, s.usuario_id, s.fecha_inicio, s.fecha_fin, s.descripcion, s.estado",
								"COUNT(*)");
						int totalEntradas = 0;
						try (PreparedStatement contarConsulta = conexion.prepareStatement(contartSql)) {
							for (int i = 0; i < parametros.size(); i++) {
								contarConsulta.setObject(i + 1, parametros.get(i));
							}
							try (ResultSet contarResultado = contarConsulta.executeQuery()) {
								if (contarResultado.next()) {
									totalEntradas = contarResultado.getInt(1);
								}
							}
						}

						int pagina = 1;
						String pageParameter = request.getParameter("page");
						if (pageParameter != null && !pageParameter.isEmpty()) {
							pagina = Integer.parseInt(pageParameter);
						}
						int entradasPorPagina = 8;
						int offset = (pagina - 1) * entradasPorPagina;

						sql += " LIMIT ? OFFSET ?";
						parametros.add(entradasPorPagina);
						parametros.add(offset);
						int totalPaginas = (int) Math.ceil((double) totalEntradas / entradasPorPagina);
						request.setAttribute("totalPages", totalPaginas);
						request.setAttribute("totalRecords", Integer.valueOf(totalEntradas));
						request.setAttribute("estadoFiltrado", estadoFiltrado);

						try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
							for (int i = 0; i < parametros.size(); i++) {
								consulta.setObject(i + 1, parametros.get(i));
							}
							try (ResultSet resultado = consulta.executeQuery()) {
								// Procesa los resultados de la consulta
								List<Solicitud> solicitudes = new ArrayList<>();

								while (resultado.next()) {
									int id = resultado.getInt("id");
									String nombre = resultado.getString("nombre");
									String apellidos = resultado.getString("apellidos");
									Date fechaInicio = resultado.getDate("fecha_inicio");
									Date fechaFin = resultado.getDate("fecha_fin");
									String descripcion = resultado.getString("descripcion");
									String estado = resultado.getString("estado");

									Solicitud solicitud = new Solicitud(id, nombre, apellidos, fechaInicio, fechaFin,
											descripcion, estado);

									solicitudes.add(solicitud);

								}

								System.out.println("Solicitudes encontradas: " + solicitudes.size());
								for (Solicitud solicitud : solicitudes) {
									System.out.println(
											"Solicitud: " + solicitud.getId() + ", Estado: " + solicitud.getEstado());
								}
								
								request.setAttribute("solicitudes", solicitudes);
								request.setAttribute("permisos", permisos);

								RequestDispatcher dispatcher = request.getRequestDispatcher("Listado.jsp");
								dispatcher.forward(request, response);
							}
						}
					}

					else {
						throw new ServletException("Usuario no encontrado: " + usuarioActual);
					}

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private int obtenerIdUsuario(String usuario) throws SQLException {
		Connection conexion = ConexionPool.getConnection();
		// Prepara la consulta SQL
		String sql = "SELECT id FROM usuarios WHERE usuario = ?";
		try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
			// Establece el nombre de usuario como parámetro de la consulta
			consulta.setString(1, usuario);

			// Ejecuta la consulta SQL
			try (ResultSet resultSet = consulta.executeQuery()) {
				// Si se encuentra el usuario, devuelve su ID
				if (resultSet.next()) {
					return resultSet.getInt("id");
					// Si no encuentra el usuario, devuelve -1
				} else {
					return -1;
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
