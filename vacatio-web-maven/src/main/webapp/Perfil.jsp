
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
<link rel="stylesheet" href="style2.css" type="text/css">
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


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Perfil usuario</title>
<style>
.container {
	margin-top: 0px;
}

.nav-item {
	margin-right: 10px;
}

.container {
	font-size: 14px;
	/* ajusta el tamaño de fuente del contenedor */
}

table {
	font-size: 9px;
}

th, td {
	padding: 2px;
	border: 1px;
}

td[data-fecha] a {
	text-decoration: none;
	color: black;
}

.navbar-custom {
	background-color: white;
}

.icono-perfil {
	font-size: 2rem;
}
.icono-perfil{
font-size: 2rem;
  color: #03D069;

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

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">${usuario.nombre} ${usuario.apellidos}</h5>
			<strong><p class="card-text">${usuario.rol}</p></strong>
			<div class="form-group">
				Correo electrónico: ${usuario.usuario}
			
			</div>
		

			<div class="btn-group mt-3">
				<a href="EdicionPerfil" class="btn btn-primary btn-sm">Editar
					perfil</a>
			</div>
			<div class="btn-group mt-3">
				<a href="CambioContrasena.jsp" class="btn btn-secondary btn-sm">Cambiar
					contraseña</a>
			</div>
		</div>
	</div>


</body>
</html>