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
 
public class RmiClient { 
    public static void main(String args[]) throws Exception {
        RmiServerIntf obj = (RmiServerIntf)Naming.lookup("Basic");
        System.out.println("Checker:"+obj.getConnection()); 
    }
}
