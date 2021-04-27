<%-- 
    Document   : index
    Created on : Apr 25, 2021, 10:57:54 AM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="java.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JustBuy</title>
    </head>
    <style>
        .notify-badge{
            position: absolute;
            right:10px;
            top:10px;
            background:green;
            text-align: center;
            border-radius: 30px 30px 30px 30px;
            color:white;
            padding:5px 10px;
            font-size:15px;
        }
    </style>

    <body class="js">

        <%@include file="header.jsp" %>

        <!-- Slider Area -->
        <section class="hero-slider">
            <!-- Single Slider -->
            <div class="single-slider">
                <div class="container">
                    <div class="row no-gutters">
                        <div class="col-lg-9 offset-lg-3 col-12">
                            <div class="text-inner">
                                <div class="row">
                                    <div class="col-lg-7 col-12">
                                        <div class="hero-text">
                                            <h1><span>UP TO 30% OFF </span>Laptop Gaming</h1>
                                            <p>Maboriosam in a nesciung eget magnae <br> dapibus disting tloctio in the find it pereri <br> odiy maboriosm.</p>
                                            <div class="button">
                                                <a href="#" class="btn">Shop Now!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Single Slider -->
        </section>
        <!--/ End Slider Area -->

        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>New Item</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="tab-content" id="myTabContent">
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <c:forEach items="${newProducts}" var="m">
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=${m.id}">
                                                                <span class="notify-badge">NEW</span>
                                                                <img class="default-img" src="${pageContext.request.contextPath}/${m.image}" alt="#">
                                                                <img class="hover-img" src="${pageContext.request.contextPath}/${m.image}" alt="#">
                                                            </a>

                                                            <div class="button-head">
                                                                <div class="product-action-2">

                                                                    <%                                                                        if (session.getAttribute("user") != null) {
                                                                    %>
                                                                    <form action="GuestCartController?view=addCard" method="post">
                                                                        <input type="hidden" value="${m.id}" name="productId" />
                                                                        <button type="submit" class="buy">ADD TO CART</button>
                                                                    </form>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <a href="GuestLoginController?view=login" class="buy">ADD TO CART</a>
                                                                        <%
                                                                            }
                                                                        %>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="product-content">
                                                            <h3><a href="${pageContext.request.contextPath}/GuestIndexController?view=productDetails&id=${m.id}">${m.name}</a></h3>
                                                            <div class="product-price">
                                                                <c:if test="${m.discount.percents *100 == 0 || m.discount.endDate == null}">
                                                                    <fmt:setLocale value="en_US" />
                                                                    <fmt:formatNumber value="${m.price}" type="currency" />
                                                                </c:if>
                                                                <c:if test="${m.discount.percents *100 > 0 && m.discount.endDate != null}">
                                                                    <fmt:setLocale value="en_US" />
                                                                    <fmt:formatNumber value="${m.price*(1-m.discount.percents)}" type="currency" />
                                                                    <small><del>${m.price}</del></small>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>                                
                                            <!--/ End Single Tab -->

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Product Area -->

        <!-- Start Midium Banner  -->
        <section class="midium-banner">
            <div class="container">
                <div class="row">
                    <!-- Single Banner  -->
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner">
                            <img src="${pageContext.request.contextPath}/admin/assets/img/z2456922139608_57d1852f29e6f44955f07b2666c11d35.jpg" width="600px" height="370px" alt="#">
                            <div class="content">
                                <p>Man's Collectons</p>
                                <h3>Man's items <br>Up to<span> 50%</span></h3>
                                <a href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- /End Single Banner  -->
                    <!-- Single Banner  -->
                    <div class="col-lg-6 col-md-6 col-12">
                        <div class="single-banner">
                            <img src="${pageContext.request.contextPath}/admin/assets/img/z2456922139608_57d1852f29e6f44955f07b2666c11d35.jpg" width="600px" height="370px" alt="#">
                            <div class="content">
                                <p>shoes women</p>
                                <h3>mid season <br> up to <span>70%</span></h3>
                                <a href="#" class="btn">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <!-- /End Single Banner  -->
                </div>
            </div>
        </section>
        <!-- End Midium Banner -->

        <!-- Start Shop Home List  -->
        <section class="shop-home-list section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>New Items</h1>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="product" items="${newItems}">
                            <!-- Start Single List  -->
                            <div class="single-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="list-image overlay">
                                            <span class="notify-badge">NEW</span>
                                            <img src="${product.image}" style="height: 200px !important; width: auto !important">
                                            <%
                                                if (session.getAttribute("user") != null) {
                                            %>
                                            <form action="GuestCartController?view=addCard" method="post">
                                                <input type="hidden" value="${product.id}" name="productId" />
                                                <button type="submit" class="buy"><i class="fa fa-shopping-bag"></i></button>
                                            </form>
                                            <%
                                            } else {
                                            %>
                                            <a href="GuestLoginController?view=login" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                <%
                                                    }
                                                %>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 no-padding">
                                        <div class="content">
                                            <h4 class="title"><a href="GuestIndexController?view=productDetails&id=${product.id}">${product.name}</a></h4>
                                            <p class="price with-discount">
                                                <c:if test="${product.discount.percents *100 == 0 || product.discount.endDate == null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price}" type="currency" />
                                                </c:if>
                                                <c:if test="${product.discount.percents *100 > 0 && product.discount.endDate != null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price*(1-product.discount.percents)}" type="currency" />
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List  -->
                        </c:forEach>
                    </div>
                    
                    
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>Best Seller</h1>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="product" items="${bestSeller}">
                            <!-- Start Single List  -->
                            <div class="single-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="list-image overlay">
                                            <img src="${product.image}" style="height: 200px !important;width: auto !important">
                                            <%
                                                if (session.getAttribute("user") != null) {
                                            %>
                                            <form action="GuestCartController?view=addCard" method="post">
                                                <input type="hidden" value="${product.id}" name="productId" />
                                                <button type="submit" class="buy"><i class="fa fa-shopping-bag"></i></button>
                                            </form>
                                            <%
                                            } else {
                                            %>
                                            <a href="GuestLoginController?view=login" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                <%
                                                    }
                                                %>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 no-padding">
                                        <div class="content">
                                            <h4 class="title"><a href="GuestIndexController?view=productDetails&id=${product.id}">${product.name}</a></h4>
                                            <p class="price with-discount">
                                                <c:if test="${product.discount.percents *100 == 0 || product.discount.endDate == null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price}" type="currency" />
                                                </c:if>
                                                <c:if test="${product.discount.percents *100 > 0 && product.discount.endDate != null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price*(1-product.discount.percents)}" type="currency" />
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List  -->
                        </c:forEach>
                    </div>
                    
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-section-title">
                                    <h1>Deal</h1>
                                </div>
                            </div>
                        </div>
                        <c:forEach var="product" items="${proDeal}">
                            <!-- Start Single List  -->
                            <div class="single-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="list-image overlay">
                                            <span class="notify-badge" style="background-color: red !important">${product.discount.percents *100} %</span>
                                            <img src="${product.image}" style="height: 200px !important;width: auto !important">
                                            <%
                                                if (session.getAttribute("user") != null) {
                                            %>
                                            <form action="GuestCartController?view=addCard" method="post">
                                                <input type="hidden" value="${product.id}" name="productId" />
                                                <button type="submit" class="buy"><i class="fa fa-shopping-bag"></i></button>
                                            </form>
                                            <%
                                            } else {
                                            %>
                                            <a href="GuestLoginController?view=login" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                                <%
                                                    }
                                                %>

                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12 no-padding">
                                        <div class="content">
                                            <h4 class="title"><a href="GuestIndexController?view=productDetails&id=${product.id}">${product.name}</a></h4>
                                            <p class="price with-discount">
                                                <c:if test="${product.discount.percents *100 == 0 || product.discount.endDate == null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price}" type="currency" />
                                                </c:if>
                                                <c:if test="${product.discount.percents *100 > 0 && product.discount.endDate != null}">
                                                    <fmt:setLocale value="en_US" />
                                                    <fmt:formatNumber value="${product.price*(1-product.discount.percents)}" type="currency" />
                                                </c:if>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List  -->
                        </c:forEach>
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
