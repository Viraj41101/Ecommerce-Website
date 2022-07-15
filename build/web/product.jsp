<%-- 
    Document   : product
    Created on : 29 Mar, 2022, 12:17:33 PM
    Author     : viraj
--%>

<%@page import="java.util.HashMap"%>
<%@page import="com.eco.app.Products" %>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            Search By:<select name="searchby">
                <option>Product Name</option>
                <option>Product Price</option>
            </select>
            <select name="operator">
                <option>=</option>
                <option>></option>
                <option><</option>
            </select>
            Search Value:<input type="text" name="value">&nbsp;<input type="submit" value="search">&nbsp;&nbsp;&nbsp;<a href="product.jsp">Clear All</a>&nbsp;&nbsp;&nbsp;<a href="new_product.jsp?action=add"><b>Insert</b></a>
        </form>
        <br>
        <table border="5" width="50%">
            <tr>
                <th>SrNo</th>
                <th>Stock</th>
                <th>Price</th>
                <th>Pname</th>
                <th>Pimg</th>
                <th>Pdes</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs;
                if (request.getParameter("searchby") != null && request.getParameter("operator") != null && request.getParameter("value") != null) 
                {
                    String swn = request.getParameter("searchby");
                    String op = request.getParameter("operator");
                    String swv = request.getParameter("value");

                    if (swn.equals("Product Name")) 
                    {
                        rs = stmt.executeQuery("select * from product where Pname= '" + swv+"'");
                        int srno = 0;
                        while (rs.next()) 
                        {
                            out.println("<tr align=center>");
                            out.println("<td>" + +rs.getInt(1) + "</td>");
                            out.println("<td>" + +rs.getInt(2) + "</td>");
                            out.println("<td>" + +rs.getInt(3) + "</td>");
                            out.println("<td>" + rs.getString(4) + "</td>");
                            out.println("<td>" + rs.getString(5) + "</td>");
                            out.println("<td>" + rs.getString(6) + "</td>");
                            out.println("</tr>");
                        }
                    }
                    else if (swn.equals("Product Price")) 
                    {
                            if(op.equals("="))
                            {
                                rs = stmt.executeQuery("select * from product where Price=" + swv+"");
                            }
                            else if(op.equals(">"))
                            {       
                                rs = stmt.executeQuery("select * from product where Price>" + swv+"");
                            }     
                            else
                            {
                                rs = stmt.executeQuery("select * from product where Price<" + swv+"");
                            }    
                            int srno = 0;
                            while (rs.next()) 
                            {
                                    out.println("<tr align=center>");
                                    out.println("<td>" + +rs.getInt(1) + "</td>");
                                    out.println("<td>" + +rs.getInt(2) + "</td>");
                                    out.println("<td>" + +rs.getInt(3) + "</td>");
                                    out.println("<td>" + rs.getString(4) + "</td>");
                                    out.println("<td>" + rs.getString(5) + "</td>");
                                    out.println("<td>" + rs.getString(6) + "</td>");
                                    out.println("</tr>");
                            }
                        }
                }
                else 
                {
                    rs = stmt.executeQuery("select * from product");
                    //int pid = 0;
                    while (rs.next()) 
                    {

                        //HashMap<Integer,Products> p = new HashMap<>();
                        int pid = rs.getInt(1);
                        out.println("<tr align=center>");
                        out.println("<td>" + +pid + "</td>");
                        out.println("<td>" + +rs.getInt(2) + "</td>");
                        out.println("<td>" + +rs.getInt(3) + "</td>");
                        out.println("<td>" + rs.getString(4) + "</td>");
                        out.println("<td>" + rs.getString(5) + "</td>");
                        out.println("<td>" + rs.getString(6) + "</td>");
                        out.println("<td>" + "<a href=dummy.jsp?action=edit&pid="+ pid +">Edit</a>" + "</td>");
                        out.println("<td>" + "<a href=delete_product.jsp?action=delete&pid="+ pid+">Delete</a>" + "</td>");
                        out.println("</tr>");
                    }
                }
                    String srno = request.getParameter("srno");
                    
            %>
        </table>
    </body>
</html>
