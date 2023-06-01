<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
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
.form-check-input[type="radio"]:checked, 
.form-check-input[type="checkbox"]:checked {
  background-color: #03D069;
  border-color: #03D069;
}

.custom-radio:checked {
  background-color: #03D069;
  border-color: #03D069;
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

.form-container {
	margin-top: 50px;
}

.btn-center {
	display: flex;
	justify-content: center;
}

.navbar-custom {
	background-color: white;
}
</style>
<!-- Comprueba que el valor introducido en el campo "contrasena" coincide con el valor introducido en el campo "confirmarContrasena" 
y que la longitud de la contraseña introducida es de al menos 8 caracteres. -->
<script>
	function validarFormulario() {
		var contrasena = document.getElementById("contrasena").value;
		var confirmarContrasena = document
				.getElementById("confirmarContrasena").value;

		if (contrasena != confirmarContrasena) {
			alert("Las contraseñas no coinciden.");
			return false;
		}
		var passwordLengthError = document
				.querySelector("#password-length-error");
		if (contrasena.length < 8) {
			passwordLengthError.style.display = "block";
			return false;
		} else {
			passwordLengthError.style.display = "none";
			return true;
		}
	}
</script>
</head>
<body>
	<header style="background: white">
		<nav class="navbar navbar-expand-lg ">
			<div class="container-fluid">
				<h1>
					      <img src="images/logo2.png"
					alt="Logo de Vacatio Manager" width="340" height="90">
				</h1>


			</div>
		</nav>
	</header>
	<div class="container" >
		<div id="template-bg-1">
			<div
				class="d-flex flex-column min-vh-100 justify-content-center align-items-center">
				<div
					class="card p-4 text-dark  mb-5 col-md-8 col-lg-6 d-flex justify-content-center align-items-center">
					<h4>Registro</h4>

					<form action="ProcesarRegistro" method="post"
						onsubmit="return validarFormulario()">

						<div class="form-group col-24">
							<label for="nombre">Nombre:</label> <input type="text"
								class="form-control" id="nombre" name="nombre" required>
						</div>
						<div class="form-group col-12">
							<label for="apellidos">Apellidos:</label> <input type="text"
								class="form-control" id="apellidos" name="apellidos" required>
						</div>
						<div class="form-group col-12">
							<label for="usuario">Correo electrónico:</label> <input
								type="email" class="form-control" id="usuario" name="usuario"
								required>
						</div>
						<div class="form-group col-12">
							<label for="contrasena">Contraseña:</label> <input
								type="password" class="form-control" id="contrasena"
								name="contrasena" required>
						</div>
						<div class="form-group col-12">
							<label for="confirmarContrasena">Confirmar contraseña:</label> <input
								type="password" class="form-control" id="confirmarContrasena"
								name="confirmarContrasena" required>
							<div id="password-length-error"
								style="display: none; color: red;">La contraseña debe
								tener al menos 8 caracteres.</div>
						</div>

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="tipoUsuario"
								id="empleado" value="empleado" checked> <label
								class="form-check-label" for="empleado">Empleado</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="tipoUsuario"
								id="gerente" value="gerente"> <label
								class="form-check-label" for="gerente">Gerente</label>
						</div>
						<div class="btn-center">
							<button type="submit" class="btn btn-primary mt-3">Registrarse</button>
						</div>
					</form>
					<div class="text-center mt-3">
						<p>
							¿Ya tienes una cuenta? <a href="Login.jsp">Inicia sesión</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

