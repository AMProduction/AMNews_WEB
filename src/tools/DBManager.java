package tools;

import model.News;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Properties;

/**
 *	Created by snooki on 02.16.
 *	@version 1.2 2016-03
 *	@author Andrii Malchyk
 */

public class DBManager {

    private static DBManager instance;

    private DBManager() {
        Properties props = new Properties();

        final String sFileName = "database.properties";
        String sDirSeparator = System.getProperty("file.separator");
        File currentDir = new File(".");
        try{
            //String sFilePath = currentDir.getCanonicalPath() + sDirSeparator + sFileName;
            Path sFilePath = Paths.get(currentDir.getCanonicalPath(), sDirSeparator, sFileName);
            try (InputStream in = new BufferedInputStream(new FileInputStream(sFilePath.toString()))) {
                props.load(in);
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        String driver = props.getProperty("jdbc.drivers");
        System.setProperty("jdbc.drivers", driver);

        url = props.getProperty("jdbc.url");
        username = props.getProperty("jdbc.username");
        password = props.getProperty("jdbc.password");
    }

    public static DBManager getInstance() {
        if(instance == null) {
            instance = new DBManager();
        }

        return instance;
    }

    private String url;
    private String username;
    private String password;

    /**
     * Зєднання з базою. Параметри підключення зчитуємо з файла
     * @return зєднання
     * @throws IOException	зчитування  з файлу
     * @throws SQLException	помилки роботи з базою
     */
    private Connection getConnectionToDB() throws IOException, SQLException, ClassNotFoundException {
        Connection connect;

        Class.forName("org.postgresql.Driver");
        connect = DriverManager.getConnection(url, username, password);
        connect.setAutoCommit(false);

        return connect;
    }

    /**
     * Зчитуємо з бази дані. Заносимо у колекцію
     * @return newsData ObservableList<News> колекція обєктів
     * @throws SQLException	помилки роботи з базою
     * @throws IOException	зчитування  з файлу (бо юзається метод ConnectionToDB())
     */
    public ArrayList<News> getNews() throws SQLException, IOException, ClassNotFoundException {
        ArrayList<News> newsData = new ArrayList();
        Statement stmt;
        Connection connect = getConnectionToDB();

        try {
            stmt = connect.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM \"News\"");
            while (rs.next()) {
                int id = rs.getInt("id");
                String subject = rs.getString("subject");
                String textPresenter = rs.getString("text_presenter");
                String textNews = rs.getString("text_news");
                LocalDateTime createdDate = rs.getTimestamp("created_date").toLocalDateTime();
                LocalDateTime lastModifiedDate = rs.getTimestamp("last_modified_date").toLocalDateTime();

                newsData.add(new News(id, subject, textPresenter, textNews, createdDate, lastModifiedDate));
            }
            rs.close();
            stmt.close();
        }
        finally {
            if (connect != null)
                connect.close();
        }

        return newsData;
    }

    /**
     * Записуємо у базу новину
     * @param aNews	обєкт класу новина
     * @throws SQLException	помилки роботи з базою
     * @throws IOException	зчитування  з файлу (бо юзається метод ConnectionToDB())
     */
    public void addRecord (News aNews) throws SQLException, IOException, ClassNotFoundException {
        PreparedStatement stat;
        final String insertQuery =
                "INSERT INTO \"News\" (subject, text_presenter, text_news, created_date, last_modified_date)"
                        + "VALUES (?, ?, ?, ?, ?)";

        Connection connect = getConnectionToDB();

        try{
            stat = connect.prepareStatement(insertQuery);
            stat.setString(1, aNews.getSubject());
            stat.setString(2, aNews.getTextPresenter());
            stat.setString(3, aNews.getTextNews());
            stat.setTimestamp(4, Timestamp.valueOf(aNews.getCreatedDate()));
            stat.setTimestamp(5, Timestamp.valueOf(aNews.getLastModifiedDate()));

            stat.executeUpdate();

            connect.commit();
            stat.close();
        }
        catch (SQLException e) {
            connect.rollback();
            throw e;
        }
        finally {
            if (connect != null)
                connect.close();
        }
    }

    /**
     * Оновлюємо новину у базі
     * @param aNews	обєкт класу новина
     * @throws SQLException	помилки роботи з базою
     * @throws IOException	зчитування  з файлу (бо юзається метод ConnectionToDB())
     */
    public void updateRecord (News aNews) throws SQLException, IOException, ClassNotFoundException {
        PreparedStatement stat;
        final String updateQuery =
                "UPDATE \"News\" set subject = ?, text_presenter = ?, text_news = ?, "
                        + "created_date = ?, last_modified_date = ? "
                        + "where id = ?";

        Connection connect = getConnectionToDB();

        try {
            stat = connect.prepareStatement(updateQuery);
            stat.setString(1, aNews.getSubject());
            stat.setString(2, aNews.getTextPresenter());
            stat.setString(3, aNews.getTextNews());
            stat.setTimestamp(4, Timestamp.valueOf(aNews.getCreatedDate()));
            stat.setTimestamp(5, Timestamp.valueOf(aNews.getLastModifiedDate()));
            stat.setInt(6, aNews.getId());

            stat.executeUpdate();
            connect.commit();
            stat.close();
        }
        catch (SQLException e) {
            connect.rollback();
            throw e;
        }
        finally {
            if (connect != null)
                connect.close();
        }
    }

    /**
     * Видаляємо новину з бази
     * @param id новини
     * @throws SQLException	помилки роботи з базою
     * @throws IOException	зчитування  з файлу (бо юзається метод ConnectionToDB())
     */
    public void deleteRecord (int id) throws SQLException, IOException, ClassNotFoundException {
        PreparedStatement stat;
        final String deleteQuery = "DELETE from \"News\" where id = ?";

        Connection connect = getConnectionToDB();

        try {
            stat = connect.prepareStatement(deleteQuery);
            stat.setInt(1, id);

            stat.executeUpdate();
            connect.commit();
            stat.close();
        }
        catch (SQLException e) {
            connect.rollback();
        }
        finally {
            if (connect != null)
                connect.close();
        }
    }

    /**
     * Повертаємо одну новину за її id
     * @param aId айді новини
     * @return об'єкт типу News
     * @throws SQLException
     * @throws IOException
     * @throws ClassNotFoundException
     */
    public News getOneNews (int aId) throws SQLException, IOException, ClassNotFoundException {
        News oneNews = null;

        PreparedStatement stat;
        final String filterQuery = "SELECT * FROM \"News\" WHERE id = ?";

        Connection connect = getConnectionToDB();

        try {
            stat = connect.prepareStatement(filterQuery);
            stat.setInt(1, aId);

            ResultSet rs = stat.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String subject = rs.getString("subject");
                String textPresenter = rs.getString("text_presenter");
                String textNews = rs.getString("text_news");
                LocalDateTime createdDate = rs.getTimestamp("created_date").toLocalDateTime();
                LocalDateTime lastModifiedDate = rs.getTimestamp("last_modified_date").toLocalDateTime();

                oneNews = new News(id, subject, textPresenter, textNews, createdDate, lastModifiedDate);
            }

            rs.close();
            stat.close();
        }
        finally {
            if (connect != null)
                connect.close();
        }

        return oneNews;
    }
}