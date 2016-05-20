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
 * Created by snooki on 30.03.16.
 */
public class UpdateNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/show";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String subject = request.getParameter("subject");
        String textPresenter = request.getParameter("textPresenter");
        String textNews = request.getParameter("textNews");
        String author = (String)session.getAttribute("userName");

        String idPar = request.getParameter("id");
        String createdDatePar = request.getParameter("createdDate");
        if (idPar != null && createdDatePar != null && subject != null && textNews != null) {

            int id = Integer.parseInt(idPar);
            LocalDateTime createdDate = LocalDateTime.parse(createdDatePar);

            LocalDateTime lastModifiedDate = LocalDateTime.now();

            News updateNews = new News(id, subject, textPresenter, textNews, createdDate, lastModifiedDate, author);

            try {
                INSTANCE_DB_MANAGER.updateRecord(updateNews);
            } catch (SQLException e) {
                e.printStackTrace();
                url = "/error/error_java";
            } catch (ClassNotFoundException e1) {
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
