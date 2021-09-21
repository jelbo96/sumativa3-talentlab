<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <title>Pagina de Registro</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

                <!-- Option 1: Bootstrap Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
            </head>

            <body>
                <h1>Registrate!</h1>

                <a href="/usuario"> Usuarios</a> | <a href="/producto">Productos</a> |
                <a href="/venta">Ventas</a>

                <p>
                    <form:errors path="usuario.*" />
                </p>

                <form:form method="POST" action="/guardar" modelAttribute="usuario">
                    <p>
                        <form:label path="nombre">nombre:</form:label>
                        <form:input type="text" path="nombre" />
                    </p>
                    <p>
                        <form:label path="email">Email:</form:label>
                        <form:input type="email" path="email" />
                    </p>
                    <p>
                        <form:label path="password">Password:</form:label>
                        <form:password path="password" />
                    </p>
                    <p>
                        <form:label path="passwordConfirmation">Confirmación Password:</form:label>
                        <form:password path="passwordConfirmation" />
                    </p>
                    <input type="submit" value="Registrate!" />
                </form:form>
            </body>

            </html>