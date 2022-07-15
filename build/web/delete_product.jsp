<%-- 
    Document   : delete_product
    Created on : 19 Apr, 2022, 7:00:08 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
        
<!DOCTYPE html>
<%  
    String action = request.getParameter("action");
    if(action.equals("delete"))
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
        Statement stmt = con.createStatement();
        int pid = Integer.parseInt(request.getParameter("pid"));
        int rs = stmt.executeUpdate("DELETE FROM product WHERE pid = " + pid);
        response.sendRedirect("product.jsp");
    }
%>
