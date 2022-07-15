<%-- 
    Document   : Change_hibernate
    Created on : 27 Apr, 2022, 10:02:35 PM
    Author     : viraj
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="com.eco.app.Product"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.eco.app.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
            int pid = Integer.parseInt(request.getParameter("pid"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            int price = Integer.parseInt(request.getParameter("price"));
            String pname = request.getParameter("pname");
            String pimg = request.getParameter("pimg");
            String pdes = request.getParameter("pdes");
            String action = request.getParameter("action");
%>

<%
    if(action.equals("add"))
    {
        Session s = NewHibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Product p = new Product(pid, stock, price, pname, pimg, pdes);
        s.save(p);
        t.commit();
        s.close();
        response.sendRedirect("Basci_hibernate.jsp");
    }
    else if(action.equals("edit"))
    {
        Session s = NewHibernateUtil.getSessionFactory().openSession();
        Transaction t = s.beginTransaction();
        Product p = (Product)s.get(Product.class,pid);
        p.setPname(pname);
        p.setPrice(price);
        p.setStock(stock);
        p.setPdes(pdes);
        
        s.update(p);
        t.commit();
        s.close();
        response.sendRedirect("hproduct.jsp");
    }
%>
