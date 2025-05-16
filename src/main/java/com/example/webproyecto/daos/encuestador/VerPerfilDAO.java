package com.example.webproyecto.daos.encuestador;

import com.example.webproyecto.beans.Usuario;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class VerPerfilDAO {
    private final String url = "jdbc:mysql://localhost:3306/proyecto";
    private final String user = "root";
    private final String password = "root";

    public Map<String, Object> obtenerPerfilCompleto(int idUsuario) {
        Map<String, Object> datos = new HashMap<>();
        Usuario usuario = null;

        String sql = """
            SELECT u.idUsuario, u.nombre, u.apellido, u.dni, u.direccion, 
                   u.idRol, u.idEstado, u.foto, 
                   d.idDistrito, d.nombreDistrito, 
                   r.nombreRol, 
                   e.nombreEstado,
                   c.correo
            FROM usuario u
            LEFT JOIN distrito d ON u.idDistrito = d.idDistrito
            LEFT JOIN rol r ON u.idRol = r.idRol
            LEFT JOIN estado e ON u.idEstado = e.idEstado
            LEFT JOIN credencial c ON u.idUsuario = c.idUsuario
            WHERE u.idUsuario = ?
            """;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, idUsuario);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    usuario = new Usuario();
                    // Datos básicos
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setIdRol(rs.getInt("idRol"));
                    usuario.setIdEstado(rs.getInt("idEstado"));

                    // Foto (puede ser null)
                    Blob fotoBlob = rs.getBlob("foto");
                    if (fotoBlob != null) {
                        usuario.setUrlFoto("data:image/jpeg;base64," +
                                javax.xml.bind.DatatypeConverter.printBase64Binary(
                                        fotoBlob.getBytes(1, (int)fotoBlob.length())));
                    }

                    datos.put("usuario", usuario);
                    datos.put("nombreDistrito", rs.getString("nombreDistrito"));
                    datos.put("correo", rs.getString("correo"));
                    datos.put("nombreRol", rs.getString("nombreRol"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return datos;
    }
    public String obtenerNombreDistritoPorUsuario(int idUsuario) {
        String nombreDistrito = null;
        String sql = "SELECT d.nombreDistrito FROM usuario u " +
                "JOIN distrito d ON u.idDistrito = d.idDistrito " +
                "WHERE u.idUsuario = ?";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                nombreDistrito = rs.getString("nombreDistrito");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nombreDistrito;
    }
    public String obtenerCorreoPorUsuario(int idUsuario) {
        String correo = null;
        String sql = "SELECT correo FROM credencial WHERE idUsuario = ?";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                correo = rs.getString("correo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return correo;
    }

    public String obtenerNombreRolPorUsuario(int idUsuario) {
        String nombreRol = null;
        String sql = "SELECT r.nombreRol FROM usuario u JOIN rol r ON u.idRol = r.idRol WHERE u.idUsuario = ?";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                nombreRol = rs.getString("nombreRol");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nombreRol;
    }
}
