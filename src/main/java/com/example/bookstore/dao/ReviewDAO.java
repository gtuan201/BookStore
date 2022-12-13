package com.example.bookstore.dao;

import com.example.bookstore.model.Review;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO extends DAO{
    public ReviewDAO() {
    }
    public ArrayList<Review> getListReview(int idBook){
        ArrayList<Review> list = new ArrayList<>();
        try {
            Statement statement = null;
            ResultSet resultSet = null;
            statement = con.createStatement();
            String sql = "SELECT * FROM book_project.review WHERE idBook=" + idBook;
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                int idUser = resultSet.getInt("idUser");
                int rating = resultSet.getInt("rating");
                String review = resultSet.getString("review");
                String email = resultSet.getString("email_user");
                Review reviewModel = new Review(id,idBook,idUser,rating,review,email);
                list.add(reviewModel);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public void addReview(int idBook, int idUser, int rating, String review, String email){
        PreparedStatement ps = null;
        String sql = "INSERT INTO book_project.review VALUES (null, ?, ?, ?, ?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,idBook);
            ps.setInt(2,idUser);
            ps.setInt(3,rating);
            ps.setString(4,review);
            ps.setString(5,email);
            ps.executeUpdate();
            ps.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
