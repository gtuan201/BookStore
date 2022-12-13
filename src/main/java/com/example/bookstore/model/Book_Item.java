package com.example.bookstore.model;

public class Book_Item {
    Book book;
    int quantity;

    public Book_Item() {
    }

    public Book_Item(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return book + " "+quantity;
    }
}
