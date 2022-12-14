package com.example.bookstore.controller;
import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.dao.UserDAO;
import com.example.bookstore.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("equals_pass");
        session.removeAttribute("exist");
        req.getRequestDispatcher("/login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserDAO userDAO = new UserDAO();
        CartDAO cartDAO = new CartDAO();
        HttpSession session = req.getSession();
        User user = userDAO.login(email,password);
        if (user == null){
            session.setAttribute("login_false",false);
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }else {
            if (!cartDAO.existCart(Integer.parseInt(user.getId()))) {
                cartDAO.createCart(Integer.parseInt(user.getId()));
            }
            session.removeAttribute("login_false");
            session.setAttribute("user",user);
            resp.sendRedirect("/home");
        }
    }
}
