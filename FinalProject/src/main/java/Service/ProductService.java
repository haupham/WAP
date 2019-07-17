package Service;

import Model.Product;
import Model.User;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by haupham on 7/14/19.
 */
public class ProductService {

    public void addProduct(Product product){
        try {
            PreparedStatement st = DatabaseConnection.getInstance()
                    .connection.prepareStatement("insert into product(prdName, prdImg, prdPrice, prdDesc) values(?, ?, ?, ?)");
            st.setString(1, product.getPrdName());
            st.setString(2, product.getPrdImg());
            st.setDouble(3, product.getPrdPrice());
            st.setString(4, product.getPrdDesc());

            // Execute the insert command using executeUpdate()
            // to make changes in database
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts(){
        List<Product> products = new ArrayList<Product>();
        try {

            // Initialize the database
            PreparedStatement st = DatabaseConnection.getInstance()
                    .connection.prepareStatement("SELECT * FROM Product");
            // Same for second parameter
            ResultSet rs = st.executeQuery();
            // Extract data from result set
            while(rs.next()){
                //Retrieve by column name
                int productId = rs.getInt("id");
                String prdName = rs.getString("prdName");
                String prdImg = rs.getString("prdImg");
                double prdPrice = rs.getDouble("prdPrice");
                String prdDesc = rs.getString("prdDesc");
                products.add(new Product(productId, prdName, prdImg, prdPrice, prdDesc));
            }
            // Close all the connections
            st.close();

            return products;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return products;

    }

    public Product getProduct(int productId){
        Product product = null;
        try {

            // Initialize the database
            PreparedStatement st = DatabaseConnection.getInstance()
                    .connection.prepareStatement("SELECT * FROM Product where id = ?");
            // Same for second parameter
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            // Extract data from result set
            while(rs.next()){
                //Retrieve by column name
                String prdName = rs.getString("prdName");
                String prdImg = rs.getString("prdImg");
                double prdPrice = rs.getDouble("prdPrice");
                String prdDesc = rs.getString("prdDesc");
                product = new Product(productId, prdName, prdImg, prdPrice, prdDesc);
            }
            // Close all the connections
            st.close();

            return product;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
}
