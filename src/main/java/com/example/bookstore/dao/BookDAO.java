package com.example.bookstore.dao;

import com.example.bookstore.model.Book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BookDAO extends DAO{
    public BookDAO() {
    }
    public ArrayList<Book> getAllBook(String keyword){
        ArrayList<Book> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "";
            if (keyword.equals("rong")){
                sql = "select*from book_project.book";
            }
            else sql = "SELECT * FROM book_project.book WHERE name LIKE '%"+ keyword +"%'";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String author = resultSet.getString("author");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category");
                String price = resultSet.getString("price");
                String page = resultSet.getString("page");
                String date = resultSet.getString("date");
                String img = resultSet.getString("img");
                int isFavorite = resultSet.getInt("isFavorite");
                Book book = new Book(id,name,author,price,description,category,page,date,img,isFavorite);
                list.add(book);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public Book getOneBook(String id){
        Book book = new Book();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "select*from book_project.book where id=" + id;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String name = resultSet.getString("name");
                String author = resultSet.getString("author");
                String description = resultSet.getString("description");
                String category = resultSet.getString("category");
                String price = resultSet.getString("price");
                String page = resultSet.getString("page");
                String date = resultSet.getString("date");
                String img = resultSet.getString("img");
                int isFavorite = resultSet.getInt("isFavorite");
                book.setId(id);
                book.setName(name);
                book.setAuthor(author);
                book.setDate(date);
                book.setDescription(description);
                book.setCategory(category);
                book.setPage(page);
                book.setPrice(price);
                book.setImg(img);
                book.setIsFavorite(isFavorite);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return book;
    }
    public void deleteBook(int book_id){
        PreparedStatement ps = null;
        String sql = "DELETE from book_project.book where id =" + book_id;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void updateBook(String id, String name, String author, String description, String date, String page, String category, String img){
        PreparedStatement ps = null;
        String sql = "UPDATE book_project.book set name = ?, author = ? , description = ? , date = ? , page = ?, category = ? , img = ? WHERE id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,author);
            ps.setString(3,description);
            ps.setString(4,date);
            ps.setString(5,page);
            ps.setString(6,category);
            ps.setString(7,img);
            ps.setString(8,id);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
