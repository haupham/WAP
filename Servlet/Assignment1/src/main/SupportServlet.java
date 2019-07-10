import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

/**
 * Created by haupham on 7/9/19.
 */
public class SupportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("form.jsp");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String problem = request.getParameter("problem");
        String probDesc = request.getParameter("probDesc");

        ServletContext ctx = this.getServletContext();
        String emailSupport = ctx.getInitParameter("support_email");

        Random random = new Random();
        int id = 10000 + new Random().nextInt(90000);

        String autoReply = "Thank you! "+name+" for contacting us. We should receive reply from us with in 24 hrs in your email address "+email+". Let us know in our support email "+emailSupport+" if you don’t receive reply within 24 hrs. Please be sure to attach your reference "+id+" in your email.";

        request.setAttribute("name",name);
        request.setAttribute("email",email);
        request.setAttribute("problem",problem);
        request.setAttribute("probDesc",probDesc);
        request.setAttribute("autoReply",autoReply);


        //redirect
        request.getRequestDispatcher("reply.jsp").forward(request, response);
    }


}