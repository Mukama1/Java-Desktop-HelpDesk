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
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.sql.Connection;
 
public interface RmiServerIntf extends Remote {
    public Connection getConnection() throws RemoteException;
}
