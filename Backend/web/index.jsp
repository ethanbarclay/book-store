<%-- 
    Document   : index
    Created on : Oct 26, 2020, 1:32:00 PM
    Author     : nccmac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    ResultSet rs = stmt.executeQuery("select * from Books where Special = 1");
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
                <article>
                    <header>
                        <h1>The Bookstore</h1>
                        <p>We specialize in finding books by software developers for software developers.  Need to learn web development?  Database development? Graphic Design?  We have books for you!</p>
                        <h2>Books on Sale</h2>
                    </header>
                    
<%@include file="WEB-INF/jspf/results.jspf" %>
                    
                </article>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/close.jspf" %>