package controller.users;

import model.User;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ShowUsersServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();
    private List<User> usersData = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/admin/admin.jsp";
        try {
            usersData = INSTANCE_DB_MANAGER.getUsers();
        } catch (Exception e) {
            e.printStackTrace();
            url = "/error/error_java";
        }

        request.setAttribute("usersData", usersData);
        getServletContext().getRequestDispatcher(url).forward(request,response);
    }
}