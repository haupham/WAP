package Controller;

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
        if (requestingPage.equals("/day2/") || requestingPage.equals("/day2/login") || ((httpSession != null && httpSession.getAttribute("currtUsr") != null))) {
            chain.doFilter(req, resp);
        } else {
            httpServletResponse.sendRedirect("/day2");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
