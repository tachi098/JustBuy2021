<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Feedbacks | JustBuy</title>
        <jsp:include page="../../template/commonCss.jsp"/>

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
                                    <li class="breadcrumb-item active">Feedbacks</li>
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
                                    <div class="card-body">
                                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="pills-list-tab" data-toggle="pill" href="#pills-list" role="tab" aria-controls="pills-list" aria-selected="true">Feedbacks</a>
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
                                                            <th>Username</th>
                                                            <td>Status</td>
                                                            <td>Action</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                         
                                                        <c:forEach items="${listFeedback}" var="feedback">
                                                            <c:if test="${feedback.status == true}">
                                                                <tr>
                                                                    <td>${feedback.id}</td>
                                                                    <td>${feedback.userId.name}</td>
                                                                    <td><span class="badge badge-${feedback.status == true ? "success" : "dark"}">${feedback.status == true ? "New" : "Seen"}</span></td>
                                                                    <td>
                                                                        <a href="AdminFeedbackController?view=detail&id=${feedback.id}" class="btn btn-primary">Detail</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Username</th>
                                                            <td>Status</td>
                                                            <td>Action</td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade" id="pills-disable" role="tabpanel" aria-labelledby="pills-disable-tab">
                                                <table id="example2" class="table table-bordered table-hover w-100">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Username</th>
                                                            <td>Status</td>
                                                            <td>Action</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody>                                         
                                                        <c:forEach items="${listFeedback}" var="feedback">
                                                            <c:if test="${feedback.status == false}">
                                                                <tr>
                                                                    <td>${feedback.id}</td>
                                                                    <td>${feedback.userId.name}</td>
                                                                    <td><span class="badge badge-${feedback.status == true ? "success" : "dark"}">${feedback.status == true ? "New" : "Seen"}</span></td>
                                                                    <td>
                                                                        <a href="AdminFeedbackController?view=detail&id=${feedback.id}" class="btn btn-primary">Detail</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Username</th>
                                                            <td>Status</td>
                                                            <td>Action</td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
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

        <!-- jQuery -->
        <jsp:include page="../../template/commonJs.jsp"/>
    </body>
</html>

