package com.example.webproyecto.servlets.encuestador;

import com.example.webproyecto.beans.*;
import com.example.webproyecto.daos.encuestador.VerPerfilDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "VerPerfilServlet", value = "/VerPerfilServlet")
public class VerPerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Validar sesión
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect("LoginServlet");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");

        VerPerfilDAO perfilDao = new VerPerfilDAO();
        Map<String, Object> datosPerfil = perfilDao.obtenerPerfilCompleto(idUsuario);

        if (datosPerfil != null && datosPerfil.get("usuario") != null) {
            request.setAttribute("datosPerfil", datosPerfil);
            request.getRequestDispatcher("verPerfil.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No se pudo cargar el perfil del usuario.");
            request.getRequestDispatcher("InicioServlet").forward(request, response);
        }
    }
}