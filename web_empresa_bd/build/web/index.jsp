<%-- 
    Document   : index
    Created on : 7/10/2023, 13:30:10
    Author     : Ana Montufar
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#Modal_Empleado" onclick="limpiar()">Nuevo</button>
        
        <div class = "container">
            
            
        <div class="modal fade" id="Modal_Empleado" role="dialog">
        <div class="modal-dialog">
    
        <div class="modal-content">
        <div class="modal-body">
        <form action = "sr_empleado" method = "post" class = "form-group">
                <label for="lbl_id"><b>ID:<b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_codigo"><b>Codigo:<b></label>
                <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                <label for="lbl_nombres"><b>Nombres:<b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1, Nombre2" required>
                <label for="lbl_apellidos"><b>Apellidos:<b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apelldo1, Apellido2" required>
                <label for="lbl_direccion"><b>Dirección:<b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: Calle, Zona, Ciudad" required>
                <label for="lbl_telefono"><b>Teléfono:<b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 42586600" required>
                <label for="lbl_fn"><b>Nacimiento:<b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="" required>
                <label for="lbl_puesto"><b>Puesto:<b></label>
                <select name="drop_puesto" id="drop_puesto" class="form-control">
                   <%
                      Puesto puesto = new Puesto();
                       HashMap<String,String> drop = puesto.drop_sangre();
                       for(String i: drop.keySet()){
                            out.println("<option value= '" + i + "' > " + drop.get(i) + "</option>");
                       }
                   %>
                </select>
                 <br>
                 <button name="btn_agregar" id="btn_agregar" value="Agregar" class="btn btn-primary">Agregar</button>
                 <button name="btn_modificar" id="btn_modificar" value="Modificar" class="btn btn-success">Modificar</button>
                 <button name="btn_eliminar" id="btn_modificar" value="Eliminar" class="btn btn-danger" onclick="javascript:if(!Cofirm('¿Desea Eliminar El Registro?'))return false" >Eliminar</button>
                 <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>          
            </form>
                <br></br>
            
        </div>
        </div>
      
        </div>
        </div>
            
                 <table class="table table-striped">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
        <th>Puesto</th>
      </tr>
    </thead>
    <tbody id="tbl_Empleados">
     <% 
        Empleado empleado = new Empleado();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = empleado.leer();
        for(int i = 0; i < tabla.getRowCount(); i++){
            out.println("<tr data-id=" + tabla.getValueAt(i, 0) + " data-id_p=" + tabla.getValueAt(i, 8)+ ">");
            out.println("<td>"+ tabla.getValueAt(i, 1) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 2) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 3) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 4) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 5) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 6) +"</td>");
            out.println("<td>"+ tabla.getValueAt(i, 7) +"</td>");
            out.println("</tr>");
            
         }
     %>
    </tbody>
  </table>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script type="text/javascript">
            
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_codigo").val("");
                $("#txt_nombres").val("");
                $("#txt_apellidos").val("");
                $("#txt_direccion").val("");
                $("#txt_telefono").val("");
                $("#txt_fn").val("");
                $("#drop_puesto").val(1);
            }
            
            $('#tbl_Empleados').on('click','tr td',function(evt){
                var target,id,id_p,nombres,apellidos,direccion,telefono,nacimiento;
                target = $(event.target);
                id = target.parent().data('id');
                id_p = target.parent().data('id_p');
                codigo = target.parent("tr").find("td").eq(0).html();
                nombres = target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                nacimiento = target.parent("tr").find("td").eq(5).html();
                
                $("#txt_id").val(id);
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
                $("#drop_puesto").val(id_p);
                $("#Modal_Empleado").modal('show');        
            });
                
        </script>
    
    </body>
</html>
