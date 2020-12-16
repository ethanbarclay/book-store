<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/connection.jspf" %>
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
    <div class="px-4 px-lg-0">
      <div class="container text-white py-5 text-center">
        <h1 class="display-4">Shopping Cart</h1>
      </div>
      <div class="pb-5">
        <div class="container">
          <div class="card row">
            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col" class="border-0 bg-light">
                        <div class="p-2 px-3 text-uppercase">Product</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Price</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Quantity</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase"></div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Wishlist & Buy Later</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Remove</div>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                        if(cart == null){
                    %>
                    <tr>
                      <th scope="row" class="border-0">
                        <div class="p-2">
                          <img src="assets/img/VBDummies.JPG" alt="" width="70" class="img-fluid rounded shadow-sm">
                          <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">Shopping Cart is Empty</a></h5>
                          </div>
                        </div>
                      </th>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                        }else{
                    %>
                    <form action="UpdateCartServlet" method="post">
                    <%
                        ArrayList items = cart.getCart();
                        int itemCount = items.size();
                        if(itemCount ==0){
                    %>
                    <tr>
                      <th scope="row" class="border-0">
                        <div class="p-2">
                          <img src="assets/img/VBDummies.JPG" alt="" width="70" class="img-fluid rounded shadow-sm">
                          <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">Shopping Cart is Empty</a></h5>
                          </div>
                        </div>
                      </th>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                        }
                        for(int i=0; i<itemCount; i++) {
                        Item item = (Item)items.get(i);
                    %>
                    <tr>
                      <th scope="row" class="border-0">
                        <div class="p-2">
                          <img src="<%= item.getCoverpic() %>" alt="" width="70" class="img-fluid rounded shadow-sm">
                          <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a href="product.jsp?isbn=<%= item.getISBN() %>" class="text-dark d-inline-block align-middle"><%= item.getTitle() %></a></h5><span class="text-muted font-weight-normal font-italic d-block">Genre: Reference</span>
                          </div>
                        </div>
                      </th>
                      <td class="border-0 align-middle"><strong>$<%= item.getPrice() %></strong></td>
                      <td class="border-0 align-middle">
                          <p>
                                <button class="material-icons-outlined button" onClick="increaseQuantity('item<%= i %>')">+</button>
                                <input type="text" size="2" name="item<%= i %>" id="item<%= i %>" value="<%= item.getQuantity() %>" readonly="readonly" />
                                <button class="material-icons-outlined button" onClick="decreaseQuantity('item<%= i %>')">-</button>
                                <button class="material-icons-outlined button" onClick="removeItem('item0')">delete</button>
                           </p>
                      </td>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    </form>
                    <%
                        }
                    %>
                    <section>
                        <form action="https://sandbox.paypal.com/us/cgi-bin/webscr" method="post"> 
                            <input type="hidden" name="cmd" value="_xclick">
                            <input type="hidden" name="business" value="sb-iq7c74105279@business.example.com">
                            <input type="hidden" name="item_name" value="Bookstore Shopping Cart Order">
                            <input type="hidden" name="currency_code" value="USD">
                            <input type="hidden" name="amount" value="<%= cart.getTotal() %>">
                            <input type="hidden" name="cancel_return" value="http://localhost:8080/Bookstore/checkout.jsp"> 
                            <input type="hidden" name="return" value="http://localhost:8080/Bookstore/index.jsp">
                            <input type="image" src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
                        </form>
                    </section>
                  <tr>
                      <th scope="row" class="border-0">
                        <div class="p-2">
                          <img src="assets/img/VBDummies.JPG" alt="" width="70" class="img-fluid rounded shadow-sm">
                          <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">Total - <%= cart.getStringTotal() %></a></h5>
                          </div>
                        </div>
                      </th>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                        }
                    %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
