<%--
  Created by IntelliJ IDEA.
  User: Nilton
  Date: 14/05/2025
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <title>Responder Formulario</title>
    <link rel="stylesheet" href="formularioRespuesta.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />
</head>
<body>

<input class="menu-toggle" id="menu-toggle" type="checkbox" />

<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-content">
        <div class="profile-section">
            <img alt="Foto de usuario" class="profile-pic" src="https://via.placeholder.com/100?text=User" />
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

<!-- Cabecera -->
<header class="header-bar">
    <div class="header-content">
        <div class="header-left">
            <label class="menu-icon" for="menu-toggle"><span>☰</span></label>
            <div class="logo-section">
                <div class="logo-large">
                    <img alt="Logo" src="imagenes/logo.jpg" />
                </div>
            </div>
        </div>
        <nav class="header-right">
            <div class="nav-item"><img alt="Inicio" class="nav-icon" src="imagenes/inicio.png" /><span>INICIO</span></div>
            <div class="nav-item"><img alt="Buscar" class="nav-icon" src="imagenes/buscar.png" /><span>BUSCAR</span></div>
            <div class="nav-item"><img alt="Encuestador" class="nav-icon" src="imagenes/usuario.png" /><span>ENCUESTADOR</span></div>
            <div class="nav-item"><img alt="Salir" class="nav-icon" src="imagenes/salir.png" /><span>SALIR</span></div>
        </nav>
    </div>
</header>

<!-- Contenido principal -->
<main class="formulario-respuesta-main">
    <form action="GuardarRespuestasServlet" method="post" class="formulario-respuesta-form">

        <input type="hidden" name="idFormulario" value="${idFormulario}" />

        <c:forEach var="pregunta" items="${preguntas}">
            <div class="pregunta-container">
                <p class="pregunta-texto">${pregunta.orden}. ${pregunta.textoPregunta}</p>

                <c:choose>
                    <c:when test="${pregunta.tipoPregunta == 0}">
                        <div class="opciones-grid">
                            <c:forEach var="opcion" items="${pregunta.opciones}">
                                <label class="opcion-card">
                                    <input type="radio" name="respuesta_${pregunta.idPregunta}" value="${opcion.idOpcion}" required />
                                    <span>${opcion.textoOpcion}</span>
                                </label>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <textarea name="respuesta_${pregunta.idPregunta}" rows="4" class="textarea-abierta" placeholder="Escribe tu respuesta aquí..." required></textarea>
                    </c:otherwise>
                </c:choose>

            </div>
        </c:forEach>

        <div class="boton-submit-contenedor">
            <button type="submit" class="boton-submit">Enviar Respuestas</button>
        </div>

    </form>
</main>

</body>
</html>
