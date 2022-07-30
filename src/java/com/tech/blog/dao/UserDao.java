package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }
    
    //method to insert user to data base:
    public boolean insert(User user) {
        boolean flag = false;
        try {
            // user-->database
            String query = "INSERT INTO user(name,email,password,gender,about) VALUES (?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
