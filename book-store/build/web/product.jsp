<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
  String isbn = request.getParameter("isbn");
    ResultSet rs = stmt.executeQuery("select * from BooksQuery where isbn = '" + isbn + "'");
   
    
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
<%@include file="WEB-INF/jspf/product.jspf" %>  

  
  
