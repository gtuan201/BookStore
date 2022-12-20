package com.example.bookstore.model;

public class Category {
    String id,category;

    public Category(String id, String category) {
        this.id = id;
        this.category = category;
    }

    public Category() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
