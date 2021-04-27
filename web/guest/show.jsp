<%-- 
    Document   : index
    Created on : Apr 25, 2021, 10:57:54 AM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="java.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
    </head>


    <body class="js">

        <%@include file="header.jsp" %>

        <!-- Start Shop Home List  -->
        <section class="shop-home-list section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">

                                <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4}">
                                    <img class="default-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                    <img class="hover-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                </a>

                                <div class="button-head">
                                    <div class="product-action-2">
                                        <c:if test="<%= username.length() > 0%>">
                                            <a title="Add to cart" href="GuestCartController?view=add">Add to cart</a>
                                        </c:if>
                                        <c:if test="<%= username.length() < 1%>">
                                            <a title="Add to cart" href="GuestLoginController?view=login">Add to cart</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="product-content">
                                <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4">name</a></h3>
                                <div class="product-price">
                                    <span>$5000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">

                                <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4}">
                                    <img class="default-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                    <img class="hover-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                </a>

                                <div class="button-head">
                                    <div class="product-action-2">
                                        <c:if test="<%= username.length() > 0%>">
                                            <a title="Add to cart" href="GuestCartController?view=add">Add to cart</a>
                                        </c:if>
                                        <c:if test="<%= username.length() < 1%>">
                                            <a title="Add to cart" href="GuestLoginController?view=login">Add to cart</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="product-content">
                                <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4">name</a></h3>
                                <div class="product-price">
                                    <span>$5000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">

                                <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4}">
                                    <img class="default-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                    <img class="hover-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                </a>

                                <div class="button-head">
                                    <div class="product-action-2">
                                        <c:if test="<%= username.length() > 0%>">
                                            <a title="Add to cart" href="GuestCartController?view=add">Add to cart</a>
                                        </c:if>
                                        <c:if test="<%= username.length() < 1%>">
                                            <a title="Add to cart" href="GuestLoginController?view=login">Add to cart</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="product-content">
                                <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4">name</a></h3>
                                <div class="product-price">
                                    <span>$5000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">

                                <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4}">
                                    <img class="default-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                    <img class="hover-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                </a>

                                <div class="button-head">
                                    <div class="product-action-2">
                                        <c:if test="<%= username.length() > 0%>">
                                            <a title="Add to cart" href="GuestCartController?view=add">Add to cart</a>
                                        </c:if>
                                        <c:if test="<%= username.length() < 1%>">
                                            <a title="Add to cart" href="GuestLoginController?view=login">Add to cart</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="product-content">
                                <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4">name</a></h3>
                                <div class="product-price">
                                    <span>$5000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                        <div class="single-product">
                            <div class="product-img">

                                <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4}">
                                    <img class="default-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                    <img class="hover-img" src="${pageContext.request.contextPath}/admin/assets/img/avatar.png" alt="#">
                                </a>

                                <div class="button-head">
                                    <div class="product-action-2">
                                        <c:if test="<%= username.length() > 0%>">
                                            <a title="Add to cart" href="GuestCartController?view=add">Add to cart</a>
                                        </c:if>
                                        <c:if test="<%= username.length() < 1%>">
                                            <a title="Add to cart" href="GuestLoginController?view=login">Add to cart</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="product-content">
                                <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=4">name</a></h3>
                                <div class="product-price">
                                    <span>$5000</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Home List  -->

        <!-- Start Shop Services Area -->
        <section class="shop-services section home">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-rocket"></i>
                            <h4>Free shiping</h4>
                            <p>Orders over $100</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-reload"></i>
                            <h4>Free Return</h4>
                            <p>Within 30 days returns</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-lock"></i>
                            <h4>Sucure Payment</h4>
                            <p>100% secure payment</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                    <div class="col-lg-3 col-md-6 col-12">
                        <!-- Start Single Service -->
                        <div class="single-service">
                            <i class="ti-tag"></i>
                            <h4>Best Peice</h4>
                            <p>Guaranteed price</p>
                        </div>
                        <!-- End Single Service -->
                    </div>
                </div>
            </div>
        </section>
        <!-- End Shop Services Area -->
        <%@include file="footer.jsp" %>

    </body>
</html>
