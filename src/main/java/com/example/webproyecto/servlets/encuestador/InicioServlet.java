package com.example.webproyecto.servlets.encuestador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "InicioEncuestadorServlet", value = "/InicioEncuestadorServlet")
public class InicioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // No crear sesión nueva si no existe

        // Validar sesión y rol del usuario
        if (session == null || session.getAttribute("idUsuario") == null ||
                (int) session.getAttribute("rolId") != 3) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Si pasa la validación, redirige a la vista de inicio del encuestador
        request.getRequestDispatcher("inicioEncuestador.jsp").forward(request, response);
    }
}
