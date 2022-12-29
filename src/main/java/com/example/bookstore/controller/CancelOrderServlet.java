package com.example.bookstore.controller;

import com.example.bookstore.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cancel")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.cancelOrder(id);
        resp.sendRedirect("/order");
    }
}
