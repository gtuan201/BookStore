package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CategoryDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/save")
public class EditBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        BookDAO bookDAO = new BookDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        Book book = new Book();
        if (id.equals("-1")){
            book = null;
        }
        else {
            book = bookDAO.getOneBook(id);
        }
        ArrayList<Category> categories = categoryDAO.getAllCategory();
        req.setAttribute("categorys",categories);
        req.setAttribute("book", book);
        RequestDispatcher dispatcher = req.getRequestDispatcher("addeditbook.jsp");
        dispatcher.forward(req,resp);
    }
}
