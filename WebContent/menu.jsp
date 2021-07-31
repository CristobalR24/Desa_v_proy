<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.io.File" %> 
<%@ page import = "media.MenuMusica" %> 
<%@ page import = "javax.sound.sampled.AudioInputStream" %> 
<%@ page import = "javax.sound.sampled.AudioSystem" %> 
<%@ page import = "javax.sound.sampled.Clip" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Extreme dev game</title>
</head>
<body>
<%!int i=0; 
//final File file = new File("C:\\Users\\crist\\eclipse-workspace\\Extreme dev game\\WebContent\\sonido\\bensound_dreams_rf_modificado_.wav"); //solo soporta .wav%>
<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{

    
%>

<h1>Extreme dev game</h1><br><br>


<a href="menu.jsp"><button> Diario de aprendizaje</button></a>
<br><br>
<a><button> Ver ranking</button></a>
<br><br>
<a><button> Ayuda</button></a>
<br><br>
<a href="seleccion_nivel.jsp"><button> Jugar</button></a>
<br><br>

<a href="logout.jsp">
<button type="button"> Cerrar sesión</button></a>

<%} %>
</body>
</html>