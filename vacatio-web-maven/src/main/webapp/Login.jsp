<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio de sesión</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>

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
	<%
	if (request.getParameter("error") != null) {
	%>
	<div class="alert alert-danger">Credenciales incorrectas.
		Inténtelo de nuevo.</div>
	<%
	}
	%>
	<div class="container" >
		<div id="template-bg-1">
		
			<div
				class="d-flex flex-column min-vh-100 justify-content-center align-items-center" >
				<div class="card p-4 text-dark mb-5 col-md-8 col-lg-6 d-flex justify-content-center align-items-center"">
  <h4>Iniciar sesión</h4>

  <form name="login" action="Principal" method="get">
    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fas fa-user mt-2"></i></span>
      <input type="text" class="form-control" id="usuario" placeholder="Correo electrónico" name="usuario">
    </div>
    <div class="input-group mb-3">
      <span class="input-group-text"><i class="fas fa-key mt-2"></i></span>
      <input type="password" id="contrasena" class="form-control" placeholder="Contraseña" name="contrasena">
    </div>
    <div class="mb-3 d-flex justify-content-center">
      <input type="submit" value="Acceder" class="btn btn-primary w-50" name="login-btn">
    </div>
  </form>

  <p class="text-center">
    ¿No tienes una cuenta? <a href="Registro.jsp">Regístrate aquí</a>.
  </p>
</div>

			</div>
		</div>
	</div>
</body>
</html>