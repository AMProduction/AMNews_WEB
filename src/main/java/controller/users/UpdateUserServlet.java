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
 * Created by snooki on 20.05.16.
 */
public class UpdateUserServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/users";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String position = request.getParameter("newposition");
        int accessLevel = Integer.parseInt(request.getParameter("newaccessLevel"));

        User user = new User(id, login, password, lastName, firstName, position, accessLevel);

        try {
            INSTANCE_DB_MANAGER.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
            url = "/error/error_java";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            url = "/error/error_java";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
