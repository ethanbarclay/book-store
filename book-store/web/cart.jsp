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
                      <td class="border-0 align-middle"><strong>$20.00</strong></td>
                      <td class="border-0 align-middle"><strong>1</strong></td>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                        }
                    %>
                    <%
                        }
                    %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="card row py-5 p-4">
            <div class="col-lg-6">
              <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Discount Code:</div>
              <div class="p-4">
                <p class="font-italic mb-4">Please enter any special discount or promotional codes:</p>
                <div class="input-group mb-4 border rounded-pill p-2">
                  <input type="text" placeholder="Enter Promo Code" aria-describedby="button-addon3" class="form-control border-0">
                  <div class="input-group-append border-0">
                    <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Apply Discount</button>
                  </div>
                </div>
              </div>
              <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Additional Comments:</div>
              <div class="p-4">
                <p class="font-italic mb-4">Specify any additional notes or requests, such as shipping instructions, and we will do our best to address them:</p>
                <textarea name="" cols="30" rows="2" class="form-control"></textarea>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Your Order: </div>
              <div class="p-4">
                <p class="font-italic mb-4">Tax & Shipping rates vary according to region:</p>
                <ul class="list-unstyled mb-4">
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Subtotal </strong><strong>$145.00</strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and handling</strong><strong>$8.00</strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong>$0.00</strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                    <h5 class="font-weight-bold">$153.00</h5>
                  </li>
                </ul><a href="#" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
