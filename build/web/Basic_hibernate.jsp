<%-- 
    Document   : Basic_hibernate
    Created on : 22 Apr, 2022, 11:46:37 AM
    Author     : viraj
--%>

<%@page import="com.eco.app.NewHibernateUtil"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="com.eco.app.Product"%>
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
            Search Value:<input type="text" name="value">&nbsp;<input type="submit" value="search">&nbsp;&nbsp;&nbsp;<a href="Basic_hibernate.jsp">Clear All</a>&nbsp;&nbsp;&nbsp;<a href="Insert_hibernate.jsp?action=add"><b>Insert</b></a>
        </form>
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
            Session s = NewHibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            if (request.getParameter("searchby") != null && request.getParameter("operator") != null && request.getParameter("value") != null) 
            {
                String swn = request.getParameter("searchby");
                String op = request.getParameter("operator");
                String swv = request.getParameter("value");
                String hql;
                if (swn.equals("Product Name")) 
                {
                    hql = " from Product p where p.pname = '" + swv+"' ";
                    Query q = s.createQuery(hql);
                    List <Product> l = q.list();
                    for(Product p : l){
                        out.println("<tr align='center'>");
                        out.println("<td>" + p.getPid() + "</td>");
                        out.println("<td>" + p.getStock() + "</td>");
                        out.println("<td>" + p.getPrice()+ "</td>");
                        out.println("<td>" + p.getPname()+ "</td>");
                        out.println("<td>" + p.getPimg()+ "</td>");
                        out.println("<td>" + p.getPdes()+ "</td>");
                        out.println("</tr>");
                    }
                }
            
                else if (swn.equals("Product Price")) 
                {
                            if(op.equals("="))
                            {
                                hql = " from Product p where p.price = '" + swv+"' ";
                            }
                            else if(op.equals(">"))
                            {       
                                hql = " from Product p where p.price>'" + swv+"' ";
                            }     
                            else
                            {
                                hql = " from Product p where p.price<'" + swv+"' ";
                            }
                            Query q = s.createQuery(hql);
                            List <Product> l = q.list();
                            for(Product p : l){
                                out.println("<tr align='center'>");
                                out.println("<td>" + p.getPid() + "</td>");
                                out.println("<td>" + p.getStock() + "</td>");
                                out.println("<td>" + p.getPrice()+ "</td>");
                                out.println("<td>" + p.getPname()+ "</td>");
                                out.println("<td>" + p.getPimg()+ "</td>");
                                out.println("<td>" + p.getPdes()+ "</td>");
                                out.println("</tr>");
                            }
                    }
                }
                else
                {
                    String hql = "from Product";
                    Query q = s.createQuery(hql);
                    List <Product> l = q.list();
                    out.println(l.get(0).getPid());
                    for(Product p : l){
                        out.println("<tr align='center'>");
                            out.println("<td>" + p.getPid() + "</td>");
                            out.println("<td>" + p.getStock() + "</td>");
                            out.println("<td>" + p.getPrice()+ "</td>");
                            out.println("<td>" + p.getPname()+ "</td>");
                            out.println("<td>" + p.getPimg()+ "</td>");
                            out.println("<td>" + p.getPdes()+ "</td>");
                            out.println("<td>" + "<a href=#>Edit</a>" + "</td>");
                            out.println("<td>" + "<a href=#>Delete</a>" + "</td>");
                            out.println("</tr>");
                            }
            }
        %>
        </table>
    </body>
</html>
