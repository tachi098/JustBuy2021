
<%@page import="com.fpt.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../template/commonCss.jsp"/>
        <%
            Users user = (Users) session.getAttribute("user");
            if (user != null) {
                response.sendRedirect(request.getContextPath() + "/AdminProductController?view=show");
            }
        %>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Login Form</h1>
                </div>
                <div class="col-md-6">
                    <form action="http://localhost:8080/JustBuy2021/AdminLoginController?view=login" method="POST">
                        <div class="form-group">
                            <label>username</label>
                            <input type="text" required name="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>password</label>
                            <input type="password" required name="pass" class="form-control">
                        </div>
                        <input type="submit" class="btn btn-primary" value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
