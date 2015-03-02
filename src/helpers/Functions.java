/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import helpdeskcode.DataBaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

/**
 *
 * @author Mukama
 */
public class Functions {
    Connection conn;
    PreparedStatement stmt;
    
    public String mergeString(String [] stringName,String firstColumn)
    {
        String concatString=firstColumn;
        for(int i=1;i<stringName.length;i++)
        {
           // String name="Names";
            
            if(i<(stringName.length-1))
          {
             concatString+=stringName[i]+",";   
          }else
          {
             concatString+=stringName[i]+" "; 
          }    
           // System.out.printf("%s\n",name);
        }
        return concatString;
    }
    
    
    //for message box purposes
    public void dialogBuilder(String message)
    {
        JOptionPane.showMessageDialog(null, message);
    }
    
    
    //for saving a new record to database...
    // if the records to inserted are more than three, this function should be in position to service that entry
    public void saveDetails(String [] columns,String [] details,String tableName,String firstColumn)
    {
        try {
            conn=DataBaseConnection.getConnection();
           // String formDetails=mergeString(details);
            String columnNames=mergeString(columns,firstColumn+",");
            String values="?,";
            //for defining the number of values that need to be inserted
            for(int x=0;x<((columns.length)-1);x++)
            {
                if(x<(((columns.length))-2))
                {
                    values+="?,";
                }else{
                    values+="?";
                }
            }
            String query="Insert into "+tableName+" ("+ columnNames +") values ("+values+")";
            stmt=conn.prepareStatement(query);
            for(int y=0;y<columns.length;y++)
            {
                stmt.setString((y+1), details[y]);
            }
            stmt.execute();
            dialogBuilder("Record Saved");
            stmt.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
 
    }
}
