package Controller;

import Model.User;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by haupham on 7/11/19.
 */
public class DBConfig {

    public static final Map<String, User> users = new HashMap<String, User>();
    static {
        users.put("user1",new User("user1","user1"));
        users.put("admin",new User("admin","admin"));
    }


    public static User getCurrentUser(String username){
        return users.get("username");
    }
    public static final boolean authenticated(String username, String password) {
        User user = users.get(username);
        if (user != null && username != null && user.getUsername().equals(username)
                && password != null && user.getPassword().equals(password))
            return true;
        return false;
    }
}
