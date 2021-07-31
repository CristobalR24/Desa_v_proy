<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>logout</title>
</head>
<body>
    <%    
    session.removeAttribute("correo"); 
    session.removeAttribute("password");
    session.removeAttribute("nombre");
    
    session.removeAttribute("puntaje");
    session.removeAttribute("aciertos");
    session.invalidate();
    response.sendRedirect("index.jsp");
    %> 
</body>
</html>