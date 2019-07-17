package Controller;

import Model.Product;
import Model.User;
import Service.AccountService;
import Service.DatabaseConnection;
import Service.ProductService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.WebEndpoint;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

/**
 * Created by haupham on 7/16/19.
 */
@WebServlet(name = "AdminServlet",
        urlPatterns = {"/admin"},
        initParams = { @WebInitParam(name = "path", value = "/web/images/") })
@MultipartConfig
public class AdminServlet extends HttpServlet{

    private Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService productService = new ProductService();
        req.setAttribute("products", productService.getAllProducts());

        AccountService accountService = new AccountService();
        req.setAttribute("users", accountService.getUsers());

        req.getRequestDispatcher("admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 1. get received JSON data from request
        BufferedReader br = new BufferedReader(new InputStreamReader(req.getInputStream()));

        String json = "";
        if(br != null){
            json = br.readLine();
            System.out.println(json);
        }

        // 2. initiate jackson mapper
        ObjectMapper mapper = new ObjectMapper();

        // 3. Convert received JSON to Article
        Product product = mapper.readValue(json, Product.class);

        // 4. Set response type to JSON
        resp.setContentType("application/json");

        ProductService productService = new ProductService();
        productService.addProduct(product);

        String productsJsonString = this.gson.toJson(productService.getAllProducts());
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(productsJsonString);
        out.flush();

    }


}
