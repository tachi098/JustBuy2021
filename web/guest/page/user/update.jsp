<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../java.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User | JustBuy</title>
        <style>
            #avatar {
                height: 100px;
                width: 100px;
            }
            #btnEdit {
                color: #fff;
                background-color: #28a745;
                border-color: #28a745;
                box-shadow: none;
                float: right;
            }
            #btnEdit:hover{
                opacity: 0.8;
                background-color: lightskyblue;
            }
            .form-group{
                padding-left: 30px;
            }
            label{
                font-weight: bold;
                font-size: 1.3em;
            }
        </style>
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
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestUserController?view=show">My Account<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestUserController?view=update">Update information</a></li>
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
                            <div class="card-header" style="background: #00bfff; color: white">
                                <h1>Update information</h1>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/GuestUserController?view=processUpdate" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="${user.id}"/>
                                    <div class="card">
                                        <!-- /.card-header -->
                                        <div class="card-header" style="background: #01ff70; color: white">
                                            <h6>Update user</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="name">Full name</label>
                                                <input type="text" class="form-control" id="name" name="name" required value="${user.name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="text" class="form-control" id="email" name="email" required value="${user.email}">
                                            </div>
                                            <div class="form-group">
                                                <label for="phone">Phone</label>
                                                <input type="text" class="form-control" id="phone" name="phone" required value="${user.phone}">
                                            </div>

                                            <div class="form-group">
                                                <label>Avatar</label>
                                                <input type="file" class="form-control-file" accept="image/*" name="avatar">
                                            </div>
                                            <div class="form-group">
                                                <img src="${empty user.avatar ? 'admin/assets/img/avatar.png' : user.avatar}" width="100" height="100" id="imgAvatar" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <!-- /.card-header -->
                                        <div class="card-header" style="background: #01ff70; color: white">
                                            <h6>Update address</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="line1">Address 1</label>
                                                <input type="text" class="form-control" id="line1" name="line1" required value="${user.address.line1}">
                                            </div>
                                            <div class="form-group">
                                                <label for="line2">Address 2</label>
                                                <input type="text" class="form-control" id="line2" name="line2" value="${user.address.line2}">
                                            </div>
                                            <div class="form-group">
                                                <label for="city">City</label>
                                                <input type="text" class="form-control" id="city" name="city" value="${user.address.city}">
                                            </div>
                                            <div class="form-group">
                                                <label for="state">State</label>
                                                <input type="text" class="form-control" id="state" name="state" value="${user.address.state}">
                                            </div>
                                            <div class="form-group">
                                                <label for="zipcode">Zipcode</label>
                                                <input type="text" class="form-control" id="zipcode" name="zipcode" value="${user.address.zipcode}">
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <button type="submit" class="btn btn-primary" style="margin-left: 30px">Submit</button>
                                </form>
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
        <script>
            document.querySelector('input[type="file"]').onchange = (e) => {
                document.querySelector("#imgAvatar").src = URL.createObjectURL(e.target.files[0]);
            };
        </script>
    </body>
</html>
