package com.example.bookstore.dao;

import com.example.bookstore.model.Book_Item;
import com.example.bookstore.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class OrderDAO extends DAO{
    public OrderDAO() {
    }
    public void saveOrder(String name, String address, String phonenumber, User user, String total, ArrayList<Book_Item> list, int cart_id){
        PreparedStatement ps = null;
        String hopdong_id = "";
        String sql = "INSERT INTO book_project.order VALUES (null, ?, ?, ?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getId());
            ps.setString(2,name);
            ps.setString(3,address);
            ps.setString(4,phonenumber);
            ps.setInt(5,1);
            ps.setString(6,total);
            ps.executeUpdate();
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM book_project.order");
            while (resultSet.next()){
                hopdong_id = resultSet.getString("id");
            }
            for (Book_Item bookItem : list){
                ps = con.prepareStatement("INSERT INTO book_project.book_order VALUES (null, ?,?,?)");
                ps.setString(1,bookItem.getBook().getId());
                ps.setInt(2,bookItem.getQuantity());
                ps.setString(3,hopdong_id);
                ps.executeUpdate();
                ps = con.prepareStatement("DELETE from book_project.book_item where cart_id = " + cart_id);
                ps.executeUpdate();
            }
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
