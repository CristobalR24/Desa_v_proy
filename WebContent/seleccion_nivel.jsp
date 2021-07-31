<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Niveles</title>
	<link rel="stylesheet" type="text/css" href="estilos/pregunta_opciones_niveles.css">
</head>
<br>
<header class="saly"><strong>EXTREME DEV GAME</strong></header>
<body>
<br>
<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{%>
<%! String nivel;%>



	<div><br>
		<form action="jugar.jsp" method="post">
		<button type=submit name="nivel" value="1">Nivel 1</button><br>
		<button type=button>Nivel 2</button><br>
		<button type=button>Nivel 3</button><br>
		</form>
		
		<a href="menu.jsp"> 
		<button> Regresar</button></a>
		

	</div>
</body><br><br>
<footer>Saldaña, Luis - Castillo, Wencers - Quiel, Karla - Carrillo, Ángel - Rodríguez, Cristóbal - González, Elianys </footer>
<%} %>
</html>