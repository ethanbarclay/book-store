<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    ResultSet rs = stmt.executeQuery("select * from Books where Special = 1");
%>
<%@include file="WEB-INF/jspf/head.jspf" %>