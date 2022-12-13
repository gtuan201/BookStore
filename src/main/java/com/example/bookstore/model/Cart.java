package com.example.bookstore.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    int id;
    User user;
    List<Book_Item> list = new ArrayList<>();

    public Cart(int id, User user, List<Book_Item> list) {
        this.id = id;
        this.user = user;
        this.list = list;
    }

    public Cart() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Book_Item> getList() {
        return list;
    }

    public void setList(List<Book_Item> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return id +" "+user.id;
    }
}
