package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PostDao {
    Connection conn;
    public PostDao(Connection conn) {
        this.conn = conn;
    }
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.conn.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
