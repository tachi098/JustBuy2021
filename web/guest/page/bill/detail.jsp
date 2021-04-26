<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../java.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill | JustBuy</title>
    </head>
    <body class="js">

        <%@include file="../../header.jsp" %>


        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="${pageContext.request.contextPath}">Home<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestBillController?view=show">Bill History<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="#">Bill Detail</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Contact -->
        <section class="content">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <!-- /.card-header -->
                            <div class="card-header">
                                <h1>Bill Detail</h1>
                            </div>
                            <div class="card-body" style="padding-left: 30px">
                                <div class="shopping-cart section">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Shopping Summery -->
                                                <fmt:setLocale value="en_US" />
                                                <table class="table shopping-summery">
                                                    <thead>
                                                        <tr class="main-hading">
                                                            <th>PRODUCT</th>
                                                            <th>NAME</th>
                                                            <th class="text-center">UNIT PRICE</th>
                                                            <th class="text-center">QUANTITY</th>
                                                            <th class="text-center">DISCOUNT</th>
                                                            <th class="text-center">TOTAL</th> 
                                                            <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="billDetail" items="${billDetail}">
                                                            <tr>
                                                                <td class="image" data-title="No"><img src="${billDetail.productId.image}" alt="#"></td>
                                                                <td class="product-des" data-title="Description" style="text-align: center">
                                                                    <p class="product-name"><a href="#">${billDetail.productId.name}</a></p>
                                                                    <p class="product-des">${billDetail.productId.description}</p>
                                                                </td>
                                                                <td class="price" data-title="Price"><span><fmt:formatNumber value="${billDetail.productId.price}" type="currency" /></span></td>
                                                                <td class="qty" data-title="Qty" style="text-align: center"><!-- Input Order -->
                                                                            ${billDetail.quantity}
                                                                </td>
                                                                <td class="discount" data-title="Discount" style="text-align: center"><span>${billDetail.discount * 100}%</span></td>
                                                                <td class="total-amount" data-title="Total"><span></span><fmt:formatNumber value="${billDetail.productId.price * (100 - billDetail.discount) / 100 * billDetail.quantity}" type="currency" /></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                                <!--/ End Shopping Summery -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <!-- Total Amount -->
                                                <div class="total-amount">
                                                    <div class="row">
                                                        <div class="col-lg-8 col-md-5 col-12">
                                                            <div class="left">

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-7 col-12">
                                                            <div class="right">
                                                                <c:forEach items="${listAmount}" var="l">
                                                                    <c:if test="${l.id == bill.id}">
                                                                        <ul>
                                                                            <li style="font-size: 1.3em; font-weight: bold">Total amount:<span>
                                                                                    <fmt:formatNumber value="${l.amount}" type="currency" />
                                                                                </span></li>
                                                                        </ul>
                                                                    </c:if>
                                                                </c:forEach>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/ End Total Amount -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <br/>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!--/ End Contact -->        
        <%@include file="../../footer.jsp" %>
    </body>
</html>
