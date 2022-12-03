package com.example.bookstore.dao;

import com.example.bookstore.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO extends DAO{
    public UserDAO(){}
    public boolean existUser(String email){
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.user WHERE email = " + "'" + email +"'";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String emailDB = resultSet.getString("email");
                if (emailDB.equals(email)) return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public User login(String email, String password){
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.user WHERE email = " + "'" + email +"' and password=" + "'" + password+"'";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String type = resultSet.getString("type");
                return new User(id,email,password,type);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public void register(String email, String password){
        PreparedStatement ps = null;
        String sql = "INSERT INTO book_project.user VALUES (null, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,password);
            ps.setString(3,"user");
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
