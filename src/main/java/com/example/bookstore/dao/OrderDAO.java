package com.example.bookstore.dao;

import com.example.bookstore.model.Book;
import com.example.bookstore.model.Book_Item;
import com.example.bookstore.model.Order;
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
    public ArrayList<Order> getOrder(String user_id, int statusInp){
        ArrayList<Order> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql;
            if (statusInp == 3){
                sql = "select*from book_project.order where user_id=" + user_id + " and status = 3";
            }else if (statusInp == 1 && user_id == null){
                sql = "select*from book_project.order where status = 1";
            }
            else sql = "select*from book_project.order where user_id=" + user_id + " and status = 1 or user_id=" + user_id + " and status =2";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String address= resultSet.getString("address");
                String phonenumber = resultSet.getString("phonenumber");
                int status = resultSet.getInt("status");;
                String total = resultSet.getString("total");
                Order order = new Order();
                order.setId(id);
                order.setName(name);
                order.setAddress(address);
                order.setPhonenumber(phonenumber);
                order.setStatus(status);
                order.setTotal(total);
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Book_Item> getItemOrder(int order_id){
        ArrayList<Book_Item> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "select*from book_project.book_order where order_id=" + order_id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String book_id = resultSet.getString("book_id");
                int quantity = resultSet.getInt("quantity");
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.getOneBook(book_id);
                Book_Item bookItem = new Book_Item(book,quantity);
                list.add(bookItem);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public void cancelOrder(String order_id){
        PreparedStatement ps = null;
        String sql = "DELETE from book_project.order where id =" + order_id;
        String sql2 = "DELETE from book_project.book_order where order_id =" + order_id;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps = con.prepareStatement(sql2);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
