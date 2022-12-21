package com.example.bookstore.controller;

import com.example.bookstore.dao.BookDAO;
import com.example.bookstore.dao.CategoryDAO;
import com.example.bookstore.model.Book;
import com.example.bookstore.model.Category;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/save")
@MultipartConfig
public class EditBookServlet extends HttpServlet {
    public static String id;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        id = req.getParameter("id");
        BookDAO bookDAO = new BookDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        Book book = new Book();
        if (id.equals("-1")){
            book = null;
        }
        else {
            book = bookDAO.getOneBook(id);
        }
        ArrayList<Category> categories = categoryDAO.getAllCategory();
        req.setAttribute("categorys",categories);
        req.setAttribute("book", book);
        RequestDispatcher dispatcher = req.getRequestDispatcher("addeditbook.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("title");
        String author = req.getParameter("author");
        String description = req.getParameter("description");
        String date = req.getParameter("date");
        String page = req.getParameter("page");
        String category = req.getParameter("category");
        Part filePart = req.getPart("image"); //
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String savePath = "D:/BookStore/src/main/webapp/images/"  + fileName;
        File file = new File(savePath);
        filePart.write(savePath + File.separator);
        BookDAO bookDAO = new BookDAO();
        String realPath = savePath.substring(29);
        bookDAO.updateBook(id,name,author,description,date,page,category,realPath);
        resp.sendRedirect("admin");
    }
}
