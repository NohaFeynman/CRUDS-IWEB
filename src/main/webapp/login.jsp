<%--
  Created by IntelliJ IDEA.
  User: Nilton
  Date: 13/05/2025
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inicio de Sesión</title>
    <link rel="stylesheet" href="estilos/login.css">
</head>
<body>

<div class="main-container">

    <!-- Barra superior -->
    <header class="header-bar">
        <img src="imagenes/logo.jpg" alt="Logo superior">
    </header>

    <!-- Contenido principal -->
    <main class="content">

        <!-- Sección de imagen grande -->
        <section class="image-section">
            <img src="imagenes/portada.jpg" alt="Imagen principal">
        </section>

        <!-- Sección de login -->
        <section class="login-section">
            <h4>INICIO DE SESIÓN</h4>

            <!-- Mostrar mensaje de error si lo hay -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <p class="error-message"><%= error %></p>
            <%
                }
            %>

            <form action="LoginServlet" method="post">
                <input type="email" name="correo" placeholder="Correo" required>
                <input type="password" name="contrasenha" placeholder="Contraseña" required>

                <div class="forgot-password">
                    <a href="credencial_reinicioPassword.html">¡Olvidé mi contraseña!</a>
                </div>

                <button type="submit" class="login-btn">Ingresar</button>

                <div class="register-link">
                    <a href="credencial_Registro.html">Registrarme</a>
                </div>
            </form>
        </section>

    </main>

    <!-- Pie de página -->
    <footer class="footer-bar">
        Defensora mundial de la igualdad de género
    </footer>

</div>

</body>
</html>
