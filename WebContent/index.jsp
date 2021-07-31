<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@ page import ="logica_juego.Conexion" %>
<%@ page import ="logica_juego.ProcesosEstudiante" %>
<!DOCTYPE html>
<html lang = "en">
<head>
<meta charset="UTF-8">
<title>Extreme Dev Game</title>
</head>
<body>


 <%!  String correo, pass, error="",nom;
        Conexion con = new Conexion();
        ProcesosEstudiante  prc = new ProcesosEstudiante();
        %>
      
   <%   correo = request.getParameter("correo"); 
        pass = request.getParameter("contra"); 
        
     if (correo == null & pass == null) {  
    	
     %>



<form action=index.jsp method = post>
<fieldset>
   <legend>Extreme dev Game</legend>
     Correo Electronico 
     <input name="correo" type=email required autofocus placeholder="jawline_07@utp.ac.pa"/>
     <br>
     <br>
     <br>
     <br>
     Contraseña
     <input name="contra" type=password required placeholder="********" />
     <br>
     <br>
     <br>
     <%out.print(error);%>
     <%error=""; %>
     <input type="submit" name="Enviar" value= "Iniciar Sesion"/>
</fieldset>
</form>

<%  } 
     else{
    	 try{
    	      if(prc.existe_usuario(correo,pass,con)){  %>
    		 
    		 <% 
    		    session.setAttribute("correo", correo);
    		    session.setAttribute("password",pass);
    		    nom=prc.obtenerNombre(correo, pass, con);
    		    session.setAttribute("nombre",nom);
    		    response.sendRedirect("introduccion.jsp");
    	           }
    		    
    		else{
    			 error =("Error de Inicio de sesion.Nombre de usuario o contraseña no validos.");
    			 response.sendRedirect("index.jsp");
    		 
    		}
    		    
    	 }catch(Exception e){
    		 out.println(e);
    	 }
    	 
       
     }%>
     <BR>
     <BR>
     <BR>
<a href = crear_usuario.jsp>Crear_Usuario</a>
</body>
</html>