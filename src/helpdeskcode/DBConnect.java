/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpdeskcode;

/**
 *
 * @author Mukama
 */
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public interface DBConnect extends Remote {
    Connection conn=null;
    public String username="Martin";
    public String password="help12345";
    public String driverName="com.mysql.jdbc.Driver";
    public String url="jdbc:mysql://192.168.1.38/help_db";
    public Connection getConnection() throws RemoteException,SQLException;
}


