package model;

import java.io.Serializable;

/**
 * @version 1.0 14.05.16
 * @author Andrii Malchyk
 */
public class User implements Serializable {
    private int id;
    private String login;
    private String password;
    private String lastName;
    private String firstName;
    private String position;
    private int accessLevel;

    /**
    * Конструктор JavaBean
    */
    public User(){
        this.id = 0;
        this.login = "";
        this.password = "";
        this.lastName = "";
        this.firstName = "";
        this.position = "";
        this.accessLevel = 0;
    }

    /**
     * Конструктор для створення юзера
     */
    public User(String login, String password, String lastName, String firstName,
                String position, int accessLevel){
        this.login = login;
        this.password = password;
        this.lastName = lastName;
        this.firstName = firstName;
        this.position = position;
        this.accessLevel = accessLevel;

        this.id = 0;
    }

    /**
     * Конструктор для редагування юзера
     */
    public User(int id, String login, String password, String lastName, String firstName,
                String position, int accessLevel){
        this.id = id;
        this.login = login;
        this.password = password;
        this.lastName = lastName;
        this.firstName = firstName;
        this.position = position;
        this.accessLevel = accessLevel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getAccessLevel() {
        return accessLevel;
    }

    public void setAccessLevel(int accessLevel) {
        this.accessLevel = accessLevel;
    }
}
