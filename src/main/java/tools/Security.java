package tools;

/**
 * Created by snooki on 25.05.16.
 */
public class Security {
    private static Security instance;

    public static Security getInstance() {
        if(instance == null) {
            instance = new Security();
        }
        return instance;
    }

    private Security() {
    }

    public boolean isChecked(String url, int accessLevel){
        if ((url.equals("/add")) && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3))){
            return true;
        }
        else
        if ((url.equals("/edit.jsp")) && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3))){
            return true;
        }
        else
        if ((url.equals("/delete")) && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3))){
            return true;
        }
        if ((url.equals("/edit")) && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3) ||
                (accessLevel == 4) || (accessLevel == 5) || (accessLevel == 6))){
            return true;
        }
        else
        if (url.equals("/show") && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3) ||
                (accessLevel == 4) || (accessLevel == 5) || (accessLevel == 6))){
            return true;
        }
        else
        if ((url.equals("/update")) && ((accessLevel == 1) || (accessLevel == 2) || (accessLevel == 3) ||
                (accessLevel == 4))){
            return true;
        }
        else
        if (url.equals("/adduser") && accessLevel == 1){
            return true;
        }
        else
        if (url.equals("/deleteuser") && accessLevel == 1){
            return true;
        }
        else
        if (url.equals("/edituser") && accessLevel == 1){
            return true;
        }
        else
        if (url.equals("/users") && accessLevel == 1){
            return true;
        }
        else
        if (url.equals("/updateusers") && accessLevel == 1){
            return true;
        }
        else {
            return false;
        }
    }
}
