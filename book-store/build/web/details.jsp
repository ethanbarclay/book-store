<%-- 
    Document   : details
    Created on : Nov 1, 2020, 1:24:23 PM
    Author     : 00220682
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    String isbn = request.getParameter("isbn");
    ResultSet rs = stmt.executeQuery("select * from BooksQuery where isbn = '" + isbn + "'");
    try{
        rs.next();
    
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
<article>
    <header>
        <h1><%= rs.getString("title") %></h1>
    </header>
    <section>
        <h3></h3>
        <p class="thumbnail">
            <img src="<%= rs.getString("coverpic") %>" alt=""/>
            <a href="showCart.jsp?isbn=<%= isbn %>"><i class="material-icons button">add_shopping_cart</i></a><br/>
            $<%= rs.getString("price") %>
        </p>
        <p class="description">
            <%
                StringBuilder author = new StringBuilder(32);
                author.append(rs.getString("au_firstname"));
                String midName = rs.getString("au_midname");
                if(!midName.equals("null"))
                    author.append(" " + midName);
                author.append(" " + rs.getString("au_lastname"));
            %>
            <span style="font-weight:bold"><%= author.toString() %><br/>
            <%= rs.getString("pub_name") %><br/>
            <%= isbn %><br/></span>
            <%= rs.getString("description") %>
        </p>
        <hr/>
    </section>
</article>
            <%
                }catch(Exception e){
                    
                }
            %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/close.jspf" %>
