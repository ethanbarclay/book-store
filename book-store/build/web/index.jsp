<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    ResultSet rs = stmt.executeQuery("select * from Books where Special = 1");
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
<%@include file="WEB-INF/jspf/intro.jspf" %>
  <div class="about">
    <br>
    <div class="container-fluid">
      <div class="row" style="text-align: center;">
        <a class="primary card col-sm box" href="browse.jsp">
          <div class="box">
            <h3>NEW ARRIVALS</h3><br>
            <h4>Our Latest Books</h4>
          </div>
        </a>
        <a class="primary card col-sm box" href="browse.jsp">
          <div class="box">
            <h3>BROWSE</h3><br>
            <h4>Many Genres Available</h4>
          </div>
        </a>
        <a class="primary card col-sm box" href="browse.jsp">
          <div class="box">
            <h3>ON SALE</h3><br>
            <h4>Books up to 50% Off</h4>
          </div>
        </a>
      </div>
    </div>
  </div>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/homepageBooks.jspf" %>
<%@include file="WEB-INF/jspf/close.jspf" %>