<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form action="AdminUserController?view=update" method="post" enctype="multipart/form-data">
                        <input type="hidden" class="form-control" name="id" value="${users.id}">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-primary">
                                    <div class="card-header">
                                        <h3 class="card-title">Update Info: ${users.name}</h3>

                                        <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" class="form-control" name="name" value="${users.name}" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="email" value="${users.email}" required pattern="^\w{2,}@\w{2,}(\.\w{2,}){1,2}$">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" name="phone" value="${users.phone}" required pattern="^[0-9]{1,}$">
                                        </div>
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" value="${users.username}" name="username" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Avatar</label>
                                            <input type="file" class="form-control-file" accept="image/*" name="avatar">
                                        </div>
                                        <div class="form-group">
                                            <img src="${empty users.avatar ? 'admin/assets/img/avatar.png' : users.avatar}" width="100" height="100" id="imgAvatar" />
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                        </div>        
                        <div class="row">
                            <div class="col-12">
                                <a href="AdminUserController?view=show" class="btn btn-secondary">Back</a>
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

        <!-- Includes JavaScript -->
        <jsp:include page="../../template/commonJs.jsp"/>
        <script>
            document.querySelector('input[type="file"]').onchange = (e) => {
                document.querySelector("#imgAvatar").src = URL.createObjectURL(e.target.files[0]);
            };
        </script>
    </body>
</html>
