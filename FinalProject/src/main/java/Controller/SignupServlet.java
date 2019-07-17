package Controller;

import Model.User;
import Service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

/**
 * Created by haupham on 7/15/19.
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet.DoPost");

        String username = request.getParameter("username");



        AccountService db = new AccountService();
        User user = db.getUser(username);
        HttpSession session = request.getSession();
        //save on session
        if(user != null){
            session.setAttribute("msgError","Username was existed!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }else{
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String city = request.getParameter("city");
            String address = request.getParameter("address");
            String zipcode = request.getParameter("zipcode");
            String country = request.getParameter("country");
            //String username, String password, String name, String email, String city, String address, String zipcode
            User newUser = new User(username, password, name, email, city, address, zipcode);
            db.addUser(newUser);

            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
