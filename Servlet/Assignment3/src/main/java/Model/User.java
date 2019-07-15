package Model;

/**
 * Created by haupham on 7/15/19.
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private String city;
    private String address;
    private String zipcode;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String name, String email, String city, String address, String zipcode) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.city = city;
        this.address = address;
        this.zipcode = zipcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
}
