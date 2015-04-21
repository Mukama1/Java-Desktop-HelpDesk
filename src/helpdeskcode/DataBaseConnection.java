package helpdeskcode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

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
        String username="CollinsMann";
        String password="help12345";
        String driverName="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://192.168.1.38/help_db";
        Class.forName(driverName);
        return DriverManager.getConnection(url, username, password);

     }

}
