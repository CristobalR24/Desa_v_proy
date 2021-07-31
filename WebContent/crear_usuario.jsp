<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*" %>
<%@ page import ="logica_juego.Conexion" %>
<%@ page import ="logica_juego.ProcesosEstudiante" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Nuevo Usuario</title>
</head>
<body>

<%!String mensaje = "";%>
<%String Nombre,cedula,correo,pass,facu;
  int edad,fac,id;
  Conexion con = new Conexion();
  ProcesosEstudiante src = new ProcesosEstudiante();
     if(request.getParameter("nombre")!= null || request.getParameter("cedula") != null || request.getParameter("correo") != null || request.getParameter("correo") !=  null || request.getParameter("contra") != null || request.getParameter("edad") != null || request.getParameter("facu") != null)
     {
    	 Nombre = request.getParameter("nombre");
    	 cedula = request.getParameter("cedula");
    	 correo = request.getParameter("correo");
    	 pass = request.getParameter("contra");
    	 edad = Integer.parseInt(request.getParameter("edad"));
    	 facu = request.getParameter("facu");
    	 
    	 out.print(Nombre);
    	 out.print(cedula);
    	 out.print(correo);
    	 out.print(pass);
    	 out.print(edad);
    	 out.print(facu);
    	  try{
    		  if(src.existe_usuario(correo, pass, con)!= true){
    			   if(facu.equals("FISC")){
    				   fac = 1;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente"+id);
    				   
    			   }
    			   else if(facu.equals("FIC")){
    				   fac = 2;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente"+id);
    				   
    			   }
    			   
    			   else if(facu.equals("FII")){
    				   fac = 3;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente"+id);
    				   
    			   }
    			   else if (facu.equals("FCyT")){
    				   fac = 4;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   //src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente"+id);
    				   
    			   }
    			   else if(facu.equals("FIM")){
    				   fac = 5;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente");
    				   
    			   }
    			   else if(facu.equals("FIE")){
    				   fac = 6;
    				   src.asignar(Nombre, cedula, correo, pass, edad, fac);
    				   src.insertar_nuevo(con);
    				   id = src.obtenerID(cedula, con);
    				   src.insertar_user(id,con);
    				   mensaje =("¡El estudiante se ha insertado exitosamente");
    				   
    			   }
    			  
    		  }
    		  else if(src.existe_usuario(correo,pass,con))
    			  mensaje = ("!El usuario ya esta registrado");
    		  
    	  }catch(Exception e){
    		  out.println(e);
    	  }
     }
  %>




<form action=crear_usuario.jsp method = post>
<fieldset>
   <legend>Nuevo Usuario </legend>
     Nombre Completo
     <input name="nombre" type=text required autofocus placeholder="Nombre apellido"/>
     <br>
     <br>
     <br>
     <br>
     Cedula
     <input name="cedula" type=text required autofocus placeholder="0-000-0000"/>
     <br>
     <br>
     <br>
     <br>
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
     <input type = "number" name ="edad" min="17" max="70" value ="1" step="1" title ="Edad"/>
     <br>
     <br>
     <br>
     Facultad
     <br>
     <input type = "radio" name ="facu" value="FISC" />FISC
     <input type = "radio" name ="facu" value="FIC" />FIC
     <input type = "radio" name ="facu" value="FII" />FII
     <input type = "radio" name ="facu" value="FCyT" />FCyT
     <input type = "radio" name ="facu" value="FIM" />FIM
     <input type = "radio" name ="facu" value="FIE" />FIE
     <br>
     <%out.print(mensaje);%>
     <%mensaje=""; %>
     <br>
     <input type="submit" name="Enviar" value= "Iniciar Sesion"/>
</fieldset>
</form>


</body>
</html>