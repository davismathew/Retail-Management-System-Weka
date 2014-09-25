package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta name=\"keywords\" content=\"\" />\n");
      out.write("<meta name=\"description\" content=\"\" />\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>RMS</title>\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"screen\" />\n");
      out.write("<script src=\"https://www.google.com/jsapi?key=ABQIAAAAl4aARPbxKLjaEl4S3oZRfBQtTzT4QyoJQnFffYiGRf41NAG3QxTx57rXYVqZoHhxTiSK8-0b-JmFFQ\" type=\"text/javascript\"></script>\n");
      out.write("    <script language=\"Javascript\" type=\"text/javascript\">\n");
      out.write("    //<![CDATA[\n");
      out.write("   function preventBack(){window.history.forward();}\n");
      out.write("    setTimeout(\"preventBack()\", 0);\n");
      out.write("    window.onunload=function(){null};\n");
      out.write("\n");
      out.write("    google.load(\"search\", \"1\");\n");
      out.write("\n");
      out.write("    function OnLoad() {\n");
      out.write("      // Create a search control\n");
      out.write("      var searchControl = new google.search.SearchControl();\n");
      out.write("\n");
      out.write("      // Add in a full set of searchers\n");
      out.write("      var localSearch = new google.search.LocalSearch();\n");
      out.write("      searchControl.addSearcher(localSearch);\n");
      out.write("      searchControl.addSearcher(new google.search.WebSearch());\n");
      out.write("      searchControl.addSearcher(new google.search.VideoSearch());\n");
      out.write("      searchControl.addSearcher(new google.search.BlogSearch());\n");
      out.write("\n");
      out.write("      // Set the Local Search center point\n");
      out.write("      localSearch.setCenterPoint(\"New York, NY\");\n");
      out.write("\n");
      out.write("      // Tell the searcher to draw itself and tell it where to attach\n");
      out.write("      searchControl.draw(document.getElementById(\"searchcontrol\"));\n");
      out.write("\n");
      out.write("      // Execute an inital search\n");
      out.write("      searchControl.execute(\"Google\");\n");
      out.write("    }\n");
      out.write("    google.setOnLoadCallback(OnLoad);\n");
      out.write("\n");
      out.write("    //]]>\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div id=\"wrapper\">\n");
      out.write("\t<div id=\"header-wrapper\">\n");
      out.write("\t\t<div id=\"header\">\n");
      out.write("\t\t\t<div id=\"logo\">\n");
      out.write("\t\t\t\t<h1><a href=\"#\">Retail Management System </a></h1>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #header -->\n");
      out.write("\t<div id=\"menu\">\n");
      out.write("\t\t<ul>\n");
      out.write("\t\t\t<li class=\"current_page_item\"><a href=\"#\">Home</a></li>\n");
      out.write("\t\t\t<li><a href=\"#\">Login</a></li>\n");
      out.write("\t\t\t<li><a href=\"#\">About</a></li>\n");
      out.write("\t\t\t<li><a href=\"#\">Links</a></li>\n");
      out.write("\t\t\t<li><a href=\"#\">Contact</a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #menu -->\n");
      out.write("\t<div id=\"page\">\n");
      out.write("\t\t<div id=\"page-bgtop\">\n");
      out.write("\t\t\t<div id=\"page-bgbtm\">\n");
      out.write("\t\t\t\t<div id=\"content\">\n");
      out.write("\t\t\t\t\t<div class=\"post\">\n");
      out.write("\t\t\t\t\t\t<h2 class=\"title\"><a href=\"#\">Welcome to RMS </a></h2>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t<div class=\"entry\">\n");
      out.write("\t\t\t\t\t\t\t<p><img src=\"images/img07.jpg\" width=\"200\" height=\"200\" alt=\"\" class=\"alignleft border\" />\n");
      out.write("                     <form action=\"index_serv\" method=\"POST\">\n");
      out.write("                    User Name: <input type=\"text\" name=\"username\" size=\"20\"><br />\n");
      out.write("                     Password : <input type=\"text\" name=\"password\" size=\"20\">\n");
      out.write("                    <br /><br />\n");
      out.write("                    <input type=\"submit\" value=\"Submit\">\n");
      out.write("                     </form>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div style=\"clear: both;\">&nbsp;</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<!-- end #content -->\n");
      out.write("                                <div id=\"sidebar\">\n");
      out.write("\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t<li>\n");
      out.write("                                                      <div id=\"searchcontrol\">Loading...</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t</li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<!-- end #sidebar -->\n");
      out.write("\t\t\t\t<div style=\"clear: both;\">&nbsp;</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- end #page -->\n");
      out.write("</div>\n");
      out.write("<div id=\"footer-wrapper\">\n");
      out.write("\t<div id=\"footer\">\n");
      out.write("\t\t<p>Copyright (c) 2011 RMS.com. All rights reserved. Design by <a href=\"http://www.google.co.in/\">Davis--for RMS Application </a>.</p>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<!-- end #footer -->\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
