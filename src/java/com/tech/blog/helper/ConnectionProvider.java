
package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection conn;
    public static Connection getConnection(){
        try{
            if(conn == null) {
                //load class driver
                Class.forName("com.mysql.jdbc.Driver");
                
                //create a connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:6969/techblog", "amaan", "amaan");
            }
        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
