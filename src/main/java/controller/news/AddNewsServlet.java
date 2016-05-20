package controller.news;

import model.News;
import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * Created by snooki on 29.03.16.
 */
public class AddNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/show";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String subject = request.getParameter("subject");
        String textPresenter = request.getParameter("textPresenter");
        String textNews = request.getParameter("textNews");
        LocalDateTime createdDate = LocalDateTime.now();
        LocalDateTime lastModifiedDate = LocalDateTime.now();
        String author = (String)session.getAttribute("userName");

        if (subject != null && textNews != null){
            News news = new News(subject, textPresenter, textNews, createdDate, lastModifiedDate, author);
            try {
                INSTANCE_DB_MANAGER.addRecord(news);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                url = "/error/error_java";
            } catch (SQLException e1) {
                e1.printStackTrace();
                url = "/error/error_java";
            }
        }
        else {
            url = "/error/error_java";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
