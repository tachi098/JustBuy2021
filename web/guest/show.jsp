<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                    <c:forEach var="product" items="${products}">
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single List  -->
                            <div class="single-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="list-image overlay">
                                            <img src="${product.image}">
                                            <%
                                                if(session.getAttribute("user") != null) {
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
                                                <fmt:formatNumber value="${product.price}" type="currency" />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List  -->
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- End Shop Home List  -->

        <%@include file="footer.jsp" %>

    </body>
</html>
