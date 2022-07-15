/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eco.app;

import java.util.HashMap;

/**
 *
 * @author viraj
 */
public class Products {
    int pid,stock;
    double price;
    String pname,pimg,pdes;

    public Products(int pid, int stock, double price, String pname, String pimg, String pdes) {
        this.pid = pid;
        this.stock = stock;
        this.price = price;
        this.pname = pname;
        this.pimg = pimg;
        this.pdes = pdes;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public String getPdes() {
        return pdes;
    }

    public void setPdes(String pdes) {
        this.pdes = pdes;
    }
    
    public static HashMap<Integer,Products> p = new HashMap<Integer,Products>();
    
    public static HashMap<Integer,Products> getProductList()
    {
       // Product p[] = new Product[10];
        p.put(1,new Products(1,100,500,"A","img/product/p1.jpg","Men's Wear"));
        p.put(2,new Products(2,100,400,"B","img/product/p2.jpg","Men's Wear"));
        p.put(3,new Products(3,100,450,"C","img/product/p3.jpg","Men's Wear"));
        p.put(4,new Products(4,100,550,"D","img/product/p4.jpg","Men's Wear"));
        p.put(5,new Products(5,100,600,"E","img/product/p5.jpg","Men's Wear"));
        p.put(6,new Products(6,100,700,"F","img/product/p6.jpg","Men's Wear"));
        p.put(7,new Products(7,100,650,"G","img/product/p7.jpg","Men's Wear"));
        p.put(8,new Products(8,100,800,"H","img/product/p8.jpg","Men's Wear"));
        
        return p;
    }
}
