<%-- 
    Document   : Checkout
    Created on : 29 Mar, 2022, 1:35:49 PM
    Author     : viraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<%
    cart.clear();
    totalProduct = 0;
    totalAmount = 0;
    session.setAttribute("cart", cart);
    session.setAttribute("totalProduct", totalProduct);
    session.setAttribute("totalAmount", totalAmount);
    response.sendRedirect("home.jsp?msgg=Order Placed Successfully");
%>
