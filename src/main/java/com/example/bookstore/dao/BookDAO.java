package com.example.bookstore.dao;

import com.example.bookstore.model.Book;

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
        return book;
    }
}
