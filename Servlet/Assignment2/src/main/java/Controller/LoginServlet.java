package Controller;

import Model.User;
import javafx.scene.media.SubtitleTrack;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by haupham on 7/11/19.
 */

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoginServlet.DoPost");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checked =  request.getParameter("remember");

        User user = new User(username, password);
        DBConfig db = new DBConfig();

        //save on session
        if(db.authenticated(username, password)){
            //if login success -> create new session
            HttpSession session = request.getSession(); //creates new session if none exists
            session.isNew(); //checks whether is a new session
            request.getSession(false); //returns null if none exists
            session.setMaxInactiveInterval(20*60); //seconds
            session.setAttribute("currtUsr",user);


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

            response.sendRedirect("view/success.jsp");
        }else{
            request.setAttribute("msg","Login Fail!Please try again!");
            response.sendRedirect("/day2");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("LoginServlet.DoGet");

    }
}
