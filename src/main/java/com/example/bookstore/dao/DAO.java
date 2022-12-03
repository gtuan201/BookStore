package com.example.bookstore.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO {
    public static Connection con = null;
    public DAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_project?autoReconnect=true&&useSSL=false","root","123456");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
