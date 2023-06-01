
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>Menu principal</title>
<style>
.tableCalendar {
	width: 60%;
	height: 60%;
	font-size: 16px;
	cellpadding: 0;
	border-spacing: 0px;
	  padding-left: -10px;
  padding-right: -10px;
  color:#4D4D4D;

}
.tableCalendar td,th {
  text-align: center;
}


.btn-outline-primary {
    color: #03D069;
    background-color: transparent;
    border-color: #03D069;
}

.btn-outline-primary:hover {
    color: #fff;
    background-color: #03D069;
    border-color: #03D069;
}

.btn-outline-primary:focus {
    outline: none;
    box-shadow: none;
}
.icono-perfil {
  color: #03D069;
}



.container {
	margin-top: 10px;
	color:#4D4D4D;
}

.nav-item {
	margin-right: 10px;
}

.container {
  margin-top: 60px;
	font-size: 10px;
	/* ajusta el tamaño de fuente del contenedor */
	padding: 10px;
	background: white;
	border-radius: 6px;
}

th, td {
	padding: 0px;
	border: none;
	color:#4D4D4D;
}

td[data-fecha] a {
	text-decoration: none;
	color: black;
}


.icono-perfil {
	font-size: 2rem;
}

header {
	height: 100px;
	background: white;
}

body {
	margin-top: 0;
}
.col-md-3{
marigin:50px;

}
.gutter [class^="col-"] {
    padding-right: 0px;
    padding-left: 0px;
    padding-top:10px;
}
.festivo{
background:#7EC5E4 ;

}

.row.mb-4 {
     padding-right: 50px;
    padding-left: 60px;
    padding-top:10px;
}

.row.gutter{
padding-bottom:30px;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg ">
			<div class="container-fluid">
				<h1>
					<a href="CalendarioFechas">  <img src="images/logo2.png"
					alt="Logo de Vacatio Manager" width="340" height="90">
					</a>
				</h1>
				<form action="CerrarSesion" method="post">
					<ul class="nav justify-content-end align-items-center">
						<li class="nav-item"><a href="Perfil" class="nav-link"><i
								class="bi bi-person-circle icono-perfil""></i></a></li>
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



	<div class="container mb-3">
		
			<div class="row mb-4">
				<!-- Comprueba si el usuario tiene permiso de crear solicitud, si tiene el permiso, muestra los días disponibles de vacaciones-->

				<div class="col-md-2">
					<div>
						<div class="card-body">
							<h6 class="card-title d-inline align-middle">Días
								disponibles:</h6>
							<h6 class="card-title d-inline align-middle">${diasDisponibles}</h6>
						</div>
					</div>
				</div>

				<div class="col-md-10">
					<ul class="nav justify-content-end">

						<li class="nav-item"><a href="Solicitud.jsp"
							class="btn btn-outline-primary"> <i class="bi bi-plus"></i>
								Nueva Solicitud
						</a></li>

						<li class="nav-item"><a href="ListaSolicitudesServlet"
							class="btn btn-outline-primary"> <i class="bi bi-list"></i>
								Lista de Solicitudes
						</a></li>
					</ul>
				</div>
			</div>
		
		<div class="row gutter">
			<div class="col-md-3">
				<h6 class="text-center">Enero</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">26</td>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td class="text-muted">1</td>
						</tr>
						<tr>
							<td data-fecha="2023-01-02"><a
								href="Solicitud.jsp?fechaInicio=2023-01-02">2</a></td>
							<td data-fecha="2023-01-03"><a
								href="Solicitud.jsp?fechaInicio=2023-01-03">3</a></td>
							<td data-fecha="2023-01-04"><a
								href="Solicitud.jsp?fechaInicio=2023-01-04">4</a></td>
							<td data-fecha="2023-01-05"><a
								href="Solicitud.jsp?fechaInicio=2023-01-05">5</a></td>
							<td class="festivo">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
						</tr>
						<tr>
							<td data-fecha="2023-01-09"><a
								href="Solicitud.jsp?fechaInicio=2023-01-09">9</a></td>
							<td data-fecha="2023-01-10"><a
								href="Solicitud.jsp?fechaInicio=2023-01-10">10</a></td>
							<td data-fecha="2023-01-11"><a
								href="Solicitud.jsp?fechaInicio=2023-01-11">11</a></td>
							<td data-fecha="2023-01-12"><a
								href="Solicitud.jsp?fechaInicio=2023-01-12">12</a></td>
							<td data-fecha="2023-01-13"><a
								href="Solicitud.jsp?fechaInicio=2023-01-13">13</a></td>
							<td class="text-muted">14</td>
							<td class="text-muted">15</td>
						</tr>
						<tr>
							<td data-fecha="2023-01-16"><a
								href="Solicitud.jsp?fechaInicio=2023-01-16">16</a></td>
							<td data-fecha="2023-01-17"><a
								href="Solicitud.jsp?fechaInicio=2023-01-17">17</a></td>
							<td data-fecha="2023-01-18"><a
								href="Solicitud.jsp?fechaInicio=2023-01-18">18</a></td>
							<td data-fecha="2023-01-19"><a
								href="Solicitud.jsp?fechaInicio=2023-01-19">19</a></td>
							<td data-fecha="2023-01-20"><a
								href="Solicitud.jsp?fechaInicio=2023-01-20">20</a></td>
							<td class="text-muted">21</td>
							<td class="text-muted">22</td>
						</tr>
						<tr>
							<td data-fecha="2023-01-23"><a
								href="Solicitud.jsp?fechaInicio=2023-01-23">23</a></td>
							<td data-fecha="2023-01-24"><a
								href="Solicitud.jsp?fechaInicio=2023-01-24">24</a></td>
							<td data-fecha="2023-01-25"><a
								href="Solicitud.jsp?fechaInicio=2023-01-25">25</a></td>
							<td data-fecha="2023-01-26"><a
								href="Solicitud.jsp?fechaInicio=2023-01-26">26</a></td>
							<td data-fecha="2023-01-27"><a
								href="Solicitud.jsp?fechaInicio=2023-01-27">27</a></td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
						</tr>
						<tr>
							<td data-fecha="2023-01-30"><a
								href="Solicitud.jsp?fechaInicio=2023-01-30">30</a></td>
							<td data-fecha="2023-01-31"><a
								href="Solicitud.jsp?fechaInicio=2023-01-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Febrero</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td data-fecha="2023-02-01"><a
								href="Solicitud.jsp?fechaInicio=2023-02-01">1</a></td>
							<td data-fecha="2023-02-02"><a
								href="Solicitud.jsp?fechaInicio=2023-02-02">2</a></td>
							<td data-fecha="2023-02-03"><a
								href="Solicitud.jsp?fechaInicio=2023-02-03">3</a></td>
							<td data-fecha="2023-02-04"><a
								href="Solicitud.jsp?fechaInicio=2023-02-04">4</a></td>
							<td data-fecha="2023-02-05"><a
								href="Solicitud.jsp?fechaInicio=2023-02-05">5</a></td>
						</tr>
						<tr>
							<td data-fecha="2023-02-06"><a
								href="Solicitud.jsp?fechaInicio=2023-02-06">6</a></td>
							<td data-fecha="2023-02-07"><a
								href="Solicitud.jsp?fechaInicio=2023-02-07">7</a></td>
							<td data-fecha="2023-02-08"><a
								href="Solicitud.jsp?fechaInicio=2023-02-08">8</a></td>
							<td data-fecha="2023-02-09"><a
								href="Solicitud.jsp?fechaInicio=2023-02-09">9</a></td>
							<td data-fecha="2023-02-10"><a
								href="Solicitud.jsp?fechaInicio=2023-02-10">10</a></td>
							<td class="text-muted">11</td>
							<td class="text-muted">12</td>
						</tr>
						<tr>
							<td data-fecha="2023-02-13"><a
								href="Solicitud.jsp?fechaInicio=2023-02-13">13</a></td>
							<td data-fecha="2023-02-14"><a
								href="Solicitud.jsp?fechaInicio=2023-02-14">14</a></td>
							<td data-fecha="2023-02-15"><a
								href="Solicitud.jsp?fechaInicio=2023-02-15">15</a></td>
							<td data-fecha="2023-02-16"><a
								href="Solicitud.jsp?fechaInicio=2023-02-16">16</a></td>
							<td data-fecha="2023-02-17"><a
								href="Solicitud.jsp?fechaInicio=2023-02-17">17</a></td>
							<td class="text-muted">18</td>
							<td class="text-muted">19</td>
						</tr>
						<tr>
							<td data-fecha="2023-02-20"><a
								href="Solicitud.jsp?fechaInicio=2023-02-20">20</a></td>
							<td data-fecha="2023-02-21"><a
								href="Solicitud.jsp?fechaInicio=2023-02-21">21</a></td>
							<td data-fecha="2023-02-22"><a
								href="Solicitud.jsp?fechaInicio=2023-02-22">22</a></td>
							<td data-fecha="2023-02-23"><a
								href="Solicitud.jsp?fechaInicio=2023-02-23">23</a></td>
							<td data-fecha="2023-02-24"><a
								href="Solicitud.jsp?fechaInicio=2023-02-24">24</a></td>
							<td class="text-muted">25</td>
							<td class="text-muted">26</td>
						</tr>
						<tr>
							<td data-fecha="2023-02-27"><a
								href="Solicitud.jsp?fechaInicio=2023-02-27">27</a></td>
							<td data-fecha="2023-02-28"><a
								href="Solicitud.jsp?fechaInicio=2023-02-28">28</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
						</tr>
						<tr>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
							<td class="text-muted">11</td>
							<td class="text-muted">12</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Marzo</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td data-fecha="2023-03-01"><a
								href="Solicitud.jsp?fechaInicio=2023-03-01">1</a></td>
							<td data-fecha="2023-03-02"><a
								href="Solicitud.jsp?fechaInicio=2023-03-02">2</a></td>
							<td data-fecha="2023-03-03"><a
								href="Solicitud.jsp?fechaInicio=2023-03-03">3</a></td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
						</tr>
						<tr>
							<td data-fecha="2023-03-06"><a
								href="Solicitud.jsp?fechaInicio=2023-03-06">6</a></td>
							<td data-fecha="2023-03-07"><a
								href="Solicitud.jsp?fechaInicio=2023-03-07">7</a></td>
							<td data-fecha="2023-03-08"><a
								href="Solicitud.jsp?fechaInicio=2023-03-08">8</a></td>
							<td data-fecha="2023-03-09"><a
								href="Solicitud.jsp?fechaInicio=2023-03-09">9</a></td>
							<td data-fecha="2023-03-10"><a
								href="Solicitud.jsp?fechaInicio=2023-03-10">10</a></td>
							<td class="text-muted">11</td>
							<td class="text-muted">12</td>
						</tr>
						<tr>
							<td data-fecha="2023-03-13"><a
								href="Solicitud.jsp?fechaInicio=2023-03-13">13</a></td>
							<td data-fecha="2023-03-14"><a
								href="Solicitud.jsp?fechaInicio=2023-03-14">14</a></td>
							<td data-fecha="2023-03-15"><a
								href="Solicitud.jsp?fechaInicio=2023-03-15">15</a></td>
							<td data-fecha="2023-03-16"><a
								href="Solicitud.jsp?fechaInicio=2023-03-16">16</a></td>
							<td data-fecha="2023-03-17"><a
								href="Solicitud.jsp?fechaInicio=2023-03-17">17</a></td>
							<td class="text-muted">18</td>
							<td class="text-muted">19</td>
						</tr>
						<tr>
							<td class="festivo">20</td>
							<td data-fecha="2023-03-21"><a
								href="Solicitud.jsp?fechaInicio=2023-03-21">21</a></td>
							<td data-fecha="2023-03-22"><a
								href="Solicitud.jsp?fechaInicio=2023-03-22">22</a></td>
							<td data-fecha="2023-03-03"><a
								href="Solicitud.jsp?fechaInicio=2023-03-23">23</a></td>
							<td data-fecha="2023-03-24"><a
								href="Solicitud.jsp?fechaInicio=2023-03-24">24</a></td>
							<td class="text-muted">25</td>
							<td class="text-muted">26</td>
						</tr>
						<tr>
							<td data-fecha="2023-03-27"><a
								href="Solicitud.jsp?fechaInicio=2023-27">27</a></td>
							<td data-fecha="2023-03-28"><a
								href="Solicitud.jsp?fechaInicio=2023-03-28">28</a></td>
							<td data-fecha="2023-03-29"><a
								href="Solicitud.jsp?fechaInicio=2023-03-29">29</a></td>
							<td data-fecha="2023-03-30"><a
								href="Solicitud.jsp?fechaInicio=2023-03-30">30</a></td>
							<td data-fecha="2023-03-31"><a
								href="Solicitud.jsp?fechaInicio=2023-03-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
						</tr>
						<tr>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Abril</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
						</tr>
						<tr>
							<td data-fecha="2023-04-03"><a
								href="Solicitud.jsp?fechaInicio=2023-04-03">3</a></td>
							<td data-fecha="2023-04-04"><a
								href="Solicitud.jsp?fechaInicio=2023-04-04">4</a></td>
							<td data-fecha="2023-04-05"><a
								href="Solicitud.jsp?fechaInicio=2023-04-05">5</a></td>
							<td class="festivo">6</td>
							<td class="festivo">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
						</tr>
						<tr>
							<td data-fecha="2023-04-10"><a
								href="Solicitud.jsp?fechaInicio=2023-04-10">10</a></td>
							<td data-fecha="2023-04-11"><a
								href="Solicitud.jsp?fechaInicio=2023-04-11">11</a></td>
							<td data-fecha="2023-04-12"><a
								href="Solicitud.jsp?fechaInicio=2023-04-12">12</a></td>
							<td data-fecha="2023-04-13"><a
								href="Solicitud.jsp?fechaInicio=2023-04-13">13</a></td>
							<td data-fecha="2023-04-14"><a
								href="Solicitud.jsp?fechaInicio=2023-04-14">14</a></td>
							<td class="text-muted">15</td>
							<td class="text-muted">16</td>
						</tr>
						<tr>
							<td data-fecha="2023-04-17"><a
								href="Solicitud.jsp?fechaInicio=2023-04-17">17</a></td>
							<td data-fecha="2023-04-18"><a
								href="Solicitud.jsp?fechaInicio=2023-04-18">18</a></td>
							<td data-fecha="2023-04-19"><a
								href="Solicitud.jsp?fechaInicio=2023-04-19">19</a></td>
							<td data-fecha="2023-04-20"><a
								href="Solicitud.jsp?fechaInicio=2023-04-20">20</a></td>
							<td data-fecha="2023-04-21"><a
								href="Solicitud.jsp?fechaInicio=2023-04-21">21</a></td>
							<td class="text-muted">22</td>
							<td class="text-muted">23</td>
						</tr>
						<tr>
							<td data-fecha="2023-04-24"><a
								href="Solicitud.jsp?fechaInicio=2023-04-24">24</a></td>
							<td data-fecha="2023-04-25"><a
								href="Solicitud.jsp?fechaInicio=2023-04-25">25</a></td>
							<td data-fecha="2023-04-26"><a
								href="Solicitud.jsp?fechaInicio=2023-04-26">26</a></td>
							<td data-fecha="2023-04-27"><a
								href="Solicitud.jsp?fechaInicio=2023-04-27">27</a></td>
							<td data-fecha="2023-04-28"><a
								href="Solicitud.jsp?fechaInicio=2023-04-28">28</a></td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
						</tr>
						<tr>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Mayo</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="festivo">1</td>
							<td class="festivo">2</td>
							<td data-fecha="2023-05-03"><a
								href="Solicitud.jsp?fechaInicio=2023-05-03">3</a></td>
							<td data-fecha="2023-05-4"><a
								href="Solicitud.jsp?fechaInicio=2023-05-04">4</a></td>
							<td data-fecha="2023-05-05"><a
								href="Solicitud.jsp?fechaInicio=2023-05-05">5</a></td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
						</tr>
						<tr>
							<td data-fecha="2023-05-08"><a
								href="Solicitud.jsp?fechaInicio=2023-05-08">8</a></td>
							<td data-fecha="2023-05-09"><a
								href="Solicitud.jsp?fechaInicio=2023-05-09">9</a></td>
							<td data-fecha="2023-05-10"><a
								href="Solicitud.jsp?fechaInicio=2023-05-10">10</a></td>
							<td data-fecha="2023-05-11"><a
								href="Solicitud.jsp?fechaInicio=2023-05-11">11</a></td>
							<td data-fecha="2023-05-12"><a
								href="Solicitud.jsp?fechaInicio=2023-05-12">12</a></td>
							<td class="text-muted">13</td>
							<td class="text-muted">14</td>
						</tr>
						<tr>
							<td class="festivo">15</td>
							<td data-fecha="2023-05-16"><a
								href="Solicitud.jsp?fechaInicio=2023-05-16">16</a></td>
							<td data-fecha="2023-05-17"><a
								href="Solicitud.jsp?fechaInicio=2023-05-17">17</a></td>
							<td data-fecha="2023-05-18"><a
								href="Solicitud.jsp?fechaInicio=2023-05-18">18</a></td>
							<td data-fecha="2023-05-19"><a
								href="Solicitud.jsp?fechaInicio=2023-05-19">19</a></td>
							<td class="text-muted">20</td>
							<td class="text-muted">21</td>
						</tr>
						<tr>
							<td data-fecha="2023-05-22"><a
								href="Solicitud.jsp?fechaInicio=2023-05-22">22</a></td>
							<td data-fecha="2023-05-23"><a
								href="Solicitud.jsp?fechaInicio=2023-05-23">23</a></td>
							<td data-fecha="2023-05-24"><a
								href="Solicitud.jsp?fechaInicio=2023-05-24">24</a></td>
							<td data-fecha="2023-05-25"><a
								href="Solicitud.jsp?fechaInicio=2023-05-25">25</a></td>
							<td data-fecha="2023-05-26"><a
								href="Solicitud.jsp?fechaInicio=2023-05-26">3</a></td>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
						</tr>
						<tr>
							<td data-fecha="2023-05-29"><a
								href="Solicitud.jsp?fechaInicio=2023-05-29">29</a></td>
							<td data-fecha="2023-05-30"><a
								href="Solicitud.jsp?fechaInicio=2023-05-30">30</a></td>
							<td data-fecha="2023-05-31"><a
								href="Solicitud.jsp?fechaInicio=2023-05-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
						</tr>
						<tr>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
							<td class="text-muted">11</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Junio</h6>
			<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td data-fecha="2023-06-01"><a
								href="Solicitud.jsp?fechaInicio=2023-06-01">1</a></td>
							<td data-fecha="2023-06-02"><a
								href="Solicitud.jsp?fechaInicio=2023-06-02">2</a></td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
						</tr>
						<tr>
							<td data-fecha="2023-06-05"><a
								href="Solicitud.jsp?fechaInicio=2023-06-05">5</a></td>
							<td data-fecha="2023-06-06"><a
								href="Solicitud.jsp?fechaInicio=2023-06-06">6</a></td>
							<td data-fecha="2023-06-07"><a
								href="Solicitud.jsp?fechaInicio=2023-06-07">7</a></td>
							<td data-fecha="2023-06-08"><a
								href="Solicitud.jsp?fechaInicio=2023-06-08">8</a></td>
							<td data-fecha="2023-06-09"><a
								href="Solicitud.jsp?fechaInicio=2023-06-09">9</a></td>
							<td class="text-muted">10</td>
							<td class="text-muted">11</td>
						</tr>
						<tr>
							<td data-fecha="2023-06-12"><a
								href="Solicitud.jsp?fechaInicio=2023-06-12">12</a></td>
							<td data-fecha="2023-06-13"><a
								href="Solicitud.jsp?fechaInicio=2023-06-13">13</a></td>
							<td data-fecha="2023-06-14"><a
								href="Solicitud.jsp?fechaInicio=2023-06-14">14</a></td>
							<td data-fecha="2023-06-15"><a
								href="Solicitud.jsp?fechaInicio=2023-06-15">15</a></td>
							<td data-fecha="2023-06-16"><a
								href="Solicitud.jsp?fechaInicio=2023-06-16">16</a></td>
							<td class="text-muted">17</td>
							<td class="text-muted">18</td>
						</tr>
						<tr>
							<td data-fecha="2023-06-19"><a
								href="Solicitud.jsp?fechaInicio=2023-06-19">19</a></td>
							<td data-fecha="2023-06-20"><a
								href="Solicitud.jsp?fechaInicio=2023-06-20">20</a></td>
							<td data-fecha="2023-06-21"><a
								href="Solicitud.jsp?fechaInicio=2023-06-21">21</a></td>
							<td data-fecha="2023-06-22"><a
								href="Solicitud.jsp?fechaInicio=2023-06-22">22</a></td>
							<td data-fecha="2023-06-23"><a
								href="Solicitud.jsp?fechaInicio=2023-06-23">23</a></td>
							<td class="text-muted">24</td>
							<td class="text-muted">25</td>
						</tr>
						<tr>
							<td data-fecha="2023-06-26"><a
								href="Solicitud.jsp?fechaInicio=2023-06-26">26</a></td>
							<td data-fecha="2023-06-27"><a
								href="Solicitud.jsp?fechaInicio=2023-06-27">27</a></td>
							<td data-fecha="2023-06-28"><a
								href="Solicitud.jsp?fechaInicio=2023-06-28">28</a></td>
							<td data-fecha="2023-06-29"><a
								href="Solicitud.jsp?fechaInicio=2023-06-29">29</a></td>
							<td data-fecha="2023-06-30"><a
								href="Solicitud.jsp?fechaInicio=2023-06-30">30</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
						</tr>
						<tr>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Julio</h6>
			<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">26</td>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
						</tr>
						<tr>
							<td data-fecha="2023-07-03"><a
								href="Solicitud.jsp?fechaInicio=2023-07-03">3</a></td>
							<td data-fecha="2023-07-04"><a
								href="Solicitud.jsp?fechaInicio=2023-07-04">4</a></td>
							<td data-fecha="2023-07-05"><a
								href="Solicitud.jsp?fechaInicio=2023-07-05">5</a></td>
							<td data-fecha="2023-07-06"><a
								href="Solicitud.jsp?fechaInicio=2023-07-06">6</a></td>
							<td data-fecha="2023-07-07"><a
								href="Solicitud.jsp?fechaInicio=2023-07-07">7</a></td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
						</tr>
						<tr>
							<td data-fecha="2023-07-10"><a
								href="Solicitud.jsp?fechaInicio=2023-07-10">10</a></td>
							<td data-fecha="2023-07-11"><a
								href="Solicitud.jsp?fechaInicio=2023-07-11">11</a></td>
							<td data-fecha="2023-07-12"><a
								href="Solicitud.jsp?fechaInicio=2023-07-12">12</a></td>
							<td data-fecha="2023-07-13"><a
								href="Solicitud.jsp?fechaInicio=2023-07-13">13</a></td>
							<td data-fecha="2023-07-14"><a
								href="Solicitud.jsp?fechaInicio=2023-07-14">14</a></td>
							<td class="text-muted">15</td>
							<td class="text-muted">16</td>
						</tr>
						<tr>
							<td data-fecha="2023-07-17"><a
								href="Solicitud.jsp?fechaInicio=2023-07-17">17</a></td>
							<td data-fecha="2023-07-18"><a
								href="Solicitud.jsp?fechaInicio=2023-07-18">18</a></td>
							<td data-fecha="2023-07-19"><a
								href="Solicitud.jsp?fechaInicio=2023-07-19">19</a></td>
							<td data-fecha="2023-07-20"><a
								href="Solicitud.jsp?fechaInicio=2023-07-20">20</a></td>
							<td data-fecha="2023-07-21"><a
								href="Solicitud.jsp?fechaInicio=2023-07-21">21</a></td>
							<td class="text-muted">22</td>
							<td class="text-muted">23</td>
						</tr>
						<tr>
							<td data-fecha="2023-07-24"><a
								href="Solicitud.jsp?fechaInicio=2023-07-24">24</a></td>
							<td data-fecha="2023-07-25"><a
								href="Solicitud.jsp?fechaInicio=2023-07-25">25</a></td>
							<td data-fecha="2023-07-26"><a
								href="Solicitud.jsp?fechaInicio=2023-07-26">26</a></td>
							<td data-fecha="2023-07-27"><a
								href="Solicitud.jsp?fechaInicio=2023-07-27">27</a></td>
							<td data-fecha="2023-07-28"><a
								href="Solicitud.jsp?fechaInicio=2023-07-28">28</a></td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
						</tr>
						<tr>
							<td data-fecha="2023-07-31"><a
								href="Solicitud.jsp?fechaInicio=2023-07-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Agosto</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">31</td>
							<td data-fecha="2023-08-01"><a
								href="Solicitud.jsp?fechaInicio=2023-08-01">1</a></td>

							<td data-fecha="2023-08-02"><a
								href="Solicitud.jsp?fechaInicio=2023-08-02">2</a></td>

							<td data-fecha="2023-08-03"><a
								href="Solicitud.jsp?fechaInicio=2023-08-03">3</a></td>

							<td data-fecha="2023-08-04"><a
								href="Solicitud.jsp?fechaInicio=2023-08-04">4</a></td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
						</tr>
						<tr>

							<td data-fecha="2023-08-07"><a
								href="Solicitud.jsp?fechaInicio=2023-08-07">7</a></td>

							<td data-fecha="2023-08-08"><a
								href="Solicitud.jsp?fechaInicio=2023-08-08">8</a></td>

							<td data-fecha="2023-08-09"><a
								href="Solicitud.jsp?fechaInicio=2023-08-09">9</a></td>

							<td data-fecha="2023-08-10"><a
								href="Solicitud.jsp?fechaInicio=2023-08-10">10</a></td>

							<td data-fecha="2023-08-11"><a
								href="Solicitud.jsp?fechaInicio=2023-08-11">11</a></td>
							<td class="text-muted">12</td>
							<td class="text-muted">13</td>
						</tr>
						<tr>
							<td data-fecha="2023-08-14"><a
								href="Solicitud.jsp?fechaInicio=2023-08-14">14</a></td>
							<td class="festivo">15</td>
							<td data-fecha="2023-08-16"><a
								href="Solicitud.jsp?fechaInicio=2023-08-16">16</a></td>
							<td data-fecha="2023-08-17"><a
								href="Solicitud.jsp?fechaInicio=2023-08-17">17</a></td>
							<td data-fecha="2023-08-18"><a
								href="Solicitud.jsp?fechaInicio=2023-08-18">18</a></td>
							<td class="text-muted">19</td>
							<td class="text-muted">20</td>
						</tr>
						<tr>
							<td data-fecha="2023-08-21"><a
								href="Solicitud.jsp?fechaInicio=2023-08-21">21</a></td>
							<td data-fecha="2023-08-22"><a
								href="Solicitud.jsp?fechaInicio=2023-08-2">22</a></td>
							<td data-fecha="2023-08-23"><a
								href="Solicitud.jsp?fechaInicio=2023-08-23">23</a></td>
							<td data-fecha="2023-08-24"><a
								href="Solicitud.jsp?fechaInicio=2023-08-24">24</a></td>
							<td data-fecha="2023-08-25"><a
								href="Solicitud.jsp?fechaInicio=2023-08-25">25</a></td>
							<td class="text-muted">26</td>
							<td class="text-muted">27</td>
						</tr>
						<tr>
							<td data-fecha="2023-08-28"><a
								href="Solicitud.jsp?fechaInicio=2023-08-28">28</a></td>
							<td data-fecha="2023-08-29"><a
								href="Solicitud.jsp?fechaInicio=2023-08-29">29</a></td>
							<td data-fecha="2023-08-30"><a
								href="Solicitud.jsp?fechaInicio=2023-08-30">30</a></td>
							<td data-fecha="2023-08-31"><a
								href="Solicitud.jsp?fechaInicio=2023-08-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
						</tr>
						<tr>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Septiembre</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td data-fecha="2023-09-01"><a
								href="Solicitud.jsp?fechaInicio=2023-09-01">1</a></td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
						</tr>
						<tr>
							<td data-fecha="2023-09-04"><a
								href="Solicitud.jsp?fechaInicio=2023-09-04">4</a></td>
							<td data-fecha="2023-09-05"><a
								href="Solicitud.jsp?fechaInicio=2023-09-05">5</a></td>
							<td data-fecha="2023-09-06"><a
								href="Solicitud.jsp?fechaInicio=2023-09-06">6</a></td>
							<td data-fecha="2023-09-07"><a
								href="Solicitud.jsp?fechaInicio=2023-09-07">7</a></td>
							<td data-fecha="2023-09-08"><a
								href="Solicitud.jsp?fechaInicio=2023-09-08">8</a></td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
						</tr>
						<tr>
							<td data-fecha="2023-09-11"><a
								href="Solicitud.jsp?fechaInicio=2023-09-11">11</a></td>
							<td data-fecha="2023-09-12"><a
								href="Solicitud.jsp?fechaInicio=2023-09-12">12</a></td>
							<td data-fecha="2023-09-13"><a
								href="Solicitud.jsp?fechaInicio=2023-09-13">13</a></td>
							<td data-fecha="2023-09-14"><a
								href="Solicitud.jsp?fechaInicio=2023-09-14">14</a></td>
							<td data-fecha="2023-09-15"><a
								href="Solicitud.jsp?fechaInicio=2023-09-15">15</a></td>
							<td class="text-muted">16</td>
							<td class="text-muted">17</td>
						</tr>
						<tr>
							<td data-fecha="2023-09-18"><a
								href="Solicitud.jsp?fechaInicio=2023-09-18">18</a></td>
							<td data-fecha="2023-09-19"><a
								href="Solicitud.jsp?fechaInicio=2023-09-19">19</a></td>
							<td data-fecha="2023-09-20"><a
								href="Solicitud.jsp?fechaInicio=2023-09-20">20</a></td>
							<td data-fecha="2023-09-21"><a
								href="Solicitud.jsp?fechaInicio=2023-09-21">21</a></td>
							<td data-fecha="2023-09-22"><a
								href="Solicitud.jsp?fechaInicio=2023-09-22">22</a></td>
							<td class="text-muted">23</td>
							<td class="text-muted">24</td>
						</tr>
						<tr>
							<td data-fecha="2023-09-25"><a
								href="Solicitud.jsp?fechaInicio=2023-09-25">25</a></td>
							<td data-fecha="2023-09-26"><a
								href="Solicitud.jsp?fechaInicio=2023-09-26">26</a></td>
							<td data-fecha="2023-09-27"><a
								href="Solicitud.jsp?fechaInicio=2023-09-27">27</a></td>
							<td data-fecha="2023-09-28"><a
								href="Solicitud.jsp?fechaInicio=2023-09-28">28</a></td>
							<td data-fecha="2023-09-29"><a
								href="Solicitud.jsp?fechaInicio=2023-09-29">29</a></td>
							<td class="text-muted">30</td>
							<td class="text-muted">1</td>
						</tr>
						<tr>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>

						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Octubre</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">25</td>
							<td class="text-muted">26</td>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td class="text-muted">1</td>
						</tr>
						<tr>
							<td data-fecha="2023-10-02"><a
								href="Solicitud.jsp?fechaInicio=2023-10-02">2</a></td>
							<td data-fecha="2023-10-03"><a
								href="Solicitud.jsp?fechaInicio=2023-10-03">3</a></td>
							<td data-fecha="2023-10-04"><a
								href="Solicitud.jsp?fechaInicio=2023-10-04">4</a></td>
							<td data-fecha="2023-10-05"><a
								href="Solicitud.jsp?fechaInicio=2023-10-05">5</a></td>
							<td data-fecha="2023-10-06"><a
								href="Solicitud.jsp?fechaInicio=2023-10-06">6</a></td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
						</tr>
						<tr>
							<td data-fecha="2023-10-09"><a
								href="Solicitud.jsp?fechaInicio=2023-10-09">9</a></td>
							<td data-fecha="2023-10-10"><a
								href="Solicitud.jsp?fechaInicio=2023-10-10">10</a></td>
							<td data-fecha="2023-10-11"><a
								href="Solicitud.jsp?fechaInicio=2023-10-11">11</a></td>
							<td class="festivo">12</td>
							<td data-fecha="2023-10-13"><a
								href="Solicitud.jsp?fechaInicio=2023-10-13">13</a></td>
							<td class="text-muted">14</td>
							<td class="text-muted">15</td>
						</tr>
						<tr>
							<td data-fecha="2023-10-16"><a
								href="Solicitud.jsp?fechaInicio=2023-10-16">16</a></td>
							<td data-fecha="2023-10-17"><a
								href="Solicitud.jsp?fechaInicio=2023-10-17">17</a></td>
							<td data-fecha="2023-10-18"><a
								href="Solicitud.jsp?fechaInicio=2023-10-18">18</a></td>
							<td data-fecha="2023-10-19"><a
								href="Solicitud.jsp?fechaInicio=2023-10-19">19</a></td>
							<td data-fecha="2023-10-20"><a
								href="Solicitud.jsp?fechaInicio=2023-10-20">20</a></td>
							<td class="text-muted">21</td>
							<td class="text-muted">22</td>
						</tr>
						<tr>
							<td data-fecha="2023-10-23"><a
								href="Solicitud.jsp?fechaInicio=2023-10-23">23</a></td>
							<td data-fecha="2023-10-24"><a
								href="Solicitud.jsp?fechaInicio=2023-10-24">24</a></td>
							<td data-fecha="2023-10-25"><a
								href="Solicitud.jsp?fechaInicio=2023-10-25">25</a></td>
							<td data-fecha="2023-10-26"><a
								href="Solicitud.jsp?fechaInicio=2023-10-26">26</a></td>
							<td data-fecha="2023-10-27"><a
								href="Solicitud.jsp?fechaInicio=2023-10-27">27</a></td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
						</tr>
						<tr>
							<td data-fecha="2023-10-30"><a
								href="Solicitud.jsp?fechaInicio=2023-10-30">30</a></td>
							<td data-fecha="2023-10-31"><a
								href="Solicitud.jsp?fechaInicio=2023-10-31">31</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>

						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Noviembre</h6>
				<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
							<td class="festivo">1</td>
							<td data-fecha="2023-11-02"><a
								href="Solicitud.jsp?fechaInicio=2023-11-02">2</a></td>
							<td data-fecha="2023-11-03"><a
								href="Solicitud.jsp?fechaInicio=2023-11-03">3</a></td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
						</tr>
						<tr>
							<td data-fecha="2023-11-06"><a
								href="Solicitud.jsp?fechaInicio=2023-11-06">6</a></td>
							<td data-fecha="2023-11-07"><a
								href="Solicitud.jsp?fechaInicio=2023-11-07">7</a></td>
							<td data-fecha="2023-11-08"><a
								href="Solicitud.jsp?fechaInicio=2023-11-08">8</a></td>
							<td class="festivo">9</td>
							<td data-fecha="2023-11-10"><a
								href="Solicitud.jsp?fechaInicio=2023-11-10">2</a></td>
							<td class="text-muted">11</td>
							<td class="text-muted">12</td>
						</tr>
						<tr>
							<td data-fecha="2023-11-13"><a
								href="Solicitud.jsp?fechaInicio=2023-11-13">13</a></td>
							<td data-fecha="2023-11-14"><a
								href="Solicitud.jsp?fechaInicio=2023-11-14">14</a></td>
							<td data-fecha="2023-11-15"><a
								href="Solicitud.jsp?fechaInicio=2023-11-15">15</a></td>
							<td data-fecha="2023-11-16"><a
								href="Solicitud.jsp?fechaInicio=2023-11-16">16</a></td>
							<td data-fecha="2023-11-17"><a
								href="Solicitud.jsp?fechaInicio=2023-11-17">17</a></td>
							<td class="text-muted">18</td>
							<td class="text-muted">19</td>
						</tr>
						<tr>
							<td data-fecha="2023-11-20"><a
								href="Solicitud.jsp?fechaInicio=2023-11-20">20</a></td>
							<td data-fecha="2023-11-21"><a
								href="Solicitud.jsp?fechaInicio=2023-11-21">21</a></td>
							<td data-fecha="2023-11-22"><a
								href="Solicitud.jsp?fechaInicio=2023-11-22">22</a></td>
							<td data-fecha="2023-11-23"><a
								href="Solicitud.jsp?fechaInicio=2023-11-23">23</a></td>
							<td data-fecha="2023-11-24"><a
								href="Solicitud.jsp?fechaInicio=2023-11-24">24</a></td>
							<td class="text-muted">25</td>
							<td class="text-muted">26</td>
						</tr>
						<tr>
							<td data-fecha="2023-11-27"><a
								href="Solicitud.jsp?fechaInicio=2023-11-27">27</a></td>
							<td data-fecha="2023-11-28"><a
								href="Solicitud.jsp?fechaInicio=2023-11-28">28</a></td>
							<td data-fecha="2023-11-29"><a
								href="Solicitud.jsp?fechaInicio=2023-11-29">29</a></td>
							<td data-fecha="2023-11-30"><a
								href="Solicitud.jsp?fechaInicio=2023-11-30">30</a></td>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
						</tr>
						<tr>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
							<td class="text-muted">8</td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h6 class="text-center">Diciembre</h6>
			<table class="tableCalendar mx-auto">
					
					<tbody>
						<tr>
							<td class="text-muted">27</td>
							<td class="text-muted">28</td>
							<td class="text-muted">29</td>
							<td class="text-muted">30</td>
							<td data-fecha="2023-12-01"><a
								href="Solicitud.jsp?fechaInicio=2023-12-01">1</a></td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
						</tr>
						<tr>
							<td data-fecha="2023-12-04"><a
								href="Solicitud.jsp?fechaInicio=2023-12-04">4</a></td>
							<td data-fecha="2023-12-05"><a
								href="Solicitud.jsp?fechaInicio=2023-12-05">5</a></td>
							<td class="table-primary">6</td>
							<td data-fecha="2023-12-07"><a
								href="Solicitud.jsp?fechaInicio=2023-12-07">7</a></td>
							<td class="festivo">8</td>
							<td class="text-muted">9</td>
							<td class="text-muted">10</td>
						</tr>
						<tr>
							<td data-fecha="2023-12-11"><a
								href="Solicitud.jsp?fechaInicio=2023-12-11">11</a></td>
							<td data-fecha="2023-12-12"><a
								href="Solicitud.jsp?fechaInicio=2023-12-12">12</a></td>
							<td data-fecha="2023-12-13"><a
								href="Solicitud.jsp?fechaInicio=2023-12-13">13</a></td>
							<td data-fecha="2023-12-14"><a
								href="Solicitud.jsp?fechaInicio=2023-12-14">14</a></td>
							<td data-fecha="2023-12-15"><a
								href="Solicitud.jsp?fechaInicio=2023-12-15">15</a></td>
							<td class="text-muted">16</td>
							<td class="text-muted">17</td>
						</tr>
						<tr>
							<td data-fecha="2023-12-18"><a
								href="Solicitud.jsp?fechaInicio=2023-12-18">18</a></td>
							<td data-fecha="2023-12-19"><a
								href="Solicitud.jsp?fechaInicio=2023-12-19">19</a></td>
							<td data-fecha="2023-12-20"><a
								href="Solicitud.jsp?fechaInicio=2023-12-20">20</a></td>
							<td data-fecha="2023-12-21"><a
								href="Solicitud.jsp?fechaInicio=2023-12-21">21</a></td>
							<td data-fecha="2023-12-22"><a
								href="Solicitud.jsp?fechaInicio=2023-12-22">22</a></td>
							<td class="text-muted">23</td>
							<td class="text-muted">24</td>
						</tr>
						<tr>
							<td class="festivo">25</td>
							<td data-fecha="2023-12-26"><a
								href="Solicitud.jsp?fechaInicio=2023-12-26">26</a></td>
							<td data-fecha="2023-12-27"><a
								href="Solicitud.jsp?fechaInicio=2023-12-27">27</a></td>
							<td data-fecha="2023-12-28"><a
								href="Solicitud.jsp?fechaInicio=2023-12-28">28</a></td>
							<td data-fecha="2023-12-29"><a
								href="Solicitud.jsp?fechaInicio=2023-12-29">29</a></td>
							<td class="text-muted">30</td>
							<td class="text-muted">31</td>
						</tr>
						<tr>
							<td class="text-muted">1</td>
							<td class="text-muted">2</td>
							<td class="text-muted">3</td>
							<td class="text-muted">4</td>
							<td class="text-muted">5</td>
							<td class="text-muted">6</td>
							<td class="text-muted">7</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Selecciona todas las celdas de una tabla que tengan un atributo "data-fecha" y,
	 para cada celda encontrada, asigna el valor de ese atributo a la variable "fecha". 
	 Luego, actualiza el contenido de la celda para que sea un enlace a la página "Solicitud.jsp", 
	 pasando la variable "fecha" como parámetro en la URL.
	  Finalmente, asigna el valor de la variable "fecha" a campo"fechaInicio en Solicitud.jsp -->
	<script>
  document.querySelectorAll('td[data-fecha]').forEach(function(td) {
    var fecha = td.dataset.fecha;
    td.innerHTML = '<a href="Solicitud.jsp?fecha=' + fecha + '">' + td.innerHTML + '</a>';
    document.getElementById('fechaInicio').value = fecha; 
  });
</script>

	<!-- Selecciona todas las celdas de una tabla que tengan un atributo "data-fecha". Recupera la lista fechaVacaciones del servlet Principal.
 Luego, recorre esta lista de fechas y, para cada fecha en la lista, compara con las fechas en cada celda de la tabla.
  Si encuentra una celda que tenga una fecha que coincide con una fecha de vacaciones, agrega un estilo de fondo amarillo a esa celda. -->
	<script>

const celdasDeFecha = document.querySelectorAll("td[data-fecha]");

const fechasVacaciones = "${fechasVacaciones}";

const listaFechas = fechasVacaciones.split(", ");

listaFechas.forEach((fecha) => {

  for (const celda of celdasDeFecha) {
    const fechaCelda = celda.getAttribute("data-fecha");

    console.log(`Comparando fechaCelda (${fechaCelda}) con fecha (${fecha})`);

    if (fechaCelda === fecha) {

      celda.style.backgroundColor = "#8EE47E";
      
      
    }
  }
});

</script>

</body>

</html>