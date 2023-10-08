package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Ana Montufar
 */
public class Puesto {
    private int id_puesto;
    private String puesto;
    private Conexion cn;
    

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public String getPuesto() {
        return puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }
    
    public Puesto(){
        
    }

    public Puesto(int id_puesto, String puesto) {
        this.id_puesto = id_puesto;
        this.puesto = puesto;
    }
    
     public HashMap drop_sangre(){
        HashMap<String,String> drop = new HashMap();
        try{
            cn = new Conexion();
            String querty = "select Id_puesto as id, puesto from puestos";
            cn.abrirConexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(querty);
            while(consulta.next()){
                drop.put(consulta.getString("id"), consulta.getString("puesto"));
            }
            cn.cerrarConexion();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return drop;
    }
     
    
}
