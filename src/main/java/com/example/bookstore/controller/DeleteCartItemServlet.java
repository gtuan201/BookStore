package com.example.bookstore.controller;

import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.model.Cart;
import com.example.bookstore.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete_item")
public class DeleteCartItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = req.getParameter("id");
        User user = (User) session.getAttribute("user");
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCart(Integer.parseInt(user.getId()));
        cartDAO.deleteItem(id, String.valueOf(cart.getId()));
        resp.sendRedirect("/cart");
    }
}
