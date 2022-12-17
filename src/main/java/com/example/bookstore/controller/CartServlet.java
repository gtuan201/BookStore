package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.dao.OrderDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Book_Item;
import com.example.bookstore.model.Cart;
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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCart(Integer.parseInt(user.getId()));
        ArrayList<Book_Item> list = cartDAO.getAllItemInCart(cart.getId());
        int total = 0;
        for (Book_Item bookItem : list){
            Book book = new BookDAO().getOneBook(bookItem.getBook().getId());
            bookItem.setBook(book);
            total += bookItem.getQuantity() * Integer.parseInt(book.getPrice());
        }
        req.setAttribute("book_in_cart",list);
        req.setAttribute("cart_quantity",list.size());
        if (list.size() != 0)
            req.setAttribute("total",total + 21200);
        else {
            req.setAttribute("total",0);
            session.setAttribute("cart_empty",true);
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String phonenumber = req.getParameter("phonenumber");
        String total = req.getParameter("total");
        CartDAO cartDAO = new CartDAO();
        Cart cart = cartDAO.getCart(Integer.parseInt(user.getId()));
        ArrayList<Book_Item> list_in_cart = cartDAO.getAllItemInCart(cart.getId());
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.saveOrder(name,address,phonenumber,user,total,list_in_cart, cart.getId());
        resp.sendRedirect("/home");
    }
}
