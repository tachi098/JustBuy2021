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
                <div class="row ">
                    <div class="col-lg-4 col-md-6 col-12">
                        <ul class="pagination d-flex">
                            <c:forEach begin="1" end="${pages}" var="i">
                                <li class="page-item" style="${activePage eq i ? 'color: red;' : ''}"}>
                                    <c:if test="${empty keyword}">
                                        <a href="GuestIndexController?view=showProduct&page=${i}&pageMax=${pageMax}<c:if test="${not empty cateId}">&cateId=${cateId}</c:if>" class="page-link" id="{i}">${i}</a>
                                    </c:if>
                                    <c:if test="${not empty keyword}">
                                        <a href="GuestIndexController?view=showProduct&keyword=${keyword}&page=${i}&pageMax=${pageMax}" class="page-link" id="{i}">${i}</a>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div  class="col-lg-4 col-md-6 col-12 mt-5">

                    </div>
                    <div  class="col-lg-4 col-md-6 col-12 mt-5">
                        <select id="selectedRecords" class="form-control"> 
                            <option>Filter Category</option>
                            <c:forEach items="${cates}" var="category">
                                <option value="${category.id}" ${cateId eq category.id ? 'selected' : ''}>${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="row">
                    <c:forEach var="product" items="${products}">
                        <div class="col-lg-4 col-md-6 col-12">
                            <!-- Start Single List  -->
                            <div class="single-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="list-image overlay">
                                            <img src="${product.image}" style="height: 200px !important;width: auto !important">
                                            <%                                                if (session.getAttribute("user") != null) {
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
                                                    <small><del>${product.price}</del></small>
                                                </c:if>
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
        <script type="text/javascript">
            let countPrevent = false;

            document.querySelector('#selectedRecords').addEventListener('change', (e) => {
//                if (countPrevent) {
                window.location = '${pageContext.request.contextPath}/GuestIndexController?view=showProduct&cateId=' + e.target.value;
//                }
                countPrevent = true;
            });
        </script> 
    </body>
</html>
