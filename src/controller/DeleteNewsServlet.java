package controller;

import tools.DBManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by snooki on 30.03.16.
 */
public class DeleteNewsServlet extends HttpServlet {

    private final DBManager INSTANCE_DB_MANAGER = DBManager.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/show";

        String idPam = request.getParameter("id");

        if (idPam != null) {

            int id = Integer.parseInt(idPam);

            if (id == 0) {
                url = "/show";
            }
            else {
                if (id > 0) {
                    try {
                        INSTANCE_DB_MANAGER.deleteRecord(id);
                    } catch (SQLException e) {
                        e.printStackTrace();
                        url = "/error_java";
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                        url = "/error_java";
                    }
                } else {
                    url = "/error_java";
                }
            }
        }
        else{
            url = "/error_java";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }
}
