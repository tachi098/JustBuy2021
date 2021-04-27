<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dashboard | JustBuy</title>
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
                                    <section class="content">
                                        <div class="container-fluid">
                                            <!-- Small boxes (Stat box) -->
                                            <div class="row">
                                                <div class="col-lg-3 col-6">
                                                    <!-- small box -->
                                                    <div class="small-box bg-info">
                                                        <div class="inner">
                                                            <h3>${countProduct}</h3>

                                                            <p>Products</p>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-bag"></i>
                                                        </div>
                                                        <a href="AdminProductController?view=show" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                                    </div>
                                                </div>
                                                <!-- ./col -->
                                                <div class="col-lg-3 col-6">
                                                    <!-- small box -->
                                                    <div class="small-box bg-success">
                                                        <div class="inner">
                                                            <h3>${countBill}</h3>

                                                            <p>Total Bills</p>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-stats-bars"></i>
                                                        </div>
                                                        <a href="AdminBillController?view=showAllBills" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                                    </div>
                                                </div>
                                                <!-- ./col -->
                                                <div class="col-lg-3 col-6">
                                                    <!-- small box -->
                                                    <div class="small-box bg-warning">
                                                        <div class="inner">
                                                            <h3>${countUser}</h3>

                                                            <p>User Registrations</p>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-person-add"></i>
                                                        </div>
                                                        <a href="AdminUserController?view=show" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                                    </div>
                                                </div>
                                                <!-- ./col -->
                                                <div class="col-lg-3 col-6">
                                                    <!-- small box -->
                                                    <div class="small-box bg-danger">
                                                        <div class="inner">
                                                            <h3>${countCategory}</h3>

                                                            <p>Product Categories</p>
                                                        </div>
                                                        <div class="icon">
                                                            <i class="ion ion-pie-graph"></i>
                                                        </div>
                                                        <a href="AdminCategoryController?view=show" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                                    </div>
                                                </div>
                                                <!-- ./col -->
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col --> 
                            <div class="col-md-8">
                                <div class="card">
                                    <div class="card-header border-transparent">
                                        <h3 class="card-title">Latest Orders</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table m-0">
                                                <thead>
                                                    <tr>
                                                        <th>Bill ID</th>
                                                        <th>User Name</th>
                                                        <th>Purchase Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listBill}" var="b">
                                                        <tr>
                                                            <td><a href="AdminBillController?view=showBillDetail&id=${b.id}">${b.id}</a></td>
                                                            <td>${b.userId.name}</td>
                                                            <td><fmt:formatDate value="${b.purchaseDate}" pattern="yyyy-MM-dd"></fmt:formatDate></span></td>
                                                                <td>
                                                                <c:choose>
                                                                    <c:when test="${b.bStatus == 0}"><span class="badge badge-primary">Processing</span></c:when>
                                                                    <c:when test="${b.bStatus == 1}"><span class="badge badge-warning">Shipping</span></c:when>
                                                                    <c:when test="${b.bStatus == 2}"><span class="badge badge-success">Complete</span></c:when>
                                                                    <c:when test="${b.bStatus == 3}"><span class="badge badge-danger">Canceled</span></c:when>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- /.table-responsive -->
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer clearfix">
                                        <a href="AdminBillController?view=show" class="btn btn-sm btn-secondary float-right">View All Orders</a>
                                    </div>
                                    <!-- /.card-footer -->
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Recently Added Products</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body p-0">
                                        <ul class="products-list product-list-in-card pl-2 pr-2">
                                            <c:forEach items="${listProduct}" var="p">
                                                <li class="item">
                                                    <div class="product-img">
                                                        <img src="${p.image}" alt="#" class="img-size-50">
                                                    </div>
                                                    <div class="product-info">
                                                        <a href="javascript:void(0)" class="product-title">${p.name}
                                                            <span class="badge badge-warning float-right"><fmt:formatNumber value="${p.price}" type="currency" /></span></a>
                                                        <span class="product-description">
                                                            ${p.description}
                                                        </span>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer text-center">
                                        <a href="AdminProductController?view=show" class="uppercase">View All Products</a>
                                    </div>
                                    <!-- /.card-footer -->
                                </div>
                                <!-- /.card -->
                            </div>
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
