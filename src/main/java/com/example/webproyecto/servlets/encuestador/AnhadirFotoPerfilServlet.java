package com.example.webproyecto.servlets.encuestador;

import com.example.webproyecto.daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AnhadirFotoPerfilServlet", value = "/AnhadirFotoPerfilServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB máximo
public class AnhadirFotoPerfilServlet extends HttpServlet {

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
        Part filePart = request.getPart("fotoPerfil");

        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                UsuarioDao usuarioDao = new UsuarioDao();
                boolean exito = usuarioDao.actualizarFotoPerfil(idUsuario, inputStream);

                if (exito) {
                    request.setAttribute("exito", "Foto de perfil actualizada correctamente");
                } else {
                    request.setAttribute("error", "Error al actualizar la foto de perfil");
                }
            }
        } else {
            request.setAttribute("error", "Debe seleccionar una imagen válida");
        }

        request.getRequestDispatcher("VerPerfilServlet").forward(request, response);
    }
}
