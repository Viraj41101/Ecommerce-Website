package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.eco.app.NewHibernateUtil;
import java.util.*;
import org.hibernate.*;
import com.eco.app.Product;

public final class Basic_005fhibernate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form>\n");
      out.write("            Search By:<select name=\"searchby\">\n");
      out.write("                <option>Product Name</option>\n");
      out.write("                <option>Product Price</option>\n");
      out.write("            </select>\n");
      out.write("            <select name=\"operator\">\n");
      out.write("                <option>=</option>\n");
      out.write("                <option>></option>\n");
      out.write("                <option><</option>\n");
      out.write("            </select>\n");
      out.write("            Search Value:<input type=\"text\" name=\"value\">&nbsp;<input type=\"submit\" value=\"search\">&nbsp;&nbsp;&nbsp;<a href=\"Basic_hibernate.jsp\">Clear All</a>&nbsp;&nbsp;&nbsp;<a href=\"Insert_hibernate.jsp?action=add\"><b>Insert</b></a>\n");
      out.write("        </form>\n");
      out.write("        <table border=\"5\" width=\"50%\">\n");
      out.write("             <tr>\n");
      out.write("                <th>SrNo</th>\n");
      out.write("                <th>Stock</th>\n");
      out.write("                <th>Price</th>\n");
      out.write("                <th>Pname</th>\n");
      out.write("                <th>Pimg</th>\n");
      out.write("                <th>Pdes</th>\n");
      out.write("                <th>Edit</th>\n");
      out.write("                <th>Delete</th>\n");
      out.write("            </tr>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
