package Service;

import Model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by haupham on 7/14/19.
 */
public class ProductService {
    private Map<Integer, Product> productList = new HashMap();

    {
        productList.put(1, new Product(1,"Versace Eros","p1.jpg",8.73,"By Versace Cologne"));
        productList.put(2, new Product(2,"Eternity","p2.jpg",13.97,"By Calvin Klein Cologne"));
        productList.put(3, new Product(3,"Montblanc Legend","p3.jpg",3.07,"By Mont Blanc Cologne"));
        productList.put(4, new Product(4,"Cool Water","p4.jpg",5.19,"By Davidoff Cologne"));
        productList.put(5, new Product(5,"Boss No.6","p5.jpg",11.35,"By Hugo Boss Cologne"));
        productList.put(6, new Product(6,"Light Blue","p6.jpg",16.64,"By Dolce & Gabbana Cologne"));
        productList.put(7, new Product(7,"Obsession","p7.jpg",14.84,"By Calvin Klein Cologne"));
        productList.put(8, new Product(8,"Versace Homme","p8.jpg",7.85,"By Versace Cologne"));
        productList.put(9, new Product(9,"Angel","p9.jpg",12.47,"By Thierry Mugler Cologne"));

    }

    public void addProduct(Product product){
        productList.put(product.getId(),product);
    }

    public void removeProduct(int productId){
        productList.remove(productId);
    }

    public void updateProduct(Product product){
        productList.put(product.getId(), product);
    }

    public List<Product> getAllProducts(){
        return new ArrayList<Product>(productList.values());
    }

    public Product getProduct(int productId){
        return productList.get(productId);
    }
}
