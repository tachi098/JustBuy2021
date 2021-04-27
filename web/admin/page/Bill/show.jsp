<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bills | JustBuy</title>
        <jsp:include page="../../template/commonCss.jsp"/>
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Navbar -->
            <jsp:include page="../../template/navbar.jsp"/>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <jsp:include page="../../template/sidebar.jsp"/>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Bills</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="example2" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Bill Id</th>
                                                    <th>User Name</th>
                                                    <th>Purchase Date</th>
                                                    <th>Total price</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>                                         
                                                <c:forEach items="${list}" var="b">
                                                    <tr>
                                                        <td>${b.id}</td>
                                                        <td>${b.userId.name}</td>
                                                        <td><fmt:formatDate value="${b.purchaseDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                                            <td>
                                                            <c:forEach items="${listAmount}" var="l">
                                                                <c:if test="${l.id == b.id}"><fmt:formatNumber value="${l.amount}" type="currency" /></c:if>
                                                            </c:forEach>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${b.bStatus == 0}">
                                                                    <form action="AdminBillController?view=updateBill" method="post" class="d-flex">
                                                                        
                                                                        <input type="hidden" name="id" value="${b.id}"/>
                                                                        <select name="status" class="form-control">
                                                                            <option value="0" selected>Processing</option>
                                                                            <option value="1">Shipping</option>
                                                                            <option value="2">Complete</option>
                                                                            <option value="3">Canceled</option>
                                                                        </select>
                                                                        <input type="submit" value="Update" class="btn btn-warning"/>
                                                                    </form>
                                                                </c:when>
                                                                <c:when test="${b.bStatus == 1}"><span class="badge badge-warning">Shipping</span></c:when>
                                                                <c:when test="${b.bStatus == 2}"><span class="badge badge-success">Complete</span></c:when>
                                                                <c:when test="${b.bStatus == 3}"><span class="badge badge-danger">Canceled</span></c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <a href="AdminBillController?view=showBillDetail&id=${b.id}" class="btn btn-info">Detail</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Bill Id</th>
                                                    <th>User Name</th>
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
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="../../template/footer.jsp"/>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <jsp:include page="../../template/commonJs.jsp"/>
    </body>
</html>
