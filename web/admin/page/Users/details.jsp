<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Users | JustBuy</title>

        <!-- Includes Css -->
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
                                <h1></h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Users</li>
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
                                    <div class="card-header">
                                        <h1>ID: ${users.id} - ${users.name}</h1>
                                    </div>
                                    <div class="card-body d-flex">
                                        <img src="${empty users.avatar ? 'admin/assets/img/avatar.png' : users.avatar}" width="100" height="100" />
                                        <table class="table table-bordered table-hover w-50">
                                            <tbody>
                                                <tr>
                                                    <th>Email</th>
                                                    <td>
                                                        <a href="email:${users.email}">${users.email}</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>Phone</th>
                                                    <td>
                                                        <a href="tel:${users.phone}">${users.phone}</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>City</th>
                                                    <td>${users.address.city}</td>
                                                </tr>
                                                <tr>
                                                    <th>Username</th>
                                                    <td>${users.username}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-bordered table-hover w-50">
                                            <tbody>
                                                <tr>
                                                    <th>Address 1</th>
                                                    <td>${users.address.line1}</td>
                                                </tr>
                                                <tr>
                                                    <th>Address 2</th>
                                                    <td>${users.address.line2}</td>
                                                </tr>
                                                <tr>
                                                    <th>State</th>
                                                    <td>${users.address.state}</td>
                                                </tr>
                                                <tr>
                                                    <th>ZipCode</th>
                                                    <td>${users.address.zipcode}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-12">
                                <a href="AdminUserController?view=show" class="btn btn-secondary">Back</a>
                            </div>
                        </div>
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

        <!-- Includes JavaScript -->
        <jsp:include page="../../template/commonJs.jsp"/>
    </body>
</html>
