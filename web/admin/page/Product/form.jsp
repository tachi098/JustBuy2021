<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Products | JustBuy</title>

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
                                <h1>Product ${empty product ? "Create" : "Edit"}</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>
                <!-- Main content -->
                <section class="content">
                    <c:if test="${empty product}">
                        <form action="AdminProductController?view=insert" method="post" enctype="multipart/form-data">
                        </c:if>
                        <c:if test="${not empty product}">
                            <form action="AdminProductController?view=update" method="post" enctype="multipart/form-data">
                                <input name="id" value="${product.id}" hidden>
                            </c:if>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Product</h3>

                                            <div class="card-tools">
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input type="text" class="form-control" name="name" value="${product.name}" maxlength="50" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select name="category" class="form-control">
                                                    <c:forEach items="${listCategory}" var="category">
                                                        <option value="${category.id}" ${product.cateId.id == category.id ? "selected" : ""}>${category.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input type="number" class="form-control" name="price" value="${product.price}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Stock</label>
                                                <input type="number" class="form-control" name="stock" value="${product.stock}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea class="form-control" name="description" rows="4" required maxlength="3000">${product.description == null ? "" : product.description}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Images</label>
                                                <c:if test="${empty product}">
                                                    <input type="file" class="form-control-file" name="images" multiple required>
                                                </c:if>
                                                <c:if test="${not empty product}">
                                                    <input type="file" class="form-control-file" name="images" multiple>
                                                </c:if>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <c:if test="${not empty product}">
                                    <div class="col-md-12">
                                        <div class="card card-primary">
                                            <div class="card-header">
                                                <h3 class="card-title">Discount</h3>

                                                <div class="card-tools">
                                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label>End date</label>
                                                    <select name="endDate" class="form-control">
                                                        <option value="default">Select</option>
                                                        <option value="1">1 day</option>
                                                        <option value="3">3 days</option>
                                                        <option value="5">5 days</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Percent</label>
                                                    <select name="percent" class="form-control" >
                                                        <option value="default">Select</option>
                                                        <option value="0.1">10%</option>
                                                        <option value="0.15">15%</option>
                                                        <option value="0.2">20%</option>
                                                        <option value="0.25">25%</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- /.card-body -->
                                        </div>
                                        <!-- /.card -->
                                    </div>
                                </c:if>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <a href="AdminProductController?view=show" class="btn btn-secondary">Back</a>
                                    <input type="submit" value="Save Changes" class="btn btn-success float-right">
                                </div>
                            </div>
                        </form>
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
