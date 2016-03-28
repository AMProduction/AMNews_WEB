package controller;

import model.News;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by snooki on 28.03.16.
 */
@WebServlet(name = "/show")
public class ShowNews extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();
    private ArrayList<News> newsData = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "/index.jsp";
        try {
            newsData = INSTANCE_DB_MANAGER.getNews();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("newsData", newsData);
        getServletContext().getRequestDispatcher(url).forward(request,response);
    }
}
