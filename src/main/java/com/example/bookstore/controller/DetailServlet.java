package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CartDAO;
import com.example.bookstore.dao.ReviewDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Cart;
import com.example.bookstore.model.Review;
import com.example.bookstore.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        HttpSession session = req.getSession();
        session.setAttribute("id",id);
        BookDAO bookDAO = new BookDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        Book book = bookDAO.getOneBook(id);
        ArrayList<Review> list = reviewDAO.getListReview(Integer.parseInt(id));
        req.setAttribute("list_review",list);
        req.setAttribute("book",book);
        User user = (User) session.getAttribute("user");
        if (user != null && new CartDAO().getCart(Integer.parseInt(user.getId())) != null){
            int cart_id = new CartDAO().getCart(Integer.parseInt(user.getId())).getId();
            int quantity_item = new CartDAO().getAllItemInCart(cart_id).size();
            req.setAttribute("quantity_item",quantity_item);
        }
        else
            req.setAttribute("quantity_item", 0 );
        req.getRequestDispatcher("/detail.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        //Add review
        HttpSession session = req.getSession();
        String rating = req.getParameter("rating");
        String review = req.getParameter("review");
        String idBook = (String) session.getAttribute("id");
        Object o = session.getAttribute("user");
        User user = (User) o;
        ReviewDAO reviewDAO = new ReviewDAO();
        reviewDAO.addReview(Integer.parseInt(idBook), Integer.parseInt(user.getId()),Integer.parseInt(rating),review, user.getEmail());
        resp.sendRedirect("detail?id=" + idBook);
    }
}
