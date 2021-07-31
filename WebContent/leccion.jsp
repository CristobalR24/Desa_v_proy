<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leccion</title>
</head>
<body>

<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{%>

<H1>Introducción</H1>

<section><img alt="intro" src="imgs\introx.png" width=500></section> <% //aca va el video  %>

<div>
La programación extrema o eXtreme Programming (en adelante, XP) es una metodología de desarrollo de la ingeniería de software formulada por Kent Beck, autor
        del primer libro sobre la materia, Extreme Programming Explained: Embrace Change (1999).
        
         El objetivo principal de la XP es la satisfacción del cliente. Se le trata de dar al
cliente lo que quiere y cuando quiere. Por tanto, se debe responder rápidamente a
las necesidades del cliente, aunque realice cambios en fases avanzadas del
proyecto.

Algunas características de la metodología xp son:

<br>•Se considera al equipo de proyecto como el principal factor de éxito del proyecto.
        <br>•Software que funciona por encima de una buena documentación.
        <br>•Interacción constante entre el cliente y el equipo de desarrollo.
        <br>•Planificación flexible y abierta.
        <br>•Refactoriza el diseño(mejora y modifica la estructura y codificación de códigos ya creados sin alterar su funcionalidad).
        <br>•Rápida respuesta a cambios
        
        
        <br>XP define un conjunto de valores que establecen el fundamento para todo trabajo realizado como parte de XP, estos valores son:
        <br>•Comunicación: La XP ayuda mediante sus prácticas a la comunicación entre los integrantes del grupo de trabajo: jefes de proyecto, clientes y desarrolladores.
        <br>•Sencillez: Los programas deben ser los más sencillos posibles y tener la funcionalidad necesaria que se indican en los requisitos.
        <br>•Retroalimentación: Las pruebas que se le realizan al software nos mantienen informados del grado de fiabilidad del sistema.
        <br>•Valentía: Asumir retos, ser valientes ante los problemas y afrontarlos. El intentar mejorar algo que ya funciona.
        <br>•Respeto: Respeto es tanto por el trabajo de los demás como por el trabajo de uno mismo, por ejemplo, los desarrolladores nunca deben subir cambios que impidan la compilación de la versión.
        
</div>

<a href="menu.jsp"><button> Continuar</button></a>


<%} %>

</body>
</html>