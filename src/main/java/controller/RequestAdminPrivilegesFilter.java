package controller;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by snooki on 02.04.16.
 */
public class RequestAdminPrivilegesFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession();

        Integer adminPrivileges = Integer.parseInt(session.getAttribute("adminPrivileges").toString());
        if (adminPrivileges != null){
            if (adminPrivileges != 1){
                response.sendRedirect("/error/error_401.jsp");
            }
            else{
                chain.doFilter(request, resp);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
