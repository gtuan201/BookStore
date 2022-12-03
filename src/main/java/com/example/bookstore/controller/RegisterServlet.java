package com.example.bookstore.controller;

import com.example.bookstore.dao.UserDAO;
import com.example.bookstore.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("login_false");
        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rePass = req.getParameter("re-password");
        HttpSession session = req.getSession();
        UserDAO userDAO = new UserDAO();
        if (password.equals(rePass)){
            if (userDAO.existUser(email)){
                session.removeAttribute("equals_pass");
                session.setAttribute("exist",true);
                resp.sendRedirect("/register");
            }
            else {
                session.removeAttribute("exist");
                session.removeAttribute("equals_pass");
                userDAO.register(email,password);
                resp.sendRedirect("/login");
            }
        }
        else {
            session.removeAttribute("exist");
            session.setAttribute("equals_pass",false);
            resp.sendRedirect("/register");
        }
    }
}
