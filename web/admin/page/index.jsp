<%@page import="com.fpt.model.Users"%>
<%
    Users user = (Users) session.getAttribute("userAdmin");
    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/AdminDashboardController?view=show");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login | JustBuy</title>

        <jsp:include page="../template/commonCss.jsp"/>
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../index2.html"><b>Just Buy</b> Admin</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Sign in to start your session</p>

                    <form action="http://localhost:8080/JustBuy2021/AdminLoginController?view=login" method="POST">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Username" name="name">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" class="form-control" placeholder="Password" name="pass">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                            </div>
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <jsp:include page="../template/commonJs.jsp"/>
    </body>
</html>
