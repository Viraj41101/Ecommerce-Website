<%-- 
    Document   : Login
    Created on : 27 Mar, 2022, 8:09:56 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
        <form action="Checkout.jsp" method="post">
            
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"><br></td>
            </tr>
            <tr>
                <td>Mobile No:</td>
                <td><input type="number" name="number"><br></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><textarea rows="5" cols="20"></textarea></td><br>
            </tr>            
            <tr align="center">
                <td colspan="2"><input type="submit" value="Submit">&nbsp;<input type="reset" value="Cancel"></td>
            </tr>
        </form>
        </table>
        
    </body>
</html>
