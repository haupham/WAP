package Model;

import java.io.Serializable;

/**
 * Created by haupham on 7/14/19.
 */
public class Product implements Serializable {
    private int id;
    private String prdName;
    private String prdImg;
    private double prdPrice;
    private String prdDesc;

    public Product() {

    }

    public Product(int id, String prdName, String prdImg, double prdPrice, String prdDesc) {
        this.id = id;
        this.prdName = prdName;
        this.prdImg = prdImg;
        this.prdPrice = prdPrice;
        this.prdDesc = prdDesc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrdName() {
        return prdName;
    }

    public void setPrdName(String prdName) {
        this.prdName = prdName;
    }

    public String getPrdImg() {
        return prdImg;
    }

    public void setPrdImg(String prdImg) {
        this.prdImg = prdImg;
    }

    public double getPrdPrice() {
        return prdPrice;
    }

    public void setPrdPrice(double prdPrice) {
        this.prdPrice = prdPrice;
    }

    public String getPrdDesc() {
        return prdDesc;
    }

    public void setPrdDesc(String prdDesc) {
        this.prdDesc = prdDesc;
    }
}
