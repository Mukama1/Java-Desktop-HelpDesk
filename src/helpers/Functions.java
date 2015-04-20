/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import helpdeskcode.DataBaseConnection;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import sockets.Server;

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
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
 
    }
    /*
    *insert a single record in the database
    */
    public void saveSingleRecord(String record,String columnName,String tableName)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName+ ") values (?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, record);
            stmt.execute();
            dialogBuilder("Record Saved");
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
    /*
    *insert two records in the database
    */
    public void saveTwoRecords(String recordOne,int recordTwo,String columnName1,String columnName2,String tableName)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName1+","+ columnName2+ ") values (?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, recordOne );
            stmt.setInt(2, recordTwo);
            stmt.execute();
            dialogBuilder("Record Saved");
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    /*
    *insert two records in the database
    */
    public void saveThreeRecords(String recordOne,int recordTwo,String recordThree,String columnName1,String columnName2,String columnName3,String tableName)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName1+","+ columnName2+ ","+columnName3+") values (?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, recordOne );
            stmt.setInt(2, recordTwo);
            stmt.setString(3,recordThree);
            stmt.execute();
            dialogBuilder("Record Saved");
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
   /*
    * function for retrieving records from the database.
    
    */ 
    public ResultSet showRecords(String sql) throws ClassNotFoundException, SQLException
    {
        try{
             conn=DataBaseConnection.getConnection();
             stmt=conn.prepareStatement(sql);
        }catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return stmt.executeQuery(sql);
    }
    //function for checking user authentication
    public String Authentication(String loginId, String Password)
    {   
        try
        {
            String userType="";
                String query = "SELECT * FROM users WHERE User_Name='"+loginId+"' AND Password = '"+Password+"' AND Status='Active'";
                Server connectDb=new Server();
                conn = connectDb.getConnections();
                System.out.println(conn);
                stmt = conn.prepareStatement(query);
                ResultSet res = stmt.executeQuery();
                //boolean isCheck=false;
                if(res.next()){
                     userType=res.getString("User_Type");
                //isCheck=true;
                }
                return userType;
        }catch(Exception e){
            String userType = "Not Found";
            e.printStackTrace();
            return userType;
        }
    }
    
    
    
    //function for centering the JFrame
    public static void center(JFrame frame) {

        // get the size of the screen, on systems with multiple displays,

        // the primary display is used
     Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();

        // calculate the new location of the window

        int w = frame.getSize().width;

        int h = frame.getSize().height;

        int x = (dim.width - w) / 2;

        int y = (dim.height - h) / 2;

        // moves this component to a new location, the top-left corner of

        // the new location is specified by the x and y

        // parameters in the coordinate space of this component's parent

        frame.setLocation(x, y);

    }
   
    public void updateTable(String sql,String message)
    {
        try{
            conn=DataBaseConnection.getConnection();
            stmt=conn.prepareStatement(sql);
            stmt.execute();
            dialogBuilder(message);
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    public void saveTwo(String recordOne,String recordTwo,String columnName1,String columnName2,String tableName,String message)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName1+","+ columnName2+ ") values (?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, recordOne );
            stmt.setString(2, recordTwo);
            stmt.execute();
            dialogBuilder(message);
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    
    public void sendMessage(String recordOne,String recordTwo,String recordThree,String columnName1,String columnName2,String columnName3,String tableName,String subMessage)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName1+","+ columnName2+ ","+columnName3+") values (?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, recordOne );
            stmt.setString(2, recordTwo);
            stmt.setString(3,recordThree);
            stmt.execute();
            dialogBuilder(subMessage);
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
    
    public void saveThree(String recordOne,String recordTwo,String recordThree,String columnName1,String columnName2,String columnName3,String tableName,String message)
    {
        try{
            conn=DataBaseConnection.getConnection();
            String sql="insert into "+tableName+" (" +columnName1+","+ columnName2+ ","+columnName3+") values (?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, recordOne );
            stmt.setString(2, recordTwo);
            stmt.setString(3,recordThree);
            stmt.execute();
            dialogBuilder(message);
            stmt.close();
        }catch(ClassNotFoundException | SQLException e)
        {
            e.printStackTrace();
        }
    }
}
