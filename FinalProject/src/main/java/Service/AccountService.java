package Service;

import Model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by haupham on 7/11/19.
 */
public class AccountService {

    public User getUser(String username){
        User user = null;
        try {

            // Initialize the database
            PreparedStatement st = DatabaseConnection.getInstance()
                                .connection.prepareStatement("SELECT * FROM User where username = ?");
            // Same for second parameter
             st.setString(1, username);
            ResultSet rs = st.executeQuery();
            // Extract data from result set
            while(rs.next()){
                //Retrieve by column name
                int id  = rs.getInt("id");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String city = rs.getString("city");
                String address = rs.getString("address");
                String zipcode = rs.getString("zipcode");
                user = new User(username, password, name, email, city, address, zipcode);
            }
            // Close all the connections
            st.close();

            return user;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public final boolean authenticated(String username, String password) {
        User user = getUser(username);
        if (user != null && username != null && user.getUsername().equals(username)
                && password != null && user.getPassword().equals(password))
            return true;
        return false;
    }

    public void addUser(User user){
        try {
            PreparedStatement st = DatabaseConnection.getInstance()
                    .connection.prepareStatement("insert into user(username, password, name, email, city, address, zipcode) values(?, ?, ?, ?, ?, ?, ?)");
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getName());
            st.setString(4, user.getEmail());
            st.setString(5, user.getCity());
            st.setString(6, user.getAddress());
            st.setString(7, user.getZipcode());

            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getUsers() {
        List<User> users = new ArrayList<User>();
        try {

            PreparedStatement st = DatabaseConnection.getInstance()
                    .connection.prepareStatement("SELECT * FROM User");
            ResultSet rs = st.executeQuery();

            // Extract data from result set
            while(rs.next()){
                //Retrieve by column name
                int id  = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String city = rs.getString("city");
                String address = rs.getString("address");
                String zipcode = rs.getString("zipcode");

                User u = new User(username, password, name, email, city, address, zipcode);
                users.add(u);
            }
             st.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }


}
