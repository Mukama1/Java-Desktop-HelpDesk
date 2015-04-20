/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sockets;

/**
 *
 * @author Mukama
 */
import helpdeskcode.DBConnect;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
	
public class Server implements DBConnect {
	
    public Server() {}

    /**
     *
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public static Connection getConnections() throws ClassNotFoundException, SQLException{
        String username="Martin";
        String password="help12345";
        String driverName="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://192.168.1.38/help_db";
        Class.forName(driverName);
        return DriverManager.getConnection(url, username, password);

     }
	
    public static void main(String args[]) {
	
	try {
	    Server obj = new Server();
	    DBConnect stub = (DBConnect) UnicastRemoteObject.exportObject(obj, 0);
            System.out.println("RMI server started");
            
	    // Bind the remote object's stub in the registry
	    Registry registry = LocateRegistry.getRegistry();
	    registry.bind("DBConnect", stub);

	    System.err.println("Server ready");
	} catch (Exception e) {
	    System.err.println("Server exception: " + e.toString());
	    e.printStackTrace();
	}
    }

    /**
     *
     * @return
     * @throws RemoteException
     * @throws SQLException
     */
    @Override
    public Connection getConnection() throws RemoteException, SQLException{
        try {
            Class.forName(DBConnect.driverName);
            Connection conn= DriverManager.getConnection(DBConnect.url, DBConnect.username, DBConnect.password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Server.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
        

}