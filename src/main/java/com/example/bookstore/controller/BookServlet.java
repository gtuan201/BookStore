package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.model.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/home")
public class BookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String keyword = req.getParameter("keyword");
        if (keyword == null){
            keyword = "rong";
        }
        BookDAO bookDAO = new BookDAO();
        ArrayList<Book> list_book = bookDAO.getAllBook(keyword);
        req.setAttribute("list_book", list_book);
        RequestDispatcher dispatcher = req.getRequestDispatcher("book.jsp");
        dispatcher.forward(req, resp);
    }
}
