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
import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.rmi.registry.*; 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
public class RmiServer  extends UnicastRemoteObject implements RmiServerIntf {
//    public static final String MESSAGE = "Hello World";
    public static final String username="Martin";
    public static final String password="help12345";
    public static final String driverName="com.mysql.jdbc.Driver";
    public static final String url="jdbc:mysql://192.168.1.38/help_db";
 
    public RmiServer() throws RemoteException {
        super(0);    // required to avoid the 'rmic' step, see below
    }
 
    @Override
    public Connection getConnection() {
         Connection conn=null;
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RmiServer.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn= DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(RmiServer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
 
    public static void main(String args[]) throws Exception {
        System.out.println("RMI server started");
 
        try { //special exception handler for registry creation
            LocateRegistry.createRegistry(2002); 
            System.out.println("java RMI registry created.");
        } catch (RemoteException e) {
            //do nothing, error means registry already exists
            System.out.println("java RMI registry already exists.");
        }
 
        //Instantiate RmiServer
 
        RmiServer obj = new RmiServer();
 
        // Bind this object instance to the name "RmiServer"
        Naming.rebind("Basic", obj);
        System.out.println("PeerServer bound in registry");
    }
}
