package com.example.webproyecto.servlets.encuestador;

import com.example.webproyecto.beans.Usuario;
import com.example.webproyecto.daos.CredencialDao;
import com.example.webproyecto.daos.encuestador.VerPerfilDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CambiarContrasenhaServlet", value = "/CambiarContrasenhaServlet")
public class CambiarContrasenhaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");

        VerPerfilDAO perfilDao = new VerPerfilDAO();

        // Obtener el Map completo de datos
        Map<String, Object> datosPerfil = perfilDao.obtenerPerfilCompleto(idUsuario);

        if (datosPerfil != null && datosPerfil.get("usuario") != null) {
            // Extraer el usuario del Map
            Usuario usuario = (Usuario) datosPerfil.get("usuario");

            // Pasar el Map completo al JSP
            request.setAttribute("datosPerfil", datosPerfil);
            request.getRequestDispatcher("cambiarContrasenha.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudo cargar los datos del perfil");
            request.getRequestDispatcher("inicioEncuestador.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Validar sesión
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect("LoginServlet");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");
        String contrasenhaActual = request.getParameter("contrasenhaActual");
        String nuevaContrasenha = request.getParameter("nuevaContrasenha");
        String confirmarContrasenha = request.getParameter("confirmarContrasenha");

        // Validaciones
        if (contrasenhaActual == null || nuevaContrasenha == null || confirmarContrasenha == null) {
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.getRequestDispatcher("cambiarContrasenha.jsp").forward(request, response);
            return;
        }

        if (nuevaContrasenha.length() < 8) {
            request.setAttribute("error", "La nueva contraseña debe tener al menos 8 caracteres");
            request.getRequestDispatcher("cambiarContrasenha.jsp").forward(request, response);
            return;
        }

        if (!nuevaContrasenha.equals(confirmarContrasenha)) {
            request.setAttribute("error", "Las contraseñas nuevas no coinciden");
            request.getRequestDispatcher("cambiarContrasenha.jsp").forward(request, response);
            return;
        }

        // Procesar cambio de contraseña
        CredencialDao credencialDao = new CredencialDao();
        boolean cambioExitoso = credencialDao.cambiarContrasenha(
                idUsuario, contrasenhaActual, nuevaContrasenha);

        if (cambioExitoso) {
            request.setAttribute("exito", "Contraseña cambiada exitosamente");
        } else {
            request.setAttribute("error", "Contraseña actual incorrecta");
        }

        request.getRequestDispatcher("cambiarContrasenha.jsp").forward(request, response);
    }
}