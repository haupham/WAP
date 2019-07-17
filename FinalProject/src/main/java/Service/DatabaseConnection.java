package Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by haupham on 7/16/19.
 */
public class DatabaseConnection {
    private static  DatabaseConnection dbInstance = null;
    public Connection connection = null;

    private DatabaseConnection(){
        try {
            // Database Connection
            String dbDriver = "com.mysql.jdbc.Driver";
            String dbUrl = "jdbc:mysql://localhost:3306/";
            String dbName = "mum";
            String dbUsername = "root";
            String dbPassword = "abcd1234";
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(dbUrl+dbName + "?useTimezone=true&serverTimezone=UTC",dbUsername,dbPassword);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public static DatabaseConnection getInstance(){
        if(dbInstance == null)
            dbInstance = new DatabaseConnection();
        return dbInstance;
    }
}
