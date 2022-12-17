package com.example.bookstore.controller;

import com.example.bookstore.dao.OrderDAO;
import com.example.bookstore.model.Book_Item;
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


@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Order> orderArrayList = orderDAO.getOrder(user.getId());
        for (Order order : orderArrayList){
            ArrayList<Book_Item> book_order = orderDAO.getItemOrder(order.getId());
            order.setList(book_order);
        }
        req.setAttribute("order_list",orderArrayList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("order.jsp");
        dispatcher.forward(req,resp);
    }
}
