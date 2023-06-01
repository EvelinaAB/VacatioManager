<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edición perfil</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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


}
</style>
</head>
<body>
<body>
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
	<form action="EdicionPerfil" method="post">
	<div class="card">
		<div class="card-body">
			<div class="form-group">
				<label for="nombre">Nombre:</label> <input type="text"
					class="form-control form-control-sm" id="nombre" name="nombre"
					value="${usuario.nombre}" style="width: 25%;">
			</div>
			<div class="form-group">
				<label for="apellidos">Apellidos:</label> <input type="text"
					class="form-control form-control-sm" id="apellidos" name="apellidos"
					value="${usuario.apellidos}" style="width: 25%;">
			</div>
			<div class="form-group">
				<label for="correo">Correo electrónico:</label><input type="email"
					class="form-control form-control-sm" id="usuario" name="usuario"
					value="${usuario.usuario}" style="width: 25%;">
			</div>
			<div class="btn-group mt-3">
				<button type="submit" class="btn btn-primary btn-sm">Guardar
					cambios</button>
			</div>
		</div>
	</div>
</form>
</body>
</body>
</html>