<%--
  Created by IntelliJ IDEA.
  User: Nilton
  Date: 13/05/2025
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    Integer idUsuario = (Integer) session.getAttribute("idUsuario");
    Integer rolId = (Integer) session.getAttribute("rolId");
    String nombre = (String) session.getAttribute("nombre");

    if (idUsuario == null || rolId == null || rolId != 3) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Intranet - Encuestador</title>
    <link rel="stylesheet" href="inicioEncuestador.css"/>
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
            <div class="nav-item">
                <img alt="Inicio" class="nav-icon" src="imagenes/inicio.png"/>
                <span>INICIO</span>
            </div>
            <div class="nav-item">
                <img alt="Buscar" class="nav-icon" src="imagenes/buscar.png"/>
                <span>BUSCAR</span>
            </div>
            <div class="nav-item">
                <img alt="Usuario" class="nav-icon" src="imagenes/usuario.png"/>
                <span><%= nombre %></span>
            </div>
            <div class="nav-item">
                <img alt="Salir" class="nav-icon" src="imagenes/salir.png"/>
                <span>SALIR</span>
            </div>
        </nav>
    </div>
</header>

<main class="main-content">
    <!-- SECCIÓN ENCUESTAS -->
    <section class="section-encuestas">
        <h2>ENCUESTAS RECIENTES</h2>
        <div class="encuestas-container">
            <div class="encuesta-item">
                <div class="encuesta-info">
                    <p class="encuesta-titulo">ENCUESTA N°1</p>
                    <p class="encuesta-fecha">Creación: 10/10/25</p>
                </div>
                <a class="btn-respuesta" href="#">Crear Respuesta</a>
            </div>
            <div class="encuesta-item">
                <div class="encuesta-info">
                    <p class="encuesta-titulo">ENCUESTA N°2</p>
                    <p class="encuesta-fecha">Creación: 11/10/25</p>
                </div>
                <a class="btn-respuesta" href="#">Crear Respuesta</a>
            </div>
            <div class="encuesta-item">
                <div class="encuesta-info">
                    <p class="encuesta-titulo">ENCUESTA N°3</p>
                    <p class="encuesta-fecha">Creación: 12/10/25</p>
                </div>
                <a class="btn-respuesta" href="#">Crear Respuesta</a>
            </div>
        </div>
        <div class="paginacion">
            <button class="pag-arrow">&laquo;</button>
            <span class="pag-num">1</span>
            <span class="pag-num">2</span>
            <span class="pag-num">3</span>
            <button class="pag-arrow">&raquo;</button>
        </div>
    </section>

    <!-- SECCIÓN HISTORIAL -->
    <section class="section-historial">
        <h2>HISTORIAL DE FORMULARIOS</h2>
        <div class="historial-container">
            <div class="formulario-item">
                <div class="formulario-info">
                    <p class="formulario-titulo">FORMULARIO 001</p>
                    <p class="formulario-fecha">Última modificación: 09/10/25</p>
                </div>
                <div class="barra-progreso"><div class="barra-llenado" style="width: 30%;"></div></div>
                <a class="btn-reingresar" href="#">Reingresar</a>
            </div>
            <div class="formulario-item">
                <div class="formulario-info">
                    <p class="formulario-titulo">FORMULARIO 002</p>
                    <p class="formulario-fecha">Última modificación: 10/10/25</p>
                </div>
                <div class="barra-progreso"><div class="barra-llenado" style="width: 50%;"></div></div>
                <a class="btn-reingresar" href="#">Reingresar</a>
            </div>
            <div class="formulario-item">
                <div class="formulario-info">
                    <p class="formulario-titulo">FORMULARIO 003</p>
                    <p class="formulario-fecha">Última modificación: 11/10/25</p>
                </div>
                <div class="barra-progreso"><div class="barra-llenado" style="width: 80%;"></div></div>
                <a class="btn-reingresar" href="#">Reingresar</a>
            </div>
        </div>
        <div class="paginacion">
            <button class="pag-arrow">&laquo;</button>
            <span class="pag-num">1</span>
            <span class="pag-num">2</span>
            <span class="pag-num">3</span>
            <button class="pag-arrow">&raquo;</button>
        </div>
    </section>
</main>
</body>
</html>
