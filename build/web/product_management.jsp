<%-- 
    Document   : product_management
    Created on : 29-Mar-2022, 10:29:30 PM
    Author     : hussa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<body>
    <section class="section" id="men">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>Product Management</h2>
                        <span align="center"><h3 id="subtitle"></h3></span>
                    </div>
                </div>
            </div>
        </div>
        <%            try {
                if (request.getParameter("pname") != null && request.getParameter("price") != null && request.getParameter("stock") != null && request.getParameter("desc") != null && request.getParameter("img") != null && request.getParameter("action") != null) {
                    String pname = request.getParameter("pname");
                    Double price = Double.parseDouble(request.getParameter("price"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
                    String desc = request.getParameter("desc");
                    String img = request.getParameter("img");
                    String action = request.getParameter("action");
                    int preId = Integer.parseInt(request.getParameter("preId"));
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                    PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM e_commerce.products WHERE products.p_id = ?;");
                    //out.println("<br/>Hello World" + action);
                    //out.println(action.equals("add"));
                    if (action.equals("add")) {
                        pstmt = conn.prepareStatement("INSERT INTO e_commerce.products (`p_id`, `p_name`, `price`, `stock`, `p_description`, `p_image`) VALUES (NULL, ?, ?, ?, ?, ?);");
                        pstmt.setString(1, pname);
                        pstmt.setDouble(2, price);
                        pstmt.setInt(3, stock);
                        pstmt.setString(4, desc);
                        pstmt.setString(5, img);
                        int update = pstmt.executeUpdate();
                        out.println("<br/>Hello World" + update);
                        response.sendRedirect("products.jsp");
                    } else if (action.equals("edit")) {
                        int id = Integer.parseInt(request.getParameter("pid"));
                        pstmt = conn.prepareStatement("UPDATE e_commerce.products SET p_id = ?, p_name = ?, price = ?, stock = ?, p_description = ?, p_image = ? WHERE products.p_id = ?;");
                        pstmt.setInt(1, id);
                        pstmt.setString(2, pname);
                        pstmt.setDouble(3, price);
                        pstmt.setInt(4, stock);
                        pstmt.setString(5, desc);
                        pstmt.setString(6, img);
                        pstmt.setInt(7, preId);
                        int update = pstmt.executeUpdate();
                        out.println(request.getParameter("pid") + "<br/>Hello World" + update + request.getParameter("preId"));
                        response.sendRedirect("products.jsp");
                    }
                    out.println(request.getParameter("pname") + request.getParameter("price") + request.getParameter("stock") + request.getParameter("desc") + request.getParameter("img") + request.getParameter("action"));
                } else if (request.getParameter("action") != null) {
                    int id = 0, stock = 0;
                    String pName = "", desc = "", img = "";
                    double price = 0;
                    String action = request.getParameter("action");
                    if (action == null) {
                        response.sendError(400);
                    } else if (action.equals("add")) {
                        // id not required
                    } else {
                        id = Integer.parseInt(request.getParameter("id"));
                    }
                    if (id != 0) {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
                        //Statement stmt = conn.createStatement();
                        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM e_commerce.products WHERE products.p_id = ?;");
                        pstmt.setInt(1, id);
                        ResultSet rs = pstmt.executeQuery();
                        if (!rs.isBeforeFirst()) {
                            out.println("Empty ResultSet !!!");
                        } else {
                            while (rs.next()) {
                                id = rs.getInt(1);
                                pName = rs.getString(2);
                                price = rs.getDouble(3);
                                stock = rs.getInt(4);
                                desc = rs.getString(5);
                                img = rs.getString(6);
                                out.print("<td align=\"center\">" + id + "</td>");
                                out.print("<td align=\"center\">" + pName + "</td>");
                                out.print("<td align=\"center\">" + price + "</td>");
                                out.print("<td align=\"center\">" + stock + "</td>");
                                out.print("<td align=\"center\">" + desc + "</td>");
                                out.print("<td align=\"center\">" + img + "</td>");
                            }
                        }
                    }
        %>
        <script>
            var subtitle = document.getElementById("subtitle");
            var id = <%=id%>;
            if (id === 0)
                subtitle.innerHTML = "Add Product";
            else if (id >= 0)
                subtitle.innerHTML = "Edit Product";
        </script>
        <form>
            <table align="center" width="40%" border="0px">
                <tr>
                    <td>p_id</td>
                    <td>:</td>
                    <td><input type="number" name="pid" value="<%if (id != 0) {%><%=id%><%}%>"></td>
                </tr>
                <tr>
                    <td>p_name</td>
                    <td>:</td>
                    <td><input type="text" name="pname" value="<%=pName%>" required="true"></td>
                </tr>
                <tr>
                    <td>price</td>
                    <td>:</td>
                    <td><input type="number" name="price" value="<%if (id != 0) {%><%=price%><%}%>" required="true"></td>
                </tr>
                <tr>
                    <td>stock</td>
                    <td>:</td>
                    <td><input type="number" name="stock" value="<%if (id != 0) {%><%=stock%><%}%>" required="true"></td>
                </tr>
                <tr>
                    <td>p_description</td>
                    <td>:</td>
                    <td><input type="textbox" name="desc" value="<%=desc%>" required="true"></td>
                </tr>
                <tr>
                    <td>p_image</td>
                    <td>:</td>
                    <td><input type="textbox" name="img" value="<%=img%>" required="true"></td>
                </tr>
                <tr><td colspan="3"><br/></td></tr>
                <tr><td colspan="3"><br/></td></tr>
                <tr>
                    <td align="center"><input type="submit" value="<%if (id == 0) {
                            out.println("Add Product");
                        } else {
                            out.println("Edit Product");
                        }
                        String operation = id == 0 ? "add" : "edit";
                                              %>"></td>
                    <td><input type="hidden" name="action" value=<%=operation%>><input type="hidden" name="preId" value="<%=id%>"></td>
                    <td><input type="reset" value="Reset Values"></td>
                </tr>
            </table>
        </form>
        <%}
            } catch (Exception e) {
                response.sendError(400);
                //out.println(e);
            }
        %>
    </section>
</body>
<%@include file="footer.jsp"%>