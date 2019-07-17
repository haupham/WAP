package Service;

import Model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;
import java.io.IOException;

/**
 * Created by haupham on 7/12/19.
 */
@WebFilter({"/checkout.jsp","/admin"})
public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;

        String requestingPage = httpServletRequest.getRequestURI();

        HttpSession httpSession = httpServletRequest.getSession();
        httpSession.setAttribute("requestingPage",requestingPage);

        User loginUser = httpSession != null ? (User) httpSession.getAttribute("currUsr"): null;

        //grant to admin user
        if(requestingPage.equals("/lab3/admin")){
            if (loginUser != null && loginUser.getUsername().equals("admin")) {
                chain.doFilter(req, resp);
            } else {
                httpServletResponse.sendRedirect("/lab3/product");
            }
        }else {
            //check login
            if (requestingPage.equals("/lab3/*") || requestingPage.equals("/lab3/signin") || loginUser != null) {
                chain.doFilter(req, resp);
            } else {
                httpServletResponse.sendRedirect("/lab3/login.jsp");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
