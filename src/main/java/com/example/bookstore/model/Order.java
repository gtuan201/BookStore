package com.example.bookstore.model;

import java.util.ArrayList;
import java.util.List;

public class Order {
    int id;
    User user;
    List<Book_Item> list = new ArrayList<>();
    String name,address,phonenumber,total,order_date,complete_date;
    int status;

    public Order() {
    }

    public Order(User user, List<Book_Item> list, String name, String address, String phonenumber, String total, int status) {
        this.user = user;
        this.list = list;
        this.name = name;
        this.address = address;
        this.phonenumber = phonenumber;
        this.total = total;
        this.status = status;
    }

    public User getUser() {
        return user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
