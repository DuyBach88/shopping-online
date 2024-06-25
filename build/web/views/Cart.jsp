    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.text.Normalizer" %>
    <%@page import="java.util.regex.Pattern" %>
    <%@page import="DAL.*" %>
    <%@page import="Models.*" %>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cartegories</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <%@include file="./Header.jsp" %>

        <section>
            <div class="container">
                <div class="row gx-5 border-top gx-5 ">
                    <div class="col-md-7 row border-top py-3">
                    <%
                        Account acc = null;
                        if(session.getAttribute("account") != null) {
                          acc = (Account)session.getAttribute("account");
                        }
                    int numberOrder = 0;
                    double subtotal = 0;
                    java.util.Enumeration em = session.getAttributeNames();
                    while(em.hasMoreElements()){
                    //id la cart-id
                    String id = em.nextElement().toString();
                    if (id.startsWith("cart")) {
                          Product pro = (Product)session.getAttribute(id);
                          numberOrder += pro.getQuantity();
                          subtotal+= pro.getList_price() * pro.getQuantity() *(1 - pro.getDiscount()*0.01);
                    %>
                            <div class="col-md-12 border pe-5">
                                <div class="row py-5">
                                        <div class="col-3">
                                            <a href="ProductURL?Service=ProductDetail&Pid=<%=pro.getProduct_id()%>" class="d-block h-100">
                                                <img src="./images/<%=pro.getProduct_img()%>" 
                                                     alt="" class="object-fit-cover">
                                            </a>
                                        </div>
                                        <div class="col-9 d-flex flex-fill flex-column justify-content-between ">
                                            <div class="h-50 d-flex align-items-center justify-content-between flex-fill">
                                                <div class="">
                                                    <h3 class="fw-bold"><%=pro.getProduct_name()%></h3>
                                                    <div class="d-flex align-items-center position-relative hover-change">
                                                    </div>
                                                </div>
                                                <div class="">
                                                    <span class="fs-4">đ<%=pro.getPrice()%></span>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="box-input">
                                                        <button class="border-0 bg-white">
                                                            <a href="CartURL?Service=minusQuantity&product_id=<%=pro.getProduct_id()%>" class="p-3 text-black"><i class="fa-solid fa-minus fs-5"></i></a>
                                                        </button>
                                                        <input type="text" value="<%=pro.getQuantity()%>" class="input-number" id="numberValue" />
                                                        <button class="border-0 bg-white">
                                                            <a href="CartURL?Service=addQuantity&product_id=<%=pro.getProduct_id()%>" class="p-3 text-black"><i class="fa-solid fa-plus fs-5"></i></a>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="fs-4">
                                                      <span class="text-danger">đ<%=String.format("%,.0f", pro.getList_price() * pro.getQuantity() *(1 - pro.getDiscount()*0.01)).replace(",", ".")%></span>
                                                </div>
                                            </div>
                                            <div class="h-50 d-flex align-items-center justify-content-between">
                                                <%if(pro.getDiscount() > 0) {%>
                                                 <span class="text-white p-1 mx-2 fs-5 fw-bold bg-black">Giảm <%=pro.getDiscount()%>%</span>
                                                <%}%>
                                                <div class="ms-auto">
                                                    <a href="CartURL?Service=deleteInCart&product_id=<%=pro.getProduct_id()%>" class="text-decoration-none fs-4 fw-bold text-danger">Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             <%}%>
                            <%}%>
                            <div class="text-dark">
                                <% if(numberOrder == 0) {%>
                                <h4 class="text-danger">Let's shopping now</h4>
                                <img src="./images/emptyCart.png" alt="emptycart" class="w-75 object-fit-cover"/>
                                <%}%>
                            </div>   
                    </div>
                    <div class="col-md-5 text-order fs-4 fw-500 p-5">
                        <div class="w-80 m-auto">
                            <div class="d-flex align-items-center justify-content-between border-bottom py-3">
                                <span>Total</span>
                                <%if(subtotal != 0) {%>
                                <span class="fw-600 text-dark">đ <%=String.format("%,.0f",subtotal).replace(",", ".")%></span>
                                <%} else {%>
                                <span class="fw-600 text-dark">đ0</span>
                                <%}%>
                            </div>
                            <a href="CartURL?Service=checkout" class="mt-5 d-block
                               py-3 text-decoration-none fs-2 text-center
                               w-100 text-white bg-dark box-shadow1">
                                Checkout
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="./Footer.jsp" %>
        <script src="./js/app.js"></script>
    </body>
    <script>
        function checkAll() {
            const orderCheck = document.getElementsByName("orderCheck");
             for (var i = 0; i < orderCheck.length; i++) {
               if(orderCheck[i].checked == true) {
                   orderCheck[i].checked = false;
               } else {
                   orderCheck[i].checked = true
               }
              }
        }
    </script>

</html>