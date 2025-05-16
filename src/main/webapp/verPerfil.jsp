<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Intranet - Ver Perfil</title>
    <style>
        /* RESET BÁSICO */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #333;
        }
        /* ================== MENÚ LATERAL (Sidebar) ================== */
        /* Oculta el checkbox */
        .menu-toggle {
            display: none;
        }

        /* Sidebar: se ensancha a 280px para mayor espacio */
        .sidebar {
            position: fixed;
            top: 0;
            left: -280px; /* Ancho del menú: 280px */
            width: 280px;
            height: 100%;
            background-color: #c9ddff; /* Fondo celeste claro */
            box-shadow: 2px 0 8px rgba(0,0,0,0.3);
            transition: left 0.3s ease;
            z-index: 1000;
            overflow-y: auto;
        }

        .menu-toggle:checked ~ .sidebar {
            left: 0;
        }

        /* Overlay: oscurece el fondo cuando el menú está abierto */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.3s ease;
            z-index: 900;
        }

        .menu-toggle:checked ~ .overlay {
            opacity: 1;
            visibility: visible;
        }

        /* Contenido del Sidebar */
        .sidebar-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 1rem;
        }

        /* Sección de perfil: fondo blanco, mayor tamaño */
        .profile-section {
            background-color: #fff;
            width: 90%;
            padding: 1.2rem;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 0.8rem;
            object-fit: cover;
            background-color: #ccc;
        }

        .profile-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 0.6rem 1.2rem;
            cursor: pointer;
            font-weight: bold;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .logout-btn {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 0.6rem 1.2rem;
            cursor: pointer;
            font-weight: bold;
            font-size: 0.9rem;
            width: 100%;
        }

        .profile-btn:hover {
            background-color: #0056b3;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }

        /* Lista de enlaces del Sidebar */
        .menu-links {
            list-style: none;
            width: 100%;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            align-items: center;
        }

        .menu-links li a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            text-decoration: none;
            color: #000;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.95rem;
            transition: color 0.3s;
        }

        .menu-links li a:hover {
            color: #007bff;
        }

        .menu-links li a i {
            margin-right: 0.8rem;
            font-size: 1.2rem;
        }

        /* ================== CABECERA (Header) ================== */
        .header-bar {
            background-color: #dbeeff;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: relative;
            z-index: 800;
        }

        .header-content {
            width: 90%;
            max-width: 1200px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 3rem;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .menu-icon {
            font-size: 24px;
            cursor: pointer;
            color: #333;
            display: inline-block;
        }

        .logo-section {
            display: flex;
            flex-direction: column;
            gap: 0.2rem;
        }

        .logo-small img,
        .logo-large img {
            height: 50px;
            object-fit: contain;
        }

        .header-right {
            display: flex;
            gap: 2rem;
        }

        .nav-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: #333;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

        .nav-item:hover {
            color: #007bff;
        }

        .nav-icon {
            width: 40px;
            height: 40px;
            margin-bottom: 0.2rem;
            object-fit: cover;
        }

        /* ================== CONTENIDO PRINCIPAL ================== */
        .main-content {
            width: 90%;
            max-width: 1200px;
            margin: 2rem auto;
            padding-bottom: 2rem;
            text-align: center;
        }

        .main-content h2 {
            margin-bottom: 2rem;
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
        }

        /* ================== INTERFAZ "VER PERFIL" ================== */
        .profile-container {
            background-color: #f5f5f5;
            margin: 0 auto;
            max-width: 800px;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            text-align: left;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .profile-photo {
            position: relative;
        }

        .profile-photo img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            background-color: #ccc;
        }

        .change-photo-btn {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 1.2rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .change-photo-btn:hover {
            background-color: #0056b3;
        }

        .profile-info h3 {
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
            color: #007bff;
        }

        .profile-info p {
            margin: 0.3rem 0;
            font-size: 1rem;
        }

        .profile-details {
            margin-top: 2rem;
        }

        .profile-row {
            display: flex;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }

        .profile-label {
            flex: 0 0 200px;
            font-weight: bold;
            color: #555;
        }

        .profile-value {
            flex: 1;
        }

        .profile-value input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .profile-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-edit, .btn-change-password {
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
        }

        .btn-edit {
            background-color: #007bff;
            color: #fff;
        }

        .btn-edit:hover {
            background-color: #0056b3;
        }

        .btn-change-password {
            background-color: #28a745;
            color: #fff;
        }

        .btn-change-password:hover {
            background-color: #218838;
        }

        /* ================== RESPONSIVIDAD ================== */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                padding: 0.5rem 1rem;
                gap: 1rem;
                justify-content: center;
            }

            .header-left,
            .header-right {
                width: 100%;
                display: flex;
                justify-content: center;
            }

            .header-right {
                flex-wrap: wrap;
                gap: 1rem;
                margin-top: 0.5rem;
            }

            .nav-icon {
                width: 30px;
                height: 30px;
            }

            .profile-header {
                flex-direction: column;
                align-items: center;
                gap: 1rem;
            }

            .profile-info h3 {
                font-size: 1.5rem;
                text-align: center;
            }

            .profile-row {
                flex-direction: column;
            }

            .profile-label {
                margin-bottom: 0.5rem;
            }

            .profile-actions {
                flex-direction: column;
            }

            .btn-edit, .btn-change-password {
                width: 100%;
            }
        }

    </style>
</head>
<body>
<!-- Checkbox oculto para controlar el menú lateral -->
<input type="checkbox" id="menu-toggle" class="menu-toggle">

<!-- Menú lateral (Sidebar) -->
<div class="sidebar">
    <div class="sidebar-content">
        <!-- Sección de perfil en el sidebar -->
        <div class="profile-section">
            <img src="https://via.placeholder.com/100?text=User" alt="Foto de usuario" class="profile-pic">
            <button class="profile-btn" onclick="window.location.href='VerPerfilServlet'">Ver perfil</button>      </div>
    </div>
    <!-- Lista de enlaces (accesos directos) -->
    <ul class="menu-links">
        <li><a href="encuestador_formularios_asignados.jsp"><i class="icon-dashboard"></i> Ver formularios asignados</a></li>
        <li><a href="encuestador_historial_formularios.jsp"><i class="icon-coordinators"></i> Ver historial de formulario</a></li>
        <li><a href="encuestador_sesion_cerrada.jsp"><i class="icon-surveyors"></i> Cerrar sesión</a></li>
    </ul>

</div>
</div>

<!-- Overlay para oscurecer el fondo cuando el menú esté abierto -->
<label for="menu-toggle" class="overlay"></label>

<!-- CABECERA -->
<header class="header-bar">
    <div class="header-content">
        <div class="header-left">
            <!-- Ícono de menú (label vinculado al checkbox) -->
            <label for="menu-toggle" class="menu-icon">
                <span>&#9776;</span>
            </label>
            <div class="logo-section">
                <div class="logo-large">
                    <img src="logo.jpg" alt="Logo Combinado">
                </div>
            </div>
        </div>
        <nav class="header-right">
            <div class="nav-item">
                <img src="imagenes/inicio.png" alt="Icono Inicio" class="nav-icon">
                <span>INICIO</span>
            </div>
            <div class="nav-item">
                <img src="imagenes/buscar.png" alt="Icono Buscar" class="nav-icon">
                <span>BUSCAR</span>
            </div>
            <div class="nav-item">
                <img src="imagenes/usuario.png" alt="Icono Administrador" class="nav-icon">
                <span>ENCUESTADOR</span>
            </div>
            <div class="nav-item">
                <img alt="Icono Salir" class="nav-icon" src="imagenes/salir.png"/>
                <span>SALIR</span>
            </div>
        </nav>
    </div>
</header>

<!-- CONTENIDO PRINCIPAL: Interfaz de Ver Perfil -->
<main class="main-content">
    <h2>PERFIL DEL USUARIO</h2>
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-photo">
                <img id="user-photo" src="https://via.placeholder.com/150?text=Foto" alt="Foto de usuario">
                <input type="file" id="file-input" accept="image/*" style="display: none;">
                <button class="change-photo-btn" onclick="document.getElementById('file-input').click()">+</button>
            </div>
            <div class="profile-info">

                <h3>${datosPerfil.usuario.nombre} ${datosPerfil.usuario.apellido}</h3>
                <p><strong>Rol:</strong> ${datosPerfil.nombreRol}</p>
                <p><strong>Último acceso:</strong>
                    <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()) %>
                </p>

            </div>
        </div>

        <div class="profile-details">
            <div class="profile-row">
                <div class="profile-label">Nombres:</div>
                <div class="profile-value">${datosPerfil.usuario.nombre}</div>
            </div>
            <div class="profile-row">
                <div class="profile-label">Apellidos:</div>
                <div class="profile-value">${datosPerfil.usuario.apellido}</div>
            </div>
            <div class="profile-row">
                <div class="profile-label">DNI:</div>
                <div class="profile-value">${datosPerfil.usuario.dni}</div>
            </div>
            <div class="profile-row">
                <div class="profile-label">Dirección:</div>
                <div class="profile-value">
                    <input type="text" value="${datosPerfil.usuario.direccion}" placeholder="Ingrese su dirección">
                </div>
            </div>
            <div class="profile-row">
                <div class="profile-label">Distrito:</div>
                <div class="profile-value">
                    <input type="text" value="${datosPerfil.nombreDistrito}" placeholder="Ingrese su distrito">
                </div>
            </div>
            <div class="profile-row">
                <div class="profile-label">Correo electrónico:</div>
                <div class="profile-value">${datosPerfil.correo}</div>
            </div>
        </div>

        <div class="profile-actions">
            <button class="btn-change-password" onclick="window.location.href='CambiarContrasenhaServlet'">Cambiar Contraseña</button>
            <button class="btn-edit" onclick="window.location.href='GuardarCambiosServlet'">Guardar Cambios</button>
        </div>
    </div>
</main>

<script>
    // Función para mostrar la imagen seleccionada
    document.getElementById('file-input').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            // Verificar que sea una imagen
            if (!file.type.match('image.*')) {
                alert('Por favor, selecciona un archivo de imagen (JPEG, PNG, etc.)');
                return;
            }

            const reader = new FileReader();

            reader.onload = function(event) {
                // Actualizar la imagen de perfil
                document.getElementById('user-photo').src = event.target.result;

                // Opcional: También actualizar la imagen pequeña en el sidebar
                document.querySelector('.profile-pic').src = event.target.result;
            }

            reader.readAsDataURL(file);
        }
    });
</script>
</body>
</html>