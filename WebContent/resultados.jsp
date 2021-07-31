<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultados</title>
</head>
<body>

<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{%>
<div>
			<div>
			<%! int puntaje=0,aciertos=0;
			    String nom=" ";%>
			<% 	
				if (session.getAttribute("puntaje")  != null && session.getAttribute("aciertos")  != null && session.getAttribute("nombre")  != null)  
		     	   {puntaje=(int)session.getAttribute("puntaje");
					aciertos=(int)session.getAttribute("aciertos");
					nom=(String)session.getAttribute("nombre");}
				
				%>
	
				<br><br><br>
		
						Puntaje<br>
						<% out.print(puntaje); %>
					</div>
					<div>
						Aciertos<br>
						 <% out.print(aciertos); %>
					</div>
					<div>
						Aciertos<br>
						 <% out.print(nom); %>
					</div>
				</div>
				
				<% session.setAttribute("aciertos", 0);
				   session.setAttribute("puntaje", 0);  %>

				<br><br>
				<a href="seleccion_nivel.jsp">
				<button> ok</button></a>

	<footer><h3><br>
    EXTREME DEV<br>
    Saldaña, Luis - Castillo, Wencers - Quiel, Karla - Carrillo, Ángel - Rodríguez, Cristóbal - González, Elianys 
    </h3></footer>

</body>
<%} %>
</html>