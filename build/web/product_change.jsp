<%-- 
    Document   : product_change
    Created on : 14 Apr, 2022, 8:19:51 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
        Statement stmt = con.createStatement();
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
        int changed = stmt.executeUpdate("INSERT INTO product(Pid , Stock , Price , Pname , Pimg , Pdes) VALUES ('" + pid + "','" + stock + "','" + price + "','" + pname + "','" + pimg + "','" + pdes + "')");
        response.sendRedirect("product.jsp");
    }
    else if(action.equals("edit"))
    {
        int added = stmt.executeUpdate("UPDATE product SET `Stock`='" + stock + "',`Price`='" + price + "',`Pname`='" + pname + "',`Pimg`='" + pimg + "', `Pdes`='" + pdes + "' WHERE pid = " + pid);
        response.sendRedirect("product.jsp");
    }
%>
