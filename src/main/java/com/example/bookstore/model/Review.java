package com.example.bookstore.model;

public class Review {
    int id,idBook,idUser,rating;
    String review,email_user;

    public Review() {
    }

    public Review(int id, int idBook, int idUser, int rating, String review, String email_user) {
        this.id = id;
        this.idBook = idBook;
        this.idUser = idUser;
        this.rating = rating;
        this.review = review;
        this.email_user = email_user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }
}
