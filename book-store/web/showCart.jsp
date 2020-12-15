<%-- 
    Document   : showCart
    Created on : Nov 19, 2019, 12:00:35 PM
    Author     : 00220682
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="bookstoreUtils.*, java.util.*"%>
<%
    String itemParam = request.getParameter("isbn");
    String clearParam = request.getParameter("clear");
    ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
    if(itemParam != null){
        Item item = new Item(itemParam);
        //Adding an item
        if(cart != null){
            //cart exists
            if(cart.addItem(item))
                session.setAttribute("cart", cart);
        }else{
            //First item
            cart = new ShoppingCart();
            cart.addItem(item);
            session.setAttribute("cart", cart);
        }
    }else if(clearParam != null){
        if(cart != null){
            cart.clearCart();
            session.setAttribute("cart", cart);
        }
    }
    //refresh the cart
    cart = (ShoppingCart)session.getAttribute("cart");
%>
<%@include file="WEB-INF/jspf/head.jspf" %>
    <article>
        <header>
            <h1>The Bookstore</h1>
            
            <hr/>
        </header>
        <%
            if(cart == null){
        %>
        <h4>Shopping Cart is Empty</h4>
        <p>
            <a href="search.jsp" class="button">Continue Shopping</a>
        </p>
        <%
            }else{
%>
        <h3>Shopping Cart - <%= cart.getStringTotal() %></h3>
        <form action="UpdateCartServlet" method="post">
<%
                ArrayList items = cart.getCart();
                int itemCount = items.size();
                if(itemCount ==0){
        %>
        <h4>Shopping Cart is Empty</h4>
        <p>
            <a href="search.jsp" class="button">Continue Shopping</a>
        </p>
        <%
                }
                for(int i=0; i<itemCount; i++){
                    Item item = (Item)items.get(i);
        %>
                    <section>
                        <p class="thumbnail">
                            <img src="<%= item.getCoverpic() %>" alt=""/>
                            $<%= item.getPrice() %>
                        </p>
                        <div  class="description">
                            <h3><%= item.getTitle() %></h3>
                            
                            <p>
                                <i class="material-icons-outlined button" onClick="increaseQuantity('item<%= i %>')">add_circle_outline</i>
                                <input type="text" size="2" name="item<%= i %>" id="item<%= i %>" value="<%= item.getQuantity() %>" readonly="readonly" />
                                <i class="material-icons-outlined button" onClick="decreaseQuantity('item<%= i %>')">remove_circle_outline</i>
                                <!--<i class="material-icons-outlined button" onClick="removeItem('item0')">delete</i>-->
                            </p>
                        </div>
                        <hr/>
                    </section>
        <%
                }
        %>
        <%
            if(itemCount !=0){
        %>
        <p style="text-align: right">
            <input type="submit" value="Update Cart" class="button"/> <a href="showCart.jsp?clear=true" class="button">Clear Cart</a> <a href="search.jsp" class="button">Continue Shopping</a>
        </p>
        <%
            }
        %>  
        </form>
        <%
            }
        %>

    </article>
<%@include file="WEB-INF/jspf/footer.jspf" %>
