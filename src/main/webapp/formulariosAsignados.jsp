<%--
  Created by IntelliJ IDEA.
  User: Nilton
  Date: 14/05/2025
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Intranet - Formularios Asignados</title>
    <link rel="stylesheet" href="formulariosAsignados.css" />
</head>
<body>

<input class="menu-toggle" id="menu-toggle" type="checkbox"/>

<!-- Menú lateral -->
<div class="sidebar">
    <div class="sidebar-content">
        <div class="profile-section">
            <img alt="Foto de usuario" class="profile-pic" src="https://via.placeholder.com/100?text=User"/>
            <a class="profile-btn" href="VerPerfilServlet">Ver perfil</a>
        </div>
        <ul class="menu-links">
            <li><a href="FormulariosAsignadosServlet">FORMULARIOS ASIGNADOS</a></li>
            <li><a href="HistorialFormulariosServlet">HISTORIAL DE FORMULARIOS</a></li>
            <li><a href="LogoutServlet">CERRAR SESIÓN</a></li>
        </ul>
    </div>
</div>

<label class="overlay" for="menu-toggle"></label>

<!-- CABECERA -->
<header class="header-bar">
    <div class="header-content">
        <div class="header-left">
            <label class="menu-icon" for="menu-toggle"><span>☰</span></label>
            <div class="logo-section">
                <div class="logo-large">
                    <img alt="Logo Combinado" src="imagenes/logo.jpg"/>
                </div>
            </div>
        </div>
        <nav class="header-right">
            <div class="nav-item"><img alt="Inicio" class="nav-icon" src="imagenes/inicio.png"/><span>INICIO</span></div>
            <div class="nav-item"><img alt="Buscar" class="nav-icon" src="imagenes/buscar.png"/><span>BUSCAR</span></div>
            <div class="nav-item"><img alt="Encuestador" class="nav-icon" src="imagenes/usuario.png"/><span>ENCUESTADOR</span></div>
            <div class="nav-item"><img alt="Salir" class="nav-icon" src="imagenes/salir.png"/><span>SALIR</span></div>
        </nav>
    </div>
</header>

<!-- CONTENIDO PRINCIPAL -->
<main class="main-content">
    <div class="contenedor-grid">
        <c:forEach var="asignacion" items="${formulariosAsignados}">
            <section class="bloque-personalizado">
                <div style="display: flex; justify-content: center; margin-bottom: 15px;">
                    <img src="imagenes/formulario_foto.png" alt="Foto de formulario" style="width: 150px; height: 150px; object-fit: cover; border: 1px solid #333;">
                </div>
                <div style="background-color: #ffffff; border: 1px solid #333; padding: 10px; margin-bottom: 15px; border-radius: 10px; text-align: center;">
                    <p style="margin: 0;">
                            ${asignacion.formulario.titulo}
                    </p>
                </div>
                <div style="display: flex; justify-content: flex-end;">
                    <form action="SeccionAServlet" method="get">
                        <input type="hidden" name="idFormulario" value="${asignacion.formulario.idFormulario}" />
                        <button type="submit" class="btn-respuesta">Crear Respuesta</button>
                    </form>
                </div>
            </section>
        </c:forEach>
    </div>
</main>


</body>
</html>

