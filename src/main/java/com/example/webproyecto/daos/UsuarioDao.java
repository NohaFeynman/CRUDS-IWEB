package com.example.webproyecto.daos;

import com.example.webproyecto.beans.Usuario;

import java.io.InputStream;
import java.sql.*;

public class UsuarioDao {

    private final String url = "jdbc:mysql://localhost:3306/proyecto";
    private final String user = "root";
    private final String pass = "root";

    public Usuario obtenerUsuarioPorId(int idUsuario) {
        Usuario usuario = null;

        String sql = "SELECT * FROM usuario WHERE idUsuario = ?";

        try {
            // Registro explícito del driver antes de abrir conexión
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, idUsuario);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setIdDistrito(rs.getInt("idDistritos"));
                    usuario.setIdRol(rs.getInt("idRol"));
                    usuario.setIdEstado(rs.getInt("idEstado"));
                    usuario.setUrlFoto(rs.getString("urlFoto")); // si usas rutas
                }

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public boolean actualizarFotoPerfil(int idUsuario, InputStream fotoStream) {
        String sql = "UPDATE usuario SET foto = ? WHERE idUsuario = ?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setBlob(1, fotoStream);
            stmt.setInt(2, idUsuario);

            int filas = stmt.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarPerfil(Usuario usuario) {
        String sql = """
        UPDATE usuario 
        SET nombre = ?, apellido = ?, direccion = ?, idDistrito = ?
        WHERE idUsuario = ?
        """;

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getApellido());
            stmt.setString(3, usuario.getDireccion());
            stmt.setInt(4, usuario.getIdDistrito());
            stmt.setInt(5, usuario.getIdUsuario());

            int filas = stmt.executeUpdate();
            return filas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
