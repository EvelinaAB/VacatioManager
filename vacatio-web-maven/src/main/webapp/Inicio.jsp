<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vacatio Manager</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<link rel="stylesheet" href="style2.css" type="text/css">
</head>
<style>
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
<body style="background:white; border-radius:10px;">
	<header style="background: white">
		<nav class="navbar navbar-expand-lg navbar-light ">
			<div class="container-fluid">
				 <img src="images/logo2.png"
					alt="Logo de Vacatio Manager" width="340" height="90">
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item" ><a class="nav-link me-3"
							href="Registro.jsp">Registrarse</a></li>
						<li class="nav-item"><a class="nav-link me-5" href="Login.jsp">Iniciar
								sesión</a></li>
					</ul>
				</div>

			</div>
		</nav>
	</header>

	<main class="container" >
		<div class="row mt-5">
			<div class="col-md-6">
				<h1 style="color:#03D069;">Bienvenido a Vacatio Manager</h1>
				<p >Vacatio Manager es una herramienta eficiente para la gestión
					de ausencias laborales en empresas de todos los tamaños. Nuestra
					plataforma fácil de usar permite a los
					empleados solicitar días de ausencia, consultar el calendario y
					revisar su historial de días solicitados de manera rápida y
					sencilla.</p>

				<h2 style="color:#03D069;">Características principales</h2>
				<ul>
					<li style="color:#4D4D4D;"><strong>Solicitudes de ausencia simplificadas:</strong>
						Los empleados pueden enviar solicitudes de ausencia con unos pocos
						clics y recibir una respuesta rápida de sus superiores.</li>
					<li style="color:#4D4D4D;"><strong>Calendario accesible:</strong> La aplicación
						proporciona un calendario fácil de leer que muestra las ausencias
						programadas, permitiendo a los usuarios una
						visión clara de la disponibilidad y planificación de recursos.</li>
					<li style="color:#4D4D4D;"><strong>Historial de días solicitados:</strong> Los
						empleados pueden revisar su historial de días de ausencia
						solicitados, lo que les permite llevar un control de su tiempo
						libre y planificar sus futuras ausencias de manera adecuada.</li>
				</ul>

				<p style="color:#4D4D4D;">Al utilizar Vacatio Manager, las empresas pueden ahorrar
					tiempo, reducir el estrés y mejorar la comunicación en torno a la
					planificación de ausencias laborales. Regístrate hoy y descubre
					cómo Vacatio Manager puede facilitar la gestión de ausencias en tu
					empresa.</p>
					<p class="text-center">
    <a href="Registro.jsp" class="btn btn-primary">Empezar</a>
</p>
					


			</div>
		
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>
