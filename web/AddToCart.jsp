<%-- 
    Document   : AddToCart
    Created on : 1 Mar, 2022, 5:21:46 PM
    Author     : viraj
--%>

<%@page import="com.eco.app.Products"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<%!
    int qty = 1;
%>
<%      
        if(request.getParameter("qty")!= null)
            qty = Integer.parseInt(request.getParameter("qty"));
        
        int pid = Integer.parseInt(request.getParameter("pid"));
        
        if(cart.containsKey(pid))
        {
            cart.put(pid, qty+ cart.get(pid));
        }
        else
        {
            cart.put(pid, qty);
        }
        session.setAttribute("cart", cart); 
            
            totalProduct = totalProduct + qty;
            session.setAttribute("totalProduct", totalProduct);
            totalAmount = totalAmount + (qty * p.get(pid).getPrice() );
            session.setAttribute("totalAmount",totalAmount);
                
            String pname = Products.p.get(pid).getPname();
            response.sendRedirect("home.jsp?msg="+pname+" + Product added Succesfully");
%>              