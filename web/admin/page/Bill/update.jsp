<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | DataTables</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/fontawesome-free/css/all.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/adminlte.min.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bootstrap 4 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/jqvmap/jqvmap.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/daterangepicker/daterangepicker.css">
        <!-- summernote -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/plugins/summernote/summernote-bs4.min.css">
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
                                <h1>DataTables</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">DataTables</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>
                <!-- Main content -->
                <section class="content">
                    <form action="AdminBillController?view=processUpdate" method="post">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Bill</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="billId">Bill Id</label>
                                            <input type="text" id="billId" class="form-control" value="${bill.id}" name="billId">
                                        </div>
                                        <div class="form-group">
                                            <label for="userId">User Id</label>
                                            <select name="userId" >
                                                <c:forEach items="${listUser}" var="u">
                                                    <c:choose>
                                                        <c:when test="${u.id == bill.userId.id}"><option value="${u.id}" selected="true">${u.name}</option></c:when>
                                                        <c:otherwise><option value="${u.id}">${u.name}</option></c:otherwise>
                                                    </c:choose> 
                                                </c:forEach>
                                            </select>
                                            <!--<input type="text" id="userId" class="form-control" value="${bill.userId.id}" name="">-->
                                        </div>
                                        <div class="form-group">
                                            <label for="pDate">Purchase Date</label>
                                            <input type="date" id="pDate" class="form-control" value="<fmt:formatDate value="${bill.purchaseDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                                            </div>
                                            <div class="form-group">
                                                <label for="status">Status</label>
                                                <select name="status" >
                                                    <option value="0" selected>Processing</option>
                                                    <option value="1">Shipping</option>
                                                    <option value="2">Complete</option>
                                                    <option value="3">Canceled</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- /.card-body -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <div class="col-md-9">
                                    <div class="card card-secondary">
                                        <div class="card-header">
                                            <h3 class="card-title">Bill Detail</h3>

                                            <div class="card-tools">
                                                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                                    <i class="fas fa-minus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                        <c:forEach items="${billDetail}" var="b">
                                            <table>
                                                <tr>
                                                    <td><label>Product name</label>
                                                        <select name="product${b.id}" >
                                                            <c:forEach items="${listProduct}" var="u">
                                                                <c:choose>
                                                                    <c:when test="${u.id == b.productId.id}"><option value="${u.id}" selected="true">${u.name}</option></c:when>
                                                                    <c:otherwise><option value="${u.id}">${u.name}</option></c:otherwise>
                                                                </c:choose> 
                                                            </c:forEach>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td><label>Quantity</label><input type="number" class="form-control" value="${b.quantity}" name="quantity${b.id}"></td>
                                                    <td><label>Discount</label><input type="number" step="0.1" class="form-control" value="${b.discount}" name="discount${b.id}"></td>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <a href="AdminBillController?view=showAllBills" class="btn btn-secondary">Back</a>
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
        <script src="${pageContext.request.contextPath}/admin/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="${pageContext.request.contextPath}/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- DataTables  & Plugins -->
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/jszip/jszip.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/pdfmake/pdfmake.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/pdfmake/vfs_fonts.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/demo.js"></script>
        <!-- Page specific script -->
        <script>
            $(function () {
//                $("#example1").DataTable({
//                    "responsive": true, "lengthChange": false, "autoWidth": false,
//                    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
//                }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": true,
                    "responsive": true,
                });
            });
        </script>
    </body>
</html>
