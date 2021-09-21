<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pagina de Registro</title>
</head>
<body>
    <h1>Registrate!</h1>

    
		<a href="/usuario"> Usuarios</a> | <a href="/producto">Productos</a> |
		<a href="/venta">Ventas</a>
    
    <p><form:errors path="usuario.*"/></p>
    
    <form:form method="POST" action="/guardar" modelAttribute="usuario">
    	<p>
            <form:label path="nombre">nombre:</form:label>
            <form:input type="text" path="nombre"/>
        </p>
        <p>
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email"/>
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Confirmación Password:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Registrate!"/>
    </form:form>
    
</body>
</html>