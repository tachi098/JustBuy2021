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
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">DataTable with minimal features & hover style</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="example2" class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Bill Id</th>
                                                    <th>User Name</th>
                                                    <th>Purchase Date</th>
                                                    <th>Amount</th>
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
                                                        <td>${b.amount}</td>
                                                        <td>${b.bStatus}</td>
                                                        <td>
                                                            <a href="AdminBillController?view=showBillDetail&id=${b.id}" class="btn btn-info">Detail</a> 
                                                            <a href="AdminBillController?view=updateBill&id=${b.id}" class="btn btn-warning">Update</a>
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
