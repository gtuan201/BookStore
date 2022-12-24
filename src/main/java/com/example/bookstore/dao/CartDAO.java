package com.example.bookstore.dao;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Book_Item;
import com.example.bookstore.model.Cart;
import com.example.bookstore.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DAO{
    public CartDAO() {
    }
    public boolean existCart (int user_id){
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.cart WHERE user_id = " + user_id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int user_db = resultSet.getInt("user_id");
                if (user_db == user_id) return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public Cart getCart(int user_id){
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.cart WHERE user_id = " + user_id;
            resultSet = statement.executeQuery(sql);
            if (resultSet.next()){
                String id = resultSet.getString("id");
                Cart cart = new Cart();
                User user = new User();
                user.setId(String.valueOf(user_id));
                cart.setId(Integer.parseInt(id));
                cart.setUser(user);
                return cart;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public void createCart(int user_id){
        PreparedStatement ps = null;
        String sql = "INSERT INTO book_project.cart VALUES (null, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,user_id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void addItemToCart(Book_Item bookItem, int cart_id){
        PreparedStatement ps = null;
        String sql = "INSERT INTO book_project.book_item VALUES (null, ?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,bookItem.getBook().getId());
            ps.setInt(2,bookItem.getQuantity());
            ps.setInt(3,cart_id);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void updateItem(Book_Item bookItem,int id, int old_quantity){
        PreparedStatement ps = null;
        try {
            String query = "update book_project.book_item set quantity=? where id=? ";
            ps = con.prepareStatement(query);
            ps.setInt(1, bookItem.getQuantity() + old_quantity);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Integer> existItem(Book_Item bookItem, int cart_id){
        List<Integer> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.book_item WHERE cart_id = " + cart_id +" and book_id=" + bookItem.getBook().getId();
            resultSet = statement.executeQuery(sql);
            if (resultSet.next()){
                int quantity = resultSet.getInt("quantity");
                int id = resultSet.getInt("id");
                list.add(id);
                list.add(quantity);
                return list;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<Book_Item> getAllItemInCart(int cart_id){
        ArrayList<Book_Item> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql;
            sql = "SELECT * FROM book_project.book_item WHERE cart_id =" + cart_id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String book_id = resultSet.getString("book_id");
                int quantity = resultSet.getInt("quantity");
                Book book = new Book();
                book.setId(book_id);
                Book_Item bookItem = new Book_Item(book,quantity);
                list.add(bookItem);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public void deleteItem(String book_id, String cart_id){
        PreparedStatement ps = null;
        String sql = "DELETE from book_project.book_item where book_id =" + book_id +" AND cart_id =" + cart_id;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
