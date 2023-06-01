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
<title>Edición de solicitud</title>
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
.navbar-custom {
  background-color:white;
}
.btn-primary {
  background-color: #03D069;
  border-color: #03D069;
}
.btn-primary:hover {
  background-color: #02b25a;
  transition: background-color 0.3s ease-in-out;
    border-color: #03D069;
}
</style>
</head>
<body style="background-color: #eee;">
	<nav>
		<header style="background: white">
			<nav class="navbar navbar-expand-lg ">
				<div class="container-fluid">
					<h1>
					 <a href="CalendarioFechas">
                     <img src="images/logo2.png"
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
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="card mt-5">
					<div class="card-header">
						<h5 class="text-center">Editar Solicitud</h5>
					</div>
					<div class="card-body">
						<form action="EdicionSolicitud?id=${solicitud.id}" method="post">

							<div class="mb-3">
								<label for="fechaInicio" class="form-label">Fecha de
									Inicio:</label> <input type="date" class="form-control"
									id="fechaInicio" name="fecha_inicio"
									value="${solicitud.fechaInicio}" required>
							</div>
							<div class="mb-3">
								<label for="fechaFin" class="form-label">Fecha de Fin:</label> <input
									type="date" class="form-control" id="fechaFin" name="fecha_fin"
									value="${solicitud.fechaFin}" required>
							</div>
							<div class="mb-3">
								<label for="descripcion" class="form-label">Descripción:</label>
								<textarea class="form-control" id="descripcion"
									name="descripcion" rows="3">${solicitud.descripcion}</textarea>
							</div>
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<button class="btn btn-primary me-md-2" type="submit"
									name="aplicar">Aplicar</button>
								<button class="btn btn-secondary" type="button"
									onclick="window.location.href='ListaSolicitudesServlet';">Cancelar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>