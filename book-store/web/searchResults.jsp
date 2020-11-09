<%-- 
    Document   : searchResults
    Created on : Nov 1, 2020, 12:19:35 PM
    Author     : 00220682
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    String keyword = request.getParameter("keyword");
    StringBuffer sb = new StringBuffer(64);
    sb.append("select * from BooksQuery where title like '%");
    sb.append(keyword);
    sb.append("%' or category like '%");
    sb.append(keyword);
    sb.append("%' or description like '%");
    sb.append(keyword);
    sb.append("%' or au_lastname like '%");
    sb.append(keyword);
    sb.append("%' or isbn like '%");
    sb.append(keyword);
    sb.append("%' or keywords like '%");
    sb.append(keyword);
    sb.append("%' order by Price desc");
    ResultSet rs = stmt.executeQuery(sb.toString());
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
    <article>
        <header>
            <h1>Search Results</h1>
        </header>
        
<%@include file="WEB-INF/jspf/results.jspf" %>
    </article>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/close.jspf" %>
