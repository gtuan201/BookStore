package com.example.bookstore.dao;

import com.example.bookstore.model.Category;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoryDAO extends DAO{
    public CategoryDAO() {
    }
    public ArrayList<Category> getAllCategory(){
        ArrayList<Category> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.category";
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String category = resultSet.getString("category");
                Category categoryModel = new Category(id,category);
                list.add(categoryModel);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
