package com.example.bookstore.controller;

import com.example.bookstore.dao.CartDAO;
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
        //get order
        ArrayList<Order> orderArrayList = orderDAO.getOrder(user.getId(),1);
        for (Order order : orderArrayList){
            ArrayList<Book_Item> book_order = orderDAO.getItemOrder(order.getId());
            order.setList(book_order);
        }
        //get older order
        ArrayList<Order> orderOlder = orderDAO.getOrder(user.getId(),3);
        for (Order order : orderOlder){
            ArrayList<Book_Item> book_older = orderDAO.getItemOrder(order.getId());
            order.setList(book_older);
        }
        if (new CartDAO().getCart(Integer.parseInt(user.getId())) != null){
            int cart_id = new CartDAO().getCart(Integer.parseInt(user.getId())).getId();
            int quantity_item = new CartDAO().getAllItemInCart(cart_id).size();
            req.setAttribute("quantity_item",quantity_item);
        }
        else
            req.setAttribute("quantity_item", 0 );
        req.setAttribute("order_complete",orderOlder);
        req.setAttribute("order_list",orderArrayList);
        req.setAttribute("order_size",orderArrayList.size());
        req.setAttribute("older_size",orderOlder.size());
        RequestDispatcher dispatcher = req.getRequestDispatcher("order.jsp");
        dispatcher.forward(req,resp);
    }
}
