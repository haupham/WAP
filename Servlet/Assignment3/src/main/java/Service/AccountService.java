package Service;

import Model.User;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by haupham on 7/11/19.
 */
public class AccountService {

    private Map<String, User> users = new HashMap();

    {
        users.put("user1",new User("user1","user1","John","john@mem.com","Fairfield","1000N 4th","52557"));
        users.put("admin",new User("admin","admin","Administrator","admin@mem.com","IOWA","2000N Cour St","52556"));
        users.put("buyer",new User("buyer","buyer","Buyer 1","buyer1@mem.com","Des Moines","134 Main St","52556"));
        users.put("seller",new User("seller","seller","Seller 1","seller1@mem.com","Fairfield","434 B St","52556"));

    }


    public User getCurrentUser(String username){
        return users.get(username);
    }
    public final boolean authenticated(String username, String password) {
        User user = users.get(username);
        if (user != null && username != null && user.getUsername().equals(username)
                && password != null && user.getPassword().equals(password))
            return true;
        return false;
    }
}
