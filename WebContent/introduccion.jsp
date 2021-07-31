<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Introduccion</title>
</head>
<body>

<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{%>

<H1>Introducción</H1>

<section><img alt="intro" src="imgs\introx.png" width=500></section>

<div>
El juego Xtreme Dev Game es un juego donde aprenderás sobre
        la programación extrema, encontraras material de estudio y luego para poner a prueba
        tu conocimiento resolverás preguntas e iras avanzando de nivel
        segun la cantidad de puntos que ganes.
</div>

<a href="menu.jsp"><button> Continuar</button></a>


<%} %>

</body>
</html>