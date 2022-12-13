package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Book_Item;
import com.example.bookstore.model.Cart;
import com.example.bookstore.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;

@WebServlet("/add_cart")
public class AddCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String quantity = req.getParameter("quantity");
        String book_id = req.getParameter("id");
        CartDAO cartDAO = new CartDAO();
        BookDAO bookDAO = new BookDAO();
        Cart cart = new Cart();
        User user = (User) session.getAttribute("user");
        if (!cartDAO.existCart(Integer.parseInt(user.getId()))) {
            cartDAO.createCart(Integer.parseInt(user.getId()));
        }
        cart = cartDAO.getCart(Integer.parseInt(user.getId()));
        if (Integer.parseInt(quantity) <= 0){
            session.setAttribute("quantity_error",true);
        }
        else{
            session.removeAttribute("quantity_error");
            Book book = bookDAO.getOneBook(book_id);
            Book_Item bookItem = new Book_Item(book,Integer.parseInt(quantity));
            if (cartDAO.existItem(bookItem,cart.getId()) == null){
                cartDAO.addItemToCart(bookItem,cart.getId());
            }
            else {
                int id = cartDAO.existItem(bookItem,cart.getId()).get(0);
                int old_quantity = cartDAO.existItem(bookItem,cart.getId()).get(1);
                cartDAO.updateItem(bookItem,id,old_quantity);
            }
            session.setAttribute("cart",cart);
        }
        resp.sendRedirect("/detail?id=" + book_id);
    }
}
