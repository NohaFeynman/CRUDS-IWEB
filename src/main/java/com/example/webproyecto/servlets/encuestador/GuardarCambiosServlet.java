package com.example.webproyecto.servlets.encuestador;

import com.example.webproyecto.daos.UsuarioDao;
import com.example.webproyecto.beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GuardarCambiosServlet", value = "/GuardarCambiosServlet")
public class GuardarCambiosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Validar sesión
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect("VerPerfilServlet");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");

        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        int idDistrito = Integer.parseInt(request.getParameter("idDistrito"));

        // Crear objeto Usuario con los nuevos datos
        Usuario usuario = new Usuario();
        usuario.setIdUsuario(idUsuario);
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setDireccion(direccion);
        usuario.setIdDistrito(idDistrito);

        // Actualizar en la base de datos
        UsuarioDao usuarioDao = new UsuarioDao();
        boolean exito = usuarioDao.actualizarPerfil(usuario);

        if (exito) {
            // Actualizar datos en sesión
            session.setAttribute("nombre", nombre);
            request.setAttribute("exito", "Cambios guardados exitosamente");
        } else {
            request.setAttribute("error", "Error al guardar los cambios");
        }

        request.getRequestDispatcher("VerPerfilServlet").forward(request, response);
    }
}
