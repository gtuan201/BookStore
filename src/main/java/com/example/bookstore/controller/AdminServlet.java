package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.OrderDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Order;
import com.example.bookstore.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && user.getType().equals("admin")){
            BookDAO bookDAO = new BookDAO();
            ArrayList<Book> list_book = bookDAO.getAllBook("rong");
            req.setAttribute("list_book",list_book);
            OrderDAO orderDAO = new OrderDAO();
            ArrayList<Order> list_order = orderDAO.getOrder(null,1);
            req.setAttribute("list_order",list_order);
            RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
            dispatcher.forward(req,resp);
        }
        else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("404.jsp");
            dispatcher.forward(req,resp);
        }
    }
}
