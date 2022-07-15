<%-- 
    Document   : ViewCart
    Created on : 7 Mar, 2022, 10:17:02 AM
    Author     : viraj
--%>

<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="com.eco.app.Products"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shopping Cart</h1>
                    <nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Cart</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    
 <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <%
                                if(totalProduct == 0)
                                {
                                    %></table>
                                 
                                 <h1 style="padding:50px;"><center>0 product added into your cart</center></h1>
                                 <%}
                                else
                                {
                                    Iterator<Map.Entry<Integer,Integer>> it = cart.entrySet().iterator();
                                    while(it.hasNext())
                                    {
                                        Map.Entry<Integer,Integer> entry = it.next();
                                        Products pr = p.get(entry.getKey());

                                    /*int pid = Integer.parseInt(request.getParameter("pid"));
                                    Products sp = p.get(pid);*/
                        %>
                        <tbody>
                            
                            <tr>
                                <td>
                                    <div class="media">
                                        <div style="height:120px;" class="d-flex">
                                            <img src="<%=pr.getPimg()%>" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p><%=pr.getPname()%></p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5><%=pr.getPrice()%></h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <span class="amount"><%=entry.getValue()%></span>
                                        <!--<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button> -->
                                    </div>
                                </td>
                                <td>
                                    <h5><%=pr.getPrice() * entry.getValue()%></h5>
                                </td>
                            </tr>
                            <%}%>
                            
                            <tr class="bottom_button">
                                <td>
                                    <a class="gray_btn" href="#">Update Cart</a>
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="cupon_text d-flex align-items-center">
                                        <input type="text" placeholder="Coupon Code">
                                        <a class="primary-btn" href="#">Apply</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>GrandTotal</h5>
                                </td>
                                <td>
                                    <h5><%=totalAmount%></h5>
                                </td>
                            </tr>
                            
                            <tr class="out_button_area">
                                
                                <td>

                                </td>
                                <td>
                                    <div class="checkout_btn_inner d-flex align-items-center">
                                        <a class="gray_btn" href="#">Continue Shopping</a>
                                        <a class="primary-btn" href="Login.jsp">Proceed to checkout</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        </table>
                        <%}%>
                </div>
            </div>
        </div>
    </section>

<%@include file="footer.jsp" %>

