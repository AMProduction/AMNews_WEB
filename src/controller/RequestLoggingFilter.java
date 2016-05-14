package controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by snooki on 02.04.16.
 */
public class RequestLoggingFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();

        if (session.isNew()){
            String userName = request.getParameter("login");
            session.setAttribute("userName", userName);
        }

        chain.doFilter(request, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
