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
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestBillController?view=show">Bill History</a></li>
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
                                <h1>Bill History</h1>
                            </div>
                            <div class="card-body" style="padding-left: 30px">
                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Bill Id</th>
                                            <th>Purchase Date</th>
                                            <th>Total price</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>                                         
                                        <c:forEach items="${list}" var="b">
                                            <c:if test="${b.bStatus != 4}">
                                                <tr>
                                                    <td>${b.id}</td>
                                                    <td><fmt:formatDate value="${b.purchaseDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                                        <td>
                                                        <c:forEach items="${listAmount}" var="l">
                                                            <c:if test="${l.id == b.id}"><fmt:formatNumber value="${l.amount}" type="currency" /></c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${b.bStatus == 0}"><span class="badge badge-primary">Processing</span></c:when>
                                                            <c:when test="${b.bStatus == 1}"><span class="badge badge-warning">Shipping</span></c:when>
                                                            <c:when test="${b.bStatus == 2}"><span class="badge badge-success">Complete</span></c:when>
                                                            <c:when test="${b.bStatus == 3}"><span class="badge badge-danger">Canceled</span></c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="GuestBillController?view=detail&id=${b.id}" class="btn btn-info" style="color: white">Detail</a>
                                                    <c:if test="${b.bStatus == 0}"><a href="GuestBillController?view=cancel&id=${b.id}" class="btn btn-info" style="color: white; background-color: red">Cancel</a></c:if>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Bill Id</th>
                                            <th>Purchase Date</th>
                                            <th>Amount</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                </table>
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
