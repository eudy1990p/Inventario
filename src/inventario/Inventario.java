/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inventario;

import Conexion.MySql;
import Login.Login;

/**
 *
 * @author VOSTRO
 */
public class Inventario {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //MySql mysql = new MySql();
        //mysql.insertData("persona", " nombre,apellido "," 'juan','ramirez' ");
        Login login = new Login();
       login.setVisible(true);
    }
    
}
