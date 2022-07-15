<%-- 
    Document   : products
    Created on : 29-Mar-2022, 12:17:23 PM
    Author     : hussa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<body>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script>
        var searchObject = {
            "ID": ["<", "=", ">", "<=", ">="],
            "Name": ["Starts with", "Comes in between", "Ends With"],
            "Price": ["<", "=", ">", "<=", ">="],
            "Stock": ["<", "=", ">", "<=", ">="]
        };
        window.onload = function () {
            var typeSelect = document.getElementById("inputtype");
            var opSelect = document.getElementById("operator");
            for (var x in searchObject) {
                typeSelect.options[typeSelect.options.length] = new Option(x, x);
            }
            typeSelect.onchange = function () {
                opSelect.length = 1;
                var y = searchObject[this.value];
                for (var i = 0; i < y.length; i++) {
                    opSelect.options[opSelect.options.length] = new Option(y[i], y[i]);
                }
            };
        };
    </script>
    <%            try {
            String where = "1=1";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            PreparedStatement pstmt;// = conn.prepareStatement("SELECT * FROM e_commerce.products WHERE 1=1");
            if (request.getParameter("inputtype") != null && request.getParameter("operator") != null && request.getParameter("searchvalue") != null) {
                String inputType = request.getParameter("inputtype");
                String operator = request.getParameter("operator");
                String searchValue = request.getParameter("searchvalue");
                where = "";
                if (inputType.equals("ID")) {
                    where += "p_id";
                } else if (inputType.equals("Name")) {
                    where += "p_name like ";
                } else if (inputType.equals("Price")) {
                    where += "price";
                } else if (inputType.equals("Stock")) {
                    where += "stock";
                }
                if (operator.equals("<")) {
                    where += " < ";
                } else if (operator.equals("=")) {
                    where += " = ";
                } else if (operator.equals(">")) {
                    where += " > ";
                } else if (operator.equals("<=")) {
                    where += " <= ";
                } else if (operator.equals(">=")) {
                    where += " >= ";
                } else if (operator.equals("Starts with")) {
                    searchValue += "%";
                } else if (operator.equals("Comes in between")) {
                    searchValue = "%" + searchValue + "%";
                } else if (operator.equals("Ends With")) {
                    searchValue = "%" + searchValue;
                }
                pstmt = conn.prepareStatement("SELECT * FROM e_commerce.products WHERE " + where + " ?;");
                pstmt.setString(1, searchValue);
            }
            else if (request.getParameter("action") != null) {
                int d_id = Integer.parseInt(request.getParameter("id"));
                pstmt = conn.prepareStatement("DELETE FROM e_commerce.products WHERE products.p_id = ?;");
                pstmt.setInt(1, d_id);
                int delete = pstmt.executeUpdate();
                pstmt = conn.prepareStatement("SELECT * FROM e_commerce.products;");
                pstmt.executeQuery();
            }
            else {
                pstmt = conn.prepareStatement("SELECT * FROM e_commerce.products;");
            }
    %>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>Product Management</h2>
                    </div>
                </div>
            </div>
        </div>
        <span><%out.println(pstmt + "<br/><br/>");%></span>
        <form action="products.jsp" method="GET">
            <table align="center">
                <tr>
                    <td><select name="inputtype" id="inputtype" required="true">
                            <option value="" selected="selected">Input-Type</option>
                        </select>
                    </td>
                    <td><select name="operator" id="operator" required="true">
                            <option value="" selected="selected">First Select Input-Type</option>
                        </select>
                    </td>
                    <td><input type="text" placeholder="Search Here" name="searchvalue" required="true"></td>
                    <td><input type="submit" value="Search"></td>
                    <td><div style="border: 1px solid gray; border-radius: 2px;"><a href="products.jsp">Clear All Filters</a></div></td>
                </tr>
            </table>
        </form>
        <br/>
        <br/>
        <table width="90%" align="center" border="0px">
            <tr>
                <th><u><center>Product Id</center></u></th>
                <th><u><center>Product Name</center></u></th>
                <th><u><center>Price</center></u></th>
                <th><u><center>Stock</center></u></th>
                <th><u><center>Description</center></u></th>
                <th><u><center>Birth Day</center></u></th>
                <th><u><center>Edit</center></u></th>
                <th><u><center>Delete</center></u></th>
            </tr>
            <%
                ResultSet rs = pstmt.executeQuery();
                if (!rs.isBeforeFirst()) {
                    out.println("<tr><td colspan=\"8\" align=\"center\">No data found !!!</td></tr>");
                } else {
                    while (rs.next()) {
                        out.print("<tr>");
                        int id = rs.getInt(1);
                        out.print("<td align=\"center\">" + id + "</td>");
                        out.print("<td align=\"center\">" + rs.getString(2) + "</td>");
                        out.print("<td align=\"center\">₹ " + rs.getDouble(3) + "</td>");
                        out.print("<td align=\"center\">" + rs.getInt(4) + "</td>");
                        out.print("<td align=\"center\">" + rs.getString(5) + "</td>");
                        out.print("<td align=\"center\">" + rs.getString(6) + "</td>");
                        out.print("<td align=\"center\"><a href=\"product_management.jsp?action=edit&id=" + id + "\"><i class='far fa-edit'></i></a></td>");
                        out.print("<td align=\"center\"><a href=\"products.jsp?action=delete&id=" + id + "\"><i class='far fa-trash-alt'></i></a></td>");
                        out.print("</tr>");
                        //out.println(rs.getInt("p_id") + " " + rs.getString("p_name") + " " + rs.getDouble("price") + " " + rs.getInt("stock") + " " + rs.getString("p_description") + " " + rs.getString("p_image") + "<br/>");
                    }
                }
            %>
            <tr><td colspan="8"><br/></td></tr>
            <tr>
                <td colspan="8" align="center"><a href="product_management.jsp?action=add"><i class="fa fa-plus"></i> Add Product</a></td>
            </tr>
        </table>
        <%
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </section>
</body>
<%@include file="footer.jsp"%>
