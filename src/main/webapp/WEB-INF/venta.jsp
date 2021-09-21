<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html>

            <head>

                <style>
                    table,
                    th,
                    td,
                    form {
                        border: 1px solid black;
                    }
                    
                    .forms {
                        background-color: #F0FFFF;
                        width: 25%;
                        padding: 10px;
                    }
                    
                    .title {
                        display: flex;
                        flex-direction: row;
                    }
                </style>

                <meta charset="ISO-8859-1">
                <title>Panel de Ventas</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

                <!-- Option 1: Bootstrap Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
            </head>

            <body>

                <div>
                    <ul class="navbar navbar-dark bg-dark">
                        <li class="nav-item">
                            <a class="nav-link" href="/producto">Gestion de Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/venta">Registrar Ventas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Cerrar Sesion</a>
                        </li>
                    </ul>
                </div>


                <div class="title">
                    <a href="/" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">&larr;</a>
                    <h1>Registrar Venta</h1>
                </div>

                <br />

                <form:form action="/venta/crear" method="post" modelAttribute="venta" class="forms">

                    <label for="usuarios">Seleccione el Cliente:</label>

                    <select name="usuario">
						<c:forEach var="usuario" items="${lista_usuarios}" >
							<option value="<c:out value="${usuario.id}" />"> <c:out value="${usuario.nombre}" /> </option>
						</c:forEach>
					</select>
                    <br>


                    <form:label path="direccion_envio">Dirección Envío:</form:label>
                    <form:input type="text" path="direccion_envio" /><br>
                    <label for="productos">Seleccione Los Productos:</label>
                    <br>
                    <select name="productos" multiple>
						<c:forEach var="producto" items="${lista_productos}">
							<option value="<c:out value="${producto.id}" />"> <c:out value="${producto.nombre}" /> $<c:out value="${producto.precio}" /></option>
						</c:forEach>
					</select>
                    <br>
                    <input type="submit" value="Generar Venta">
                </form:form>
                <br>
                <c:out value="${error}"></c:out>



                <div class="title">
                    <a href="/" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">&larr;</a>
                    <h1>Listado de ventas globales</h1>
                </div>

                <br />

                <table>

                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre Cliente</th>
                            <th>Dirección envío</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="venta" items="${lista_ventas}">

                            <tr>
                                <td>
                                    <c:out value="${venta.id}" />
                                </td>
                                <td>
                                    <c:out value="${venta.usuario.nombre}" />
                                </td>


                                <td>
                                    <c:out value="${venta.direccion_envio}" />
                                </td>


                                <td>
                                    <form action="/venta/eliminar/${venta.id}" method="POST">
                                        <input type="hidden" name="_method" value="delete">
                                        <input type="submit" value="Eliminar">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </body>

            </html>