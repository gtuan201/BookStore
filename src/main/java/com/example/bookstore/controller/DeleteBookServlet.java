package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        int book_id = Integer.parseInt(req.getParameter("id"));
        bookDAO.deleteBook(book_id);
        resp.sendRedirect("/admin");
    }
}
