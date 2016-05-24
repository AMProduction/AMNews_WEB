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
 * Created by snooki on 18.05.16.
 */
public class AddUserServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/users";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String position = request.getParameter("position");
        int accessLevel = 0;

        switch (position) {
            case "Журналіст/редактор":
                accessLevel = 3;
                break;
            case "Випусковий редактор":
                accessLevel = 2;
                break;
            case "Диктор/ведучий":
                accessLevel = 4;
                break;
            case "Літературний редактор":
                accessLevel = 4;
                break;
            case "Продюсер":
                accessLevel = 6;
                break;
            case "Режисер":
                accessLevel = 5;
                break;
            case "Режисер монтажу":
                accessLevel = 6;
                break;
        }

        User user = new User(login, password, lastName, firstName, position, accessLevel);

        try {
            INSTANCE_DB_MANAGER.addUser(user);
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
