<%-- 
    Document   : Update_hibernate
    Created on : 27 Apr, 2022, 10:09:03 PM
    Author     : viraj
--%>

<%@page import="com.eco.app.Product"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.eco.app.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><title>Product Manager</title></head>
    <body>
        <form method="get" action="Change_hibernate.jsp">
            <table>

<%
    String action = request.getParameter("action");
%>
<%
        
        int pid = Integer.parseInt(request.getParameter("pid"));
            Session s = NewHibernateUtil.getSessionFactory().openSession();
            Transaction t = s.beginTransaction();
            
            Query query = s.createQuery("from Product p where p.pid = " +pid);
            Iterator it = query.iterate();
            
            while (it.hasNext()) {
            Product p = (Product) it.next();
            pid = p.getPid();
            int stock = p.getStock();
            double price = p.getPrice();
            String pname = p.getPname();
            String pimg = p.getPimg();
            String pdes = p.getPdes();
                    }
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
