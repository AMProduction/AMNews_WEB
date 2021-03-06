package controller;

import model.User;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by snooki on 14.05.16.
 */
public class CheckLoggingServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    User userData = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/show";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        if (session.isNew()){
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            try {
                userData = INSTANCE_DB_MANAGER.getUser(login, password);
            } catch (SQLException e) {
                e.printStackTrace();
                url = "/error/error_java";
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                url = "/error/error_java";
            }

            if (userData != null)
            {
                session.setAttribute("userName", userData.getLastName()+ " " + userData.getFirstName());
                int accessLevel = userData.getAccessLevel();
                session.setAttribute("accessLevel", accessLevel);
            }
            else {
                session.invalidate();
                request.setAttribute("message", "Невірно введений логін або пароль / " +
                        "Логін або пароль не знайдено у базі");
                url = "/login.jsp";
            }
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
