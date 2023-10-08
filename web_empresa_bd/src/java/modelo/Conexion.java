package modelo;

import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.*;

/**
 *
 * @author Ana Montufar
 */
public class Conexion {

    public Connection conexionBD;
    public final String bd = "db_empresa";
    public final String urlConexion = String.format("jdbc:mysql://localhost:3306/%s", bd);
    public final String usuario = "usr_empresa";
    public final String contra = "Empres@123";
    public final String jdbc = "com.mysql.cj.jdbc.Driver";

    public void abrirConexion() {
        try {
            Class.forName(jdbc);
            this.conexionBD = DriverManager.getConnection(urlConexion, usuario, contra);
        } catch (HeadlessException | ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "No se conecto a la base de datos " + bd + e.getMessage());
        }
    }

    public void cerrarConexion() {
        try {
            this.conexionBD.close();
        } catch (SQLException e) {
        }
    }
}
