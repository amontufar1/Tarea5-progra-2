package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.*;

/**
 *
 * @author Ana Montufar
 */
public class Empleado extends Persona {

    private String codigo;
    private int id_puesto;
    Conexion cn;

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public Empleado() {

    }

    public Empleado(String codigo, int id_puesto, int id, String nombres, String apellidos, String direccion, String telefono, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fecha_nacimiento);
        this.codigo = codigo;
        this.id_puesto = id_puesto;
    }

    @Override
    public int agregar() {
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String querty = "";
            querty = "INSERT INTO empleados (Codigo, Nombres, Apellidos, Direccion, Telefono, Fecha_Nacimiento, Id_puesto) VALUES (?,?,?,?,?,?,?)";
            cn.abrirConexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(querty);
            parametro.setString(1, this.getCodigo());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getFecha_nacimiento());
            parametro.setInt(7, this.getId_puesto());
            retorno = parametro.executeUpdate();
            cn.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrirConexion();
            String querty = "";
            querty = "SELECT e.Id_empleado as id, e.Codigo, e.Nombres, e.Apellidos, e.Direccion, e.Telefono, e.Fecha_Nacimiento, p.puesto, p.Id_puesto FROM empleados as e INNER JOIN puestos as p on e.Id_puesto = p.Id_puesto ORDER BY Codigo ASC;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(querty);
            // Campos
            String campos[] = {"Id", "Codigo", "Nombres", "Apellidos", "Direccion", "Telefono", "Fecha_Nac", "Puesto", "Id_Puesto"};
            tabla.setColumnIdentifiers(campos);
            // Registros
            String registros[] = new String[9];
            while (consulta.next()) {
                registros[0] = consulta.getString("id");
                registros[1] = consulta.getString("Codigo");
                registros[2] = consulta.getString("Nombres");
                registros[3] = consulta.getString("Apellidos");
                registros[4] = consulta.getString("Direccion");
                registros[5] = consulta.getString("Telefono");
                registros[6] = consulta.getString("Fecha_Nacimiento");
                registros[7] = consulta.getString("puesto");
                registros[8] = consulta.getString("Id_puesto");
                tabla.addRow(registros);

            }
            cn.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
        }
        return tabla;
    }

    @Override
    public int modificar() {
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String querty = "";
            querty = "UPDATE empleados SET Codigo=?, Nombres=?, Apellidos=?, Direccion=?, Telefono=?, Fecha_Nacimiento=?, Id_puesto=? WHERE Id_empleado=?";
            cn.abrirConexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(querty);
            parametro.setString(1, this.getCodigo());
            parametro.setString(2, this.getNombres());
            parametro.setString(3, this.getApellidos());
            parametro.setString(4, this.getDireccion());
            parametro.setString(5, this.getTelefono());
            parametro.setString(6, this.getFecha_nacimiento());
            parametro.setInt(7, this.getId_puesto());
            parametro.setInt(8, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    @Override
    public int eliminar() {
        int retorno = 0;
        try {
            cn = new Conexion();
            PreparedStatement parametro;
            String querty = "";
            querty = "DELETE FROM empleados WHERE Id_empleado=?";
            cn.abrirConexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(querty);
            parametro.setInt(1, this.getId());
            retorno = parametro.executeUpdate();
            cn.cerrarConexion();
        } catch (SQLException e) {
            System.out.println("Error" + e.getMessage());
            retorno = 0;
        }
        return retorno;

    }

}
