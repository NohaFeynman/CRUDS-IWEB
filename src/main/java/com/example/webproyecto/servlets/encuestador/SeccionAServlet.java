package com.example.webproyecto.servlets.encuestador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "SeccionAServlet", value = "/SeccionAServlet")
public class SeccionAServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Verifica que haya sesión activa y que el rol sea encuestador (3)
        if (session == null || session.getAttribute("idUsuario") == null ||
                (int) session.getAttribute("rolId") != 3) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Obtener datos del encuestador desde la sesión
        String nombre = (String) session.getAttribute("nombre");
        String apellido = (String) session.getAttribute("apellido");

        // Obtener fecha actual en formato yyyy-MM-dd
        LocalDate fechaActual = LocalDate.now();
        String fechaFormateada = fechaActual.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));

        // Pasar los datos a la vista
        request.setAttribute("nombre", nombre);
        request.setAttribute("apellido", apellido);
        request.setAttribute("fechaActual", fechaFormateada);

        // Mostrar la vista JSP de la sección A
        request.getRequestDispatcher("formularioSeccionA.jsp").forward(request, response);
    }
}

