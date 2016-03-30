package controller;

import model.News;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by snooki on 29.03.16.
 */
@WebServlet(name = "/edit")
public class EditNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();
    News news = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/edit.jsp";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idPam = request.getParameter("id");
        int id = Integer.parseInt(idPam);

        if (id > 0) {
            try {
                news = INSTANCE_DB_MANAGER.getOneNews(id);
            } catch (SQLException e) {
                e.printStackTrace();
                url = "/error_java";
            } catch (ClassNotFoundException e1) {
                e1.printStackTrace();
                url = "/error_java";
            }
        }

        request.setAttribute("news", news);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}