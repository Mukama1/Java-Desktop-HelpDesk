package helpdeskcode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mukama
 */
public class DataBaseConnection {
   
    public static void main(String[] args) {
        
    }
     public static Connection getConnection() throws ClassNotFoundException, SQLException{
        String username="root";
        String password="";
        String driverName="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://127.0.0.1:3306/help_db";
        Class.forName(driverName);
        return DriverManager.getConnection(url, username, password);

     }

}
