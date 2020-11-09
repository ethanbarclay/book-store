<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
<%
    ResultSet rs = stmt.executeQuery("select * from Books where Special = 1");
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
    <div id="sidebar">
      <p id="Sidebar_Header">Favorites</p>
      <p id="Sidebar_Smaller">Web Page Design</p>
      <p id="Sidebar_Smaller">Oracle</p>
      <p id="Sidebar_Smaller">Killer Interactive Sites</p>
      <p id="Sidebar_Smaller">PS4 Bible</p>
      <p id="Sidebar_Header">On Sale</p>
      <p id="Sidebar_Smaller">Web Pub HTML</p>
      <p id="Sidebar_Smaller">Pro ASP</p>
      <p id="Sidebar_Smaller">Elements of Web Design</p>
      <p id="Sidebar_Header">New</p>
      <p id="Sidebar_Smaller">Practical SQL</p>
      <p id="Sidebar_Smaller">Web Wow</p>
    </div>

    <div id="content1" class="card">
      <img src="img/Oracle.JPG" />
      <p>Oracle</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content2" class="card">
      <img src="img/JavaScript.JPG" />
      <p>JavaScript</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content3" class="card">
      <img src="img/KillerInteractiveSites.gif" />
      <p>Killer Interactive Sites</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content4" class="card">
      <img src="img/WebPageDesign.gif" />
      <p>Web Page Design</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content5" class="card">
      <img src="img/WebWow.JPG" />
      <p>Web Wow</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content6" class="card">
      <img src="img/DesigningWithJavaScript.gif" />
      <p>Designing With JavaScript</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content7" class="card">
      <img src="img/PS4Bible.JPG" />
      <p>PS4 Bible</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content8" class="card">
      <img src="img/VBDummies.JPG" />
      <p>VB Dummies</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>

    <div id="content9" class="card">
      <img src="img/SQLUnleashed.JPG" />
      <p>SQL UnLeashed</p>
      <p>Price: $7.99</p>
      <button onclick="">Add to Cart</button>
    </div>
