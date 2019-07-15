package Controller;

import Model.User;
import Service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by haupham on 7/15/19.
 */
@WebServlet("/signin")
public class SigninServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet.DoPost");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checked =  request.getParameter("remember");

        AccountService db = new AccountService();
        User user = db.getCurrentUser(username);
        HttpSession session = request.getSession();
        //save on session
        if(db.authenticated(username, password)){
            //if login success -> create new session
             //creates new session if none exists
            session.isNew(); //checks whether is a new session
            request.getSession(false); //returns null if none exists
            session.setMaxInactiveInterval(20*60); //seconds
            session.setAttribute("currUsr",user);


            //cookie
            if(checked != null){
                Cookie cookie = new Cookie("wap.username", user.getUsername());
                cookie.setMaxAge(30 * 60 * 60 * 24); //for a month
                response.addCookie(cookie);
            }else{
                Cookie cookie = new Cookie("wap.username", "");
                cookie.setMaxAge(-1);
                response.addCookie(cookie);
            }

            Cookie promoCookies = new Cookie("wap.promo", "$100");
            promoCookies.setMaxAge(30 * 60 * 60 * 24); // for a month
            response.addCookie(promoCookies);

            String res = (String) session.getAttribute("requestingPage");
            if(res == null || "".equals("")){
                response.sendRedirect("product");
            }else{
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        }else{
            session.setAttribute("msgError","Username or password is not correct!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //response.sendRedirect("product");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
