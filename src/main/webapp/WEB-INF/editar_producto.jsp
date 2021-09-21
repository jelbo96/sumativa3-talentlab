<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="ISO-8859-1">
                <title>Editar Producto</title>


                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

                <!-- Option 1: Bootstrap Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


            </head>

            <body>
                <div>

                    <h4 class="text-danger">
                        <c:out value="${error}"></c:out>
                    </h4>



                    <form:form action="/producto/modificar" method="post" modelAttribute="producto">
                        <input type="hidden" name="_method" value="put">
                        <form:hidden path="id" />

                        <form:label path="nombre">Nombre:</form:label>
                        <form:input type="text" path="nombre" /><br>

                        <form:label path="precio">Precio:</form:label>
                        <form:input type="text" path="precio" /><br>

                        <form:label path="caracteristica">Caracteristica:</form:label>
                        <form:input type="text" path="caracteristica" /><br>

                        <form:label path="stock">Stock:</form:label>
                        <form:input type="text" path="stock" /><br>


                        <input type="submit" value="Modificar">
                    </form:form>

                </div>
            </body>

            </html>