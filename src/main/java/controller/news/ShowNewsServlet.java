package controller.news;

import model.News;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by snooki on 28.03.16.
 */
public class ShowNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();
    private List<News> newsData = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/index.jsp";
        try {
            newsData = INSTANCE_DB_MANAGER.getNews();
        } catch (Exception e) {
            e.printStackTrace();
            url = "/error/error_java";
        }

        request.setAttribute("newsData", newsData);
        getServletContext().getRequestDispatcher(url).forward(request,response);
    }
}
