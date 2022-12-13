package com.example.bookstore.model;

public class User {
    String id, email,password,type;

    public User(String id, String email, String password, String type) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.type = type;
    }

    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return id+" "+ email + " "+password;
    }
}
