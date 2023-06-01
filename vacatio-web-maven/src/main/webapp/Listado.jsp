
<%@ page import="com.web.vacatio.Solicitud"%>
<%@ page import="com.web.vacatio.AceptarSolicitud"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
// Comprueba que el usuario haya iniciado la sesión
HttpSession userSession = request.getSession(false);
if (userSession != null && userSession.getAttribute("usuario") != null) {
	String username = (String) userSession.getAttribute("usuario");
} else {
	// Si no está iniciada la sesión, redirije a la página de Login
	response.sendRedirect("Login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de solicitudes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
	crossorigin="anonymous">
	
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
	integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
<link rel="stylesheet" href="style2.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
	integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
	integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc="
	crossorigin="anonymous" />
<style>
.container {
	margin-top: 20px;
}

.nav-item {
	margin-right: 10px;
}

.form-aceptar {
	margin-right: 5px;
}

.form-editar {
	margin-right: 5px;
}

.navbar-custom {
	background-color: white;
}
</style>
</head>
<body>
	<nav>
		<header style="background: white">
			<nav class="navbar navbar-expand-lg ">
				<div class="container-fluid">
					<h1>
						<a href="CalendarioFechas">  <img src="images/logo2.png"
					alt="Logo de Vacatio Manager" width="340" height="90">
						</a>
					</h1>

					<form action="CerrarSesion" method="post">
						<ul class="nav justify-content-end align-items-center">
							<li class="nav-item">
								<button class="btn btn-secondary" type="button"
									onclick="history.back()">
									<i class="bi bi-arrow-left"></i> Volver
								</button>
							</li>

							<li class="nav-item">
								<button type="submit" class="btn btn-danger">
									<i class="bi bi-box-arrow-right"></i> Cerrar sesión
								</button>
							</li>
						</ul>
					</form>
				</div>
			</nav>
		</header>
	</nav>
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6">
				<div class="mb-3">
					<h5 class="card-title">Lista solicitudes</h5>
				</div>
			</div>
		</div>
		<div class="row">
			<form method="get" action="ListaSolicitudesServlet">
				<div class="form-group">
					<label for="estado">Filtrar por estado:</label> <select
						name="estadoFiltrado" onchange="this.form.submit()">
						<option value="" selected>--Seleccione una opción--</option>
						<option value="todas">Todas</option>
						<option value="pendiente">Pendiente</option>
						<option value="aprobado">Aprobada</option>
						<option value="rechazado">Rechazada</option>
					</select>

				</div>

			</form>

			<div class="col-lg-12">
				<div class="">
					<div class="table-responsive">
						<table
							class="table project-list-table table-nowrap align-middle table-borderless">
							<thead>
								<tr>
									<th scope="col" class="ps-4" style="width: 50px;">
										<div class="form-check font-size-16"></div>
									</th>
									<th scope="col">Nombre</th>
									<th scope="col">Fecha inicio</th>
									<th scope="col">Fecha fin</th>
									<th scope="col">Descripción</th>
									<th scope="col">Estado</th>
									<th scope="col" style="width: 200px;">Acción</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${solicitudes}" var="solicitud">
									<tr>
										<th scope="row" class="ps-4">
											<div class="form-check font-size-16"></div>
										</th>
										<td>${solicitud.nombre} ${solicitud.apellidos}</td>
										<td>${solicitud.fechaInicio}</td>
										<td>${solicitud.fechaFin}</td>
										<td>${solicitud.descripcion}</td>
										<td><c:if test="${solicitud.estado == 'aprobado'}">
												<span class="badge badge-soft-success mb-0 d-block">Aprobado</span>
											</c:if> <c:if test="${solicitud.estado == 'pendiente'}">
												<span class="badge badge-soft-warning mb-0 d-block">Pendiente</span>
											</c:if> <c:if test="${solicitud.estado == 'rechazado'}">
												<span class="badge badge-soft-danger mb-0 d-block">Rechazado</span>
											</c:if></td>
											<td>
											<ul class="list-inline mb-0 d-flex align-items-center">
												<c:if
													test="${permisos.contains('modificar_solicitud') && solicitud.estado == 'pendiente'}">
													<c:choose>
														<c:when
															test="${permisos.contains('modificar_solicitud') && solicitud.estado == 'pendiente'}">
															<form action="EdicionSolicitud" method="get"
																class="form-editar">
																<input type="hidden" name="id" value="${solicitud.id}">
																<button type="submit" class="btn btn-primary"
																	style="display: none;"></button>
															</form>
															<li class="list-inline-item"><a
																href="javascript:void(0);" data-bs-toggle="tooltip"
																data-bs-placement="top" title="Edit"
																class="px-2 text-primary"
																onclick="document.querySelector('.form-editar button').click();">
																	<i class="bx bx-pencil font-size-18"></i>
															</a></li>
															<li class="list-inline-item">
																<form action="EliminarSolicitud" method="post"
																	class="form-eliminar d-inline">
																	<input type="hidden" name="id" value="${solicitud.id}">
																	<button type="submit" class="btn btn-link text-danger"
																		data-bs-toggle="tooltip" data-bs-placement="top"
																		title="Eliminar">
																		<i class="bx bx-trash-alt font-size-18"></i>
																	</button>
																</form>
															</li>
														</c:when>
														<c:otherwise>
															<!-- Solo muestra el botón de Aprobar -->
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${permisos.contains('aprobar_solicitud')&& solicitud.estado == 'pendiente'}">
													<c:choose>
														<c:when test="${permisos.contains('aprobar_solicitud')}">
															<li class="list-inline-item">
																<form action="AceptarSolicitud" method="post"
																	class="form-aprobar d-inline">
																	<input type="hidden" name="id" value="${solicitud.id}">
																	<button type="submit" class="btn btn-link text-success"
																		data-bs-toggle="tooltip" data-bs-placement="top"
																		title="Aprobar">
																		<i class="bx bx-check font-size-18"></i>
																	</button>
																</form>
															</li>
															<li class="list-inline-item">
																<form action="RechazarSolicitud" method="post"
																	class="form-rechazar d-inline">
																	<input type="hidden" name="id" value="${solicitud.id}">
																	<button type="submit" class="btn btn-link text-danger"
																		data-bs-toggle="tooltip" data-bs-placement="top"
																		title="Rechazar">
																		<i class="bx bx-x font-size-18"></i>
																	</button>
																</form>
															</li>
														</c:when>
														<c:otherwise>
															<!-- No tiene permiso para editar, eliminar o aprobar la solicitud -->
														</c:otherwise>
													</c:choose>
												</c:if>
											</ul>
										</td>
											
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
<% String estadoFiltrado = (String) request.getAttribute("estadoFiltrado");
if ((Integer) request.getAttribute("totalRecords") > 8) { %>
    <div class="col-lg-12">
        <nav aria-label="Page navigation">
         <ul class="pagination justify-content-center">

                <% int totalPages = (Integer) request.getAttribute("totalPages");
                for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item">
                        <a class="page-link" href="<%= request.getContextPath() %>/ListaSolicitudesServlet?page=<%= i %>&estadoFiltrado=<%= estadoFiltrado %>"><%= i %></a>
                    </li>
                <% } %>
            </ul>
        </nav>
    </div>
<% } %>


				
			</div>
		</div>
	</div>
</body>
</html>