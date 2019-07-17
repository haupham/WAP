package Controller;

import Model.User;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by haupham on 7/14/19.
 */

@WebServlet({"/product",""})
public class ProductServlet extends HttpServlet{



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        ProductService productService = new ProductService();
        req.setAttribute("products", productService.getAllProducts());
        User user = (User) req.getSession().getAttribute("currUsr");
        System.out.println(user != null ? user.getUsername() : "Guest");
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();

    }

}