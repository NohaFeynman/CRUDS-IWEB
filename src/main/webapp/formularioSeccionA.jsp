<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 14/05/2025
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Sección A - Validación del Encuestador</title>
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
          <img alt="Logo" src="logo.jpg" />
        </div>
      </div>
    </div>
    <nav class="header-right">
      <div class="nav-item"><img alt="Inicio" class="nav-icon" src="inicio.png" /><span>INICIO</span></div>
      <div class="nav-item"><img alt="Buscar" class="nav-icon" src="https://via.placeholder.com/40?text=B" /><span>BUSCAR</span></div>
      <div class="nav-item"><img alt="Encuestador" class="nav-icon" src="usuario.png" /><span>ENCUESTADOR</span></div>
      <div class="nav-item"><img alt="Salir" class="nav-icon" src="salir.png" /><span>SALIR</span></div>
    </nav>
  </div>
</header>

<!-- Contenido principal -->
<main class="formulario-respuesta-main">
  <form action="SeccionBServlet" method="get" class="formulario-respuesta-form">

    <h2 style="text-align: center; margin-bottom: 30px;">Sección A - Datos del Encuestador</h2>

    <div class="pregunta-container">
      <p class="pregunta-texto">Fecha:</p>
      <p style="background-color: #f0f0f0; padding: 10px; border-radius: 6px;">${fechaActual}</p>
    </div>

    <div class="pregunta-container">
      <p class="pregunta-texto">Nombre del Encuestador:</p>
      <p style="background-color: #f0f0f0; padding: 10px; border-radius: 6px;">${nombre} ${apellido}</p>
    </div>

    <div class="boton-submit-contenedor">
      <button type="submit" class="boton-submit">Continuar</button>
    </div>

  </form>
</main>

</body>
</html>

