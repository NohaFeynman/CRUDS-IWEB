package com.example.webproyecto.daos;

import com.example.webproyecto.beans.Usuario;
import java.sql.*;

public class CredencialDao {

    private final String url = "jdbc:mysql://localhost:3306/proyecto";
    private final String user = "root";
    private final String pass = "root";

    public Usuario validarLogin(String correo, String contrasenha) {
        Usuario usuario = null;

        String sql = """
            SELECT u.idUsuario, u.nombre, u.apellido, u.dni, u.direccion,u.idRol, 
                   u.idDistrito, u.idEstado, u.foto
            FROM usuario u
            INNER JOIN credencial c ON u.idUsuario = c.idUsuario
            WHERE c.correo = ? AND c.contrasenha = ? AND u.idEstado = 2
            """;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(url, user, pass);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, correo);
                stmt.setString(2, contrasenha);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(rs.getInt("idUsuario"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setDni(rs.getString("dni"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setIdDistrito(rs.getInt("idDistrito"));
                    usuario.setIdRol(rs.getInt("idRol"));
                    usuario.setIdEstado(rs.getInt("idEstado"));
                    usuario.setUrlFoto(rs.getString("foto"));
                }

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public boolean cambiarContrasenha(int idUsuario, String contrasenhaActual, String nuevaContrasenha) {
        String sqlVerificar = "SELECT * FROM credencial WHERE idUsuario = ? AND contrasenha = ?";
        String sqlActualizar = "UPDATE credencial SET contrasenha = ? WHERE idUsuario = ?";

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement stmtVerificar = conn.prepareStatement(sqlVerificar);
             PreparedStatement stmtActualizar = conn.prepareStatement(sqlActualizar)) {

            // Verificar contraseña actual
            stmtVerificar.setInt(1, idUsuario);
            stmtVerificar.setString(2, contrasenhaActual);
            ResultSet rs = stmtVerificar.executeQuery();

            if (rs.next()) {
                // Contraseña actual correcta, proceder a cambiar
                stmtActualizar.setString(1, nuevaContrasenha);
                stmtActualizar.setInt(2, idUsuario);
                int filas = stmtActualizar.executeUpdate();
                return filas > 0;
            }
            else{
                return false; // Contraseña actual incorrecta
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

