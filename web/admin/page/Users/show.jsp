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
                                    <div class="card-body">

                                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="pills-list-tab" data-toggle="pill" href="#pills-list" role="tab" aria-controls="pills-list" aria-selected="true">Users</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="pills-disable-tab" data-toggle="pill" href="#pills-disable" role="tab" aria-controls="pills-disable" aria-selected="false">Status</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="pills-tabContent">
                                            <div class="tab-pane fade show active" id="pills-list" role="tabpanel" aria-labelledby="pills-list-tab">
                                                <table id="example1" class="table table-bordered table-hover w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Phone</th>
                                                            <th>Username</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                         
                                                        <c:forEach items="${listUsers}" var="user">
                                                            <c:if test="${!(user.role eq 0) && !(user.role eq 2)}">
                                                                <tr>
                                                                    <td>${user.id}</td>
                                                                    <td>${user.name}</td>
                                                                    <td>${user.email}</td>
                                                                    <td>${user.phone}</td>
                                                                    <td>${user.username}</td>
                                                                    <td>
                                                                        <span class="badge badge-success">Enable</span>
                                                                    </td>
                                                                    <td>
                                                                        <a href="AdminUserController?view=details&id=${user.id}" class="btn btn-info">Detail</a>
                                                                        <a href="AdminUserController?view=edit&id=${user.id}" class="btn btn-warning">Update</a>
                                                                        <a href="AdminUserController?view=status&id=${user.id}" class="btn btn-danger">Disable</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Phone</th>
                                                            <th>City</th>
                                                            <th>Username</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="pills-disable" role="tabpanel" aria-labelledby="pills-disable-tab">
                                                <table id="example2" class="table table-bordered table-hover w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Phone</th>
                                                            <th>City</th>
                                                            <th>Username</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                         
                                                        <c:forEach items="${listUsers}" var="user">
                                                            <c:if test="${!(user.role eq 0) && !(user.role eq 1)}">
                                                                <tr>
                                                                    <td>${user.id}</td>
                                                                    <td>${user.name}</td>
                                                                    <td>${user.email}</td>
                                                                    <td>${user.phone}</td>
                                                                    <td>${user.address.city}</td>
                                                                    <td>${user.username}</td>
                                                                    <td>
                                                                        <span class="badge badge-danger">Disable</span>
                                                                    </td>
                                                                    <td>
                                                                        <a href="AdminUserController?view=status&id=${user.id}" class="btn btn-success">Enable</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Email</th>
                                                            <th>Phone</th>
                                                            <th>City</th>
                                                            <th>Username</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
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
