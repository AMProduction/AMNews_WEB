package controller;

import tools.Security;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by snooki on 02.04.16.
 */
public class RequestPrivilegesFilter implements Filter {

    private final Security INSTANCE_SECURITY = Security.getInstance();

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession();

        String url = request.getRequestURI().toString();

        if (session.getAttribute("accessLevel") != null) {
            Integer accessLevel = Integer.parseInt(session.getAttribute("accessLevel").toString());
            if (INSTANCE_SECURITY.isChecked(url, accessLevel)) {
                chain.doFilter(request, resp);
            } else {
                response.sendRedirect("/error/error_401.jsp");
            }
        }
        else {
            response.sendRedirect("/error/error_404.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
