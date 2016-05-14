/**
 *	@version 1.0 2016-03
 *	@author Andrii Malchyk
 */

package model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class News implements Serializable{
    private int id;
    private String subject;
    private String textPresenter;
    private String textNews;
    private LocalDateTime createdDate;
    private LocalDateTime lastModifiedDate;

    /**
     * Конструктор JavaBean
     * УВАГА! поля subject, textNews і дати не можуть передаватись порожніми у БД
     */
    public News()
    {
        this.id = 0;
        this.subject = "";
        this.textPresenter = "";
        this.textNews = "";
        this.createdDate = null;
        this.lastModifiedDate = null;
    }
    /**
     * Конструктор для створення нової новини
     * @param id	номер
     * @param subject	тема новини
     * @param textPresenter	текст диктора (підводка)
     * @param textNews	текст новини
     * @param createdDate	дата створення (незмінна)
     * @param lastModifiedDate	дата останньої модифікації
     */
    public News(int id, String subject, String textPresenter, String textNews,
                LocalDateTime createdDate, LocalDateTime lastModifiedDate)
    {
        this.id = id;
        this.subject = subject;
        this.textPresenter = textPresenter;
        this.textNews = textNews;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;
    }

    /**
     * Конструктор для редагування існуючої новини
     * @param subject	тема новини
     * @param textPresenter текст диктора (підводка)
     * @param textNews текст новини
     * @param createdDate дата створення (незмінна)
     * @param lastModifiedDate	дата останньої модифікації
     */
    public News(String subject, String textPresenter, String textNews,
                LocalDateTime createdDate, LocalDateTime lastModifiedDate)
    {
        this.subject = subject;
        this.textPresenter = textPresenter;
        this.textNews = textNews;
        this.createdDate = createdDate;
        this.lastModifiedDate = lastModifiedDate;

        this.id = 0;
    }

    public int getId(){
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTextPresenter() {
        return textPresenter;
    }

    public void setTextPresenter(String textPresenter) {
        this.textPresenter = textPresenter;
    }

    public String getTextNews() {
        return textNews;
    }

    public void setTextNews(String textNews) {
        this.textNews = textNews;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(LocalDateTime lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}