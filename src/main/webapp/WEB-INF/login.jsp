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
                <title>Pagina de Login</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

                <!-- Option 1: Bootstrap Bundle with Popper -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
            </head>

            <body>
                <h1>Iniciar Sesión</h1>
                <p>
                    <c:out value="${error}" />
                </p>
                <form method="post" action="/ingresar">
                    <p>
                        <label for="email">Email</label>
                        <input type="text" id="email" name="email" />
                    </p>
                    <p>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" />
                    </p>
                    <input type="submit" value="Iniciar Sesión" class="btn btn-primary" />
                    <a href="/registrar" class="btn btn-secondary"> Registrarse</a>
                </form>
            </body>

            </html>