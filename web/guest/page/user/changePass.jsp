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
                                <li class="active"><a href="${pageContext.request.contextPath}/GuestUserController?view=changePass">Change Password</a></li>
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
                                <h1>Change password</h1>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/GuestUserController?view=processChangePass" method="post">
                                    <div class="form-group">
                                        <label for="oldPass">Old password</label>
                                        <input type="password" class="form-control" id="oldPass" name="oldPass" required>
                                    </div>
                                    <c:if test="${not empty errorOP}"><h5 style="color: red; padding-left: 30px;">${errorOP}</h5></c:if>
                                    <div class="form-group">
                                        <label for="newPass">New password</label>
                                        <input type="password" class="form-control" id="newPass" name="newPass" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="newPass2">Retype password</label>
                                        <input type="password" class="form-control" id="newPass2" name="newPass2" required>
                                    </div>
                                    <c:if test="${not empty errorNP}"><h5 style="color: red; padding-left: 30px;">${errorNP}</h5></c:if>
                                    <br>
                                    <button type="submit" class="btn btn-primary" style="margin-left: 30px">Submit</button>
                                </form>

                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <br/>
                <!--                <div class="row">
                                    <div class="col-12">
                                        <a href="${pageContext.request.contextPath}/guest/page/user/changePass.jsp" class="btn btn-success" style="color: white">Change password</a>
                                        <a href="GuestUserController?view=update" class="btn btn-primary" id="btnEdit">Edit</a>
                                    </div>
                                </div>-->
                <br>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!--/ End Contact -->        
        <%@include file="../../footer.jsp" %>
    </body>
</html>
