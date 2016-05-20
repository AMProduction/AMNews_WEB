package controller.users;

import model.User;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by snooki on 19.05.16.
 */
public class EditUserServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();
    User user = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/admin/edituser.jsp";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));

        if (id == 0) {
            url = "/users";
        }
        else {
            if (id > 0) {
                try {
                    user = INSTANCE_DB_MANAGER.getUser(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                    url = "/error/error_java";
                } catch (ClassNotFoundException e1) {
                    e1.printStackTrace();
                    url = "/error/error_java";
                }

                request.setAttribute("user", user);
            } else {
                url = "/error/error_java";
            }
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
