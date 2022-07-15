<%-- 
    Document   : dummy
    Created on : 19 Apr, 2022, 12:27:03 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head><title>Product Manager</title></head>
    <body>
        <form method="get" action="product_change.jsp">
            <table>

<%
    String action = request.getParameter("action");
%>
<%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","");
        Statement stmt = con.createStatement();
        int pid = Integer.parseInt(request.getParameter("pid"));
        ResultSet rs = stmt.executeQuery("Select * from product WHERE pid = " + pid);
        rs.next();
        pid = rs.getInt(1);
        int stock = rs.getInt(2);
        int price = rs.getInt(3);
        String pname = rs.getString(4);
        String pimg = rs.getString(5);
        String pdes = rs.getString(6);
%>
<tr>
    <td><label>SrNo : </label></td>
    <td><input type="text" readonly="readonly" value="<%= pid %>" name="pid"></td>
</tr>
<tr>
    <td><label>Stock : </label></td>
    <td><input type="text" name="stock" value="<%= stock %>"></td>
</tr>
<tr>
    <td><label>Price : </label></td>
    <td><input type="text" name="price" value="<%= price %>"></td>
</tr>
<tr>
    <td><label>Pname : </label></td>
    <td><input type="text" name="pname" value="<%= pname %>"></td>
</tr>
<tr>
    <td><label>Pimg : </label></td>
    <td><input type="text" name="pimg"  value="<%= pimg %>"></td>
</tr>
<tr>
    <td><label>Pdes : </label></td>
    <td><input type="text" name="pdes"  value="<%= pdes %>"></td>
</tr>
<tr>
    <td colspan="2"><input type="hidden" value="<%= action %>" name="action"><input type="submit" value="Save Product"></td>
</tr>

            </table>
        </form>
    </body>
</html>

