package Service;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by haupham on 7/12/19.
 */

public class MyFilter implements Filter {
    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;

        String requestingPage = httpServletRequest.getRequestURI();

        HttpSession httpSession = httpServletRequest.getSession();
        httpSession.setAttribute("requestingPage",requestingPage);

        if (requestingPage.equals("/lab3/*") || requestingPage.equals("/lab3/signin") || ((httpSession != null && httpSession.getAttribute("currUsr") != null))) {
            chain.doFilter(req, resp);
        } else {
            httpServletResponse.sendRedirect("/lab3/login.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
