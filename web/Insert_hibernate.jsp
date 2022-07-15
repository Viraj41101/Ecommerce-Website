<%-- 
    Document   : Insert_hibernate
    Created on : 27 Apr, 2022, 9:56:18 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String action = request.getParameter("action");
%>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="get" action="Change_hibernate.jsp">
            <table>
               <tr>
                    <td><label>SrNo : </label></td>
                    <td><input type="text" name="pid"></td>
               </tr>
<tr>
    <td><label>Stock : </label></td>
    <td><input type="text" name="stock"></td>
</tr>
<tr>
    <td><label>Price : </label></td>
    <td><input type="text" name="price"></td>
</tr>
<tr>
    <td><label>Pname : </label></td>
    <td><input type="text" name="pname"></td>
</tr>
<tr>
    <td><label>Pimg : </label></td>
    <td><input type="text" name="pimg"></td>
</tr>
<tr>
    <td><label>Pdes : </label></td>
    <td><input type="text" name="pdes"></td>
</tr>
<tr>
    <td colspan="2"><input type="hidden" value="<%=action%>" name="action"><input type="submit" value="Add Product"></td>
</tr> 
            </table>
        </form>
    </body>
</html>
