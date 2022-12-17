package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.model.Book;
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
        //get quantity cart
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null && new CartDAO().getCart(Integer.parseInt(user.getId())) != null){
            int cart_id = new CartDAO().getCart(Integer.parseInt(user.getId())).getId();
            int quantity_item = new CartDAO().getAllItemInCart(cart_id).size();
            req.setAttribute("quantity_item",quantity_item);
        }
        else
            req.setAttribute("quantity_item", 0 );
        RequestDispatcher dispatcher = req.getRequestDispatcher("book.jsp");
        dispatcher.forward(req, resp);
    }
}
