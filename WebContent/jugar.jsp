<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %> 
<%@ page import = "logica_juego.Conexion" %>
<%@ page import = "logica_juego.ProcesosJuego" %>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Collections"%>
<%@ page import = "entidades.Pregunta" %>


<%! int nivel=1;
	//nivel=Integer.parseInt(request.getParameter("nivel"));
	  Conexion co = new Conexion();
	   ProcesosJuego pj = new ProcesosJuego();
	  
	   int x=0,y=0,entro=0, aciertos=0, puntaje=0; 
	   
	   List<Pregunta>_preguntas;
	   
	%>
	  
	   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Preguntas</title>
	<link rel="stylesheet" type="text/css" href="estilos/pregunta_opciones_niveles.css">
</head>
<br>
<header class="saly"><strong>PREGUNTAS</strong></header>
<body>
<br>
	
	<div><br><br>
	<% if (session.getAttribute("correo")  == null || session.getAttribute("password")  == null)  
     	   {response.sendRedirect("index.jsp");}
else{
	   if(x==0){
		   if(request.getParameter("nivel")!=null)
		     nivel=Integer.parseInt(request.getParameter("nivel"));
	   try{//entro=entro+1;
	   _preguntas = pj.ObtenerPreguntas(nivel, co);
	   Collections.shuffle(_preguntas); }
	   catch(Exception e){e.printStackTrace();}}
	   else{}//y=y+1;}
	
	   %>
	   
		<p>  </p> <br><br>
		<br><br><br><br><br><br><br><br><br>
		
			<form action=jugar.jsp method=post>
			<h2><%out.print(_preguntas.get(x).getPregunta()); %></h2><BR>
		   
			<button name="respuesta" value="Si"> Verdadero</button>
			<button name="respuesta" value="No"> Falso </button>
			
			
			
			<%
			//aciertos=aciertos+1;
			String respuesta=request.getParameter("respuesta");
			//out.print(_preguntas.get(x).getPregunta());
			// out.print(_preguntas.get(x).getPregunta()+"  x  = "+x+ " entro = "+entro+" y = "+y+" index "+_preguntas.size()); 
		
			if(respuesta==null){%> nada<%}
			else if(_preguntas.get(x-1).getRespuestas().get(0).getRespuesta().equals("Si")){
				if(respuesta.equals("Si"))
				{
					%>  Correcto<%
					aciertos=aciertos+1;
					puntaje+=Integer.parseInt(_preguntas.get(x-1).getRespuestas().get(0).getPuntaje());
				}
				else if(respuesta.equals("No"))
				{%> Incorrecto	
				<script type="text/javascript">
				    var msg = "<%out.print(_preguntas.get(x-1).getRespuestas().get(0).getRetroalimentacion());%>";
				    alert(msg);
				</script>
				<%}
			
				
			}
			else if(_preguntas.get(x-1).getRespuestas().get(0).getRespuesta().equals("No")){
				if(respuesta.equals("No")){
					%> Correcto <%
					aciertos=aciertos+1;
					puntaje+=Integer.parseInt(_preguntas.get(x-1).getRespuestas().get(0).getPuntaje());
				}
				else if(respuesta.equals("Si"))
				{%> Incorrecto	
				<script type="text/javascript">
				    var msg = "<%out.print(_preguntas.get(x-1).getRespuestas().get(0).getRetroalimentacion());%>";
				    alert(msg);
				</script>
				<%}
				else{%><%}
			
			}
		
			%>
			<%
			  x=x+1;
			   %>
			   
	
			</form>
			
			
			<%if(x==10) { 
			x=0;
			
			session.setAttribute("aciertos", aciertos);
			session.setAttribute("puntaje", puntaje); 
			response.sendRedirect("resultados.jsp");}%>
	
			
	</div>
</body><br><br>

</html>
<% }%>
