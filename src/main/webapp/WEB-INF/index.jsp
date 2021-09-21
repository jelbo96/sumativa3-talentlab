<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1" />
        <title>TIENDA VIRTUAL</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    </head>

    <body>
        <div>
            <a href="logout">
                <h5>Cerrar sesion</h5>
            </a>
            <h1>TIENDA VIRTUAL</h1>

            <div>
                <a href="/producto">Gesti�n de Productos</a>
            </div>

            <br />
            <br />

            <div>
                <a href="/venta">Registrar de Ventas</a>
            </div>

            <a href="login">
                <h1>Iniciar Sesion</h1>
            </a>
            <a href="registrar">
                <h1>Registrar</h1>
            </a>
        </div>
    </body>

    </html>