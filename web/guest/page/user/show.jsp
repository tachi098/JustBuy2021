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
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestUserController?view=show">My Account</a></li>
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
                            <div class="card-header">
                                <h1>ID: ${users.id} - ${users.name}</h1>
                            </div>
                            <div class="card-body d-flex">
                                <img src="${empty users.avatar ? 'admin/assets/img/avatar.png' : users.avatar}" id="avatar" />
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
                <br/>
                <div class="row">
                    <div class="col-12">
                        <a href="${pageContext.request.contextPath}/GuestUserController?view=changePass" class="btn btn-success" style="color: white">Change password</a>
                        <a href="GuestUserController?view=update" class="btn btn-primary" id="btnEdit">Edit</a>
                    </div>
                </div>
                <br>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!--/ End Contact -->        
        <%@include file="../../footer.jsp" %>
    </body>
</html>
