package OfficeAdministrator;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

    static Connection con=null;
    static Statement st=null;
    static ResultSet rs=null;
    
    private DBConnector() {
    }
    
    static {
        try{
           Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/officeadmin","root","root");
            System.out.println("Connected");
           st=con.createStatement();
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        catch(ClassNotFoundException e){
            System.out.println(e);
        }
    } 
    
    public static Statement getStatement(){
        return st;
    }
}
