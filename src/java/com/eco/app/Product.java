package com.eco.app;
// Generated 22 Apr, 2022 11:41:57 AM by Hibernate Tools 4.3.1



/**
 * Product generated by hbm2java
 */
public class Product  implements java.io.Serializable {


     private int pid;
     private int stock;
     private int price;
     private String pname;
     private String pimg;
     private String pdes;

    public Product() {
    }

    public Product(int pid, int stock, int price, String pname, String pimg, String pdes) {
       this.pid = pid;
       this.stock = stock;
       this.price = price;
       this.pname = pname;
       this.pimg = pimg;
       this.pdes = pdes;
    }
   
    public int getPid() {
        return this.pid;
    }
    
    public void setPid(int pid) {
        this.pid = pid;
    }
    public int getStock() {
        return this.stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
    }
    public int getPrice() {
        return this.price;
    }
    
    public void setPrice(int price) {
        this.price = price;
    }
    public String getPname() {
        return this.pname;
    }
    
    public void setPname(String pname) {
        this.pname = pname;
    }
    public String getPimg() {
        return this.pimg;
    }
    
    public void setPimg(String pimg) {
        this.pimg = pimg;
    }
    public String getPdes() {
        return this.pdes;
    }
    
    public void setPdes(String pdes) {
        this.pdes = pdes;
    }




}

