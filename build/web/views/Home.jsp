<%-- 
    Document   : Home
    Created on : 13 Oct, 2023, 11:30:28 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <%@include file="./Header.jsp" %>
        <h3>${requestScope.linkProduct!=null?requestScope.linkProduct:''}</h3>
        <section id="banner">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slider-img">
                            <img src="https://img.ltwebstatic.com/images3_ccc/2024/02/23/ae/17086887392a753314aa7645ff57ce0bd0943348d0_thumbnail_2000x.jpg" alt="" style="border-radius: 0;">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="body" class="mt-5">
           
            <div class="fashion-container h-100 mt-5">
                <div class="row box-fashion d-flex">
                    <div class=" bg-white h-100">
                        <div class="list-filter">
                            <div class="boder p-4">
                                <div class="d-flex align-items-center justify-content-between">
                                    <h3 class="text-uppercase fs-5 fw-bold">Thể loại: </h3>
                                </div>
                                <div class="d-flex">
                                    <c:forEach var="category" items="${requestScope.listCategory}">
                                    <div class="d-flex align-items-center mt-3 me-3 border-end px-3">
                                       <a class="fs-4 text-decoration-none ${category_select==category.category_id?'text-danger':'text-black'} 
                                          fw-bold pointer text-capitalize"
                                               href="?Service=filter&cid=${category.category_id}">${category.category_name}</a>
                                    </div>
                                </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right-product h-100">
                        <div class="sort-search">
                            <div class="sort-box">
                                <c:set value="${requestScope.order}" var="order"/>
                                <select class="form-select" 
                                        onchange="sendOrderOption()" id="orderOption">
                                    <option value="asc" class="py-5" ${order.equals("asc")?"selected":""}>Price: Low To Hight</option>
                                    <option value="desc" class="py-5" ${order.equals("desc")?"selected":""}>Price: Hight To Low</option>
                                </select>
                                <span class="select-title">Sort by: </span>
                            </div>
                        </div>
                        <div class="row g-5" id="list-product">
                        <c:forEach items="${requestScope.listProduct}" 
                                       var="product">
                                <div class="col-sm-6 col-md-4 col-lg-3 border">
                                    <a href="ProductURL?Service=ProductDetail&Pid=${product.product_id}"
                                       class="d-block h-100 product-item text-decoration-none position-relative">
                                        <div class="boder-radius-3 position-relative overflow-hidden">
                                            <img src="./images/${product.product_img}" style="border-radius: 0;" alt="" class="overflow-hidden">
                                            <c:if test="${product.discount > 0}">
                                                <div class="">
                                                    <span class="fs-3 text-warning fw-bold">Discount: ${product.discount}%</span>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="p-4 d-flex flex-column">
                                            <h3 class="fw-bold text-black product-title">${product.product_name}</h3>
                                            <div class="flex-fill mt-auto">
                                                <div class="">
                                                    <p class="text-decoration-line-through text-black fs-4">before: ${product.getPrice()}₫</p>
                                                </div>
                                                <div class="d-flex align-items-center justify-content-between mt-4">
                                                    <span class="product-price" style='color: #000; border: 0;'>after: ${product.getPriceAfterDiscount()}₫</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
        <%@include file="./Footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
<script>
function sendOrderOption() {
    var selectElement = document.getElementById("orderOption");
    var selectedValue = selectElement.value;
    
    if (selectedValue === "asc" || selectedValue === "desc") {
        window.location = "?Service=orderBy&value="+selectedValue;
    }
}
</script>
<script>
            function handleSearch() {
                const headerInput = document.getElementById("header-search");
                window.location = "?Service=search&keyword=" + headerInput.value;
            }
</script>
</script>
</body>
</html>