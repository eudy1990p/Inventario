/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author VOSTRO
 */
public class MySql {
    private java.sql.Connection Conector = null;
    
    public MySql(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Conector = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/curso_inventario", "root", "");
            System.out.println("Conectado");
            //JOptionPane.showMessageDialog(null, "Conectado");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MySql.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MySql.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean actulizarDatos(String table_name,String campos,
            String where) {
        try {
            //String Query = "DELETE FROM " + table_name + " WHERE ID = \"" + ID + "\"";
            //update usuario set nombre= 'albert', tipo = 'cajero' where id = '1'
            String Query = "update " + table_name + " set "+campos
                    +" WHERE  " + where +"";
            System.out.println(Query);
            Statement st = this.Conector.createStatement();
            st.executeUpdate(Query);
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            JOptionPane.showMessageDialog(null, "Error ha marcar"
                    + " como completado la reparación");
            return false;
        }
    }
    public void insertData(String table_name,String campos, String valores) {
        try {
            String sqlInsert = "INSERT INTO " + table_name 
                    + "("+campos+")  VALUES("+valores+" )";
               System.out.println("consulta insert "+sqlInsert);
            Statement st = this.Conector.createStatement();
            st.executeUpdate(sqlInsert);
            System.out.println("Todo bien");
            //JOptionPane.showMessageDialog(null, "Datos almacenados de forma exitosa");
         
        } catch (SQLException ex) {
            System.out.println(ex.getErrorCode()+" "+
                    ex.getMessage()+" "+ex.getCause());
            JOptionPane.showMessageDialog(null, "Error en el"
                    + " almacenamiento de datos");
        }
    }
    
     public String optenerUltimoID(String table_name) {
        String id = "";
        try {
            String Query = "SELECT max(id) as id FROM " + table_name;
            Statement st = this.Conector.createStatement();
            java.sql.ResultSet resultSet;
            resultSet = st.executeQuery(Query);

           if (resultSet.next()) {
                id = resultSet.getString("id");
                System.out.println("ID: " + resultSet.getString("ID") );
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error en la adquisición de datos getValues(String table_name)");
        }
        return id;
    }
     
      public java.sql.ResultSet optenerDatosParaTabla(String table_name, String campos,String otros) {
     java.sql.ResultSet resultSet = null;
        try {
            String Query = "SELECT "+campos+" FROM " + table_name+" "+otros;
           System.out.println(Query);
            Statement st = this.Conector.createStatement();
            
            resultSet = st.executeQuery(Query);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error en la adquisición de datos getValues(String table_name)");
        }
        
        return resultSet;
    }
}
