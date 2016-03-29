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
import java.time.LocalDateTime;

/**
 * Created by snooki on 29.03.16.
 */
@WebServlet(name = "/add")
public class AddNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/show";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String subject = request.getParameter("subject");
        String textPresenter = request.getParameter("textPresenter");
        String textNews = request.getParameter("textNews");
        LocalDateTime createdDate = LocalDateTime.now();
        LocalDateTime lastModifiedDate = LocalDateTime.now();

        if (subject != null && textNews != null){
            News news = new News(subject, textPresenter, textNews, createdDate, lastModifiedDate);
            try {
                INSTANCE_DB_MANAGER.addRecord(news);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}