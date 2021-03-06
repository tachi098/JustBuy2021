<%@page import="com.fpt.model.Users"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="java.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #999;
                background: #f3f3f3;
                font-family: 'Roboto', sans-serif;
            }
            .form-control {
                border-color: #eee;
                min-height: 41px;
                box-shadow: none !important;
            }
            .form-control:focus {
                border-color: #5cd3b4;
            }
            .form-control, .btn {        
                border-radius: 3px;
            }
            .signup-form {
                width: 500px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .signup-form h2 {
                color: #333;
                margin: 0 0 30px 0;
                display: inline-block;
                padding: 0 30px 10px 0;
                border-bottom: 3px solid #5cd3b4;
            }
            .signup-form form {
                color: #999;
                border-radius: 3px;
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .signup-form .form-group row {
                margin-bottom: 20px;
            }
            .signup-form label {
                font-weight: normal;
                font-size: 14px;
                line-height: 2;
            }
            .signup-form input[type="checkbox"] {
                position: relative;
                top: 1px;
            }
            .signup-form .btn {        
                font-size: 16px;
                font-weight: bold;
                background: #5cd3b4;
                border: none;
                margin-top: 20px;
                min-width: 140px;
            }
            .signup-form .btn:hover, .signup-form .btn:focus {
                background: #41cba9;
                outline: none !important;
            }
            .signup-form a {
                color: #5cd3b4;
                text-decoration: underline;
            }
            .signup-form a:hover {
                text-decoration: none;
            }
            .signup-form form a {
                color: #5cd3b4;
                text-decoration: none;
            }	
            .signup-form form a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
</head>

<body>

    <div class="signup-form">
        <form action="GuestLoginController?view=process" method="post" class="form-horizontal">
            <div class="row">
                <div class="col-8 offset-4">
                    <h2>Sign In</h2>
                </div>	
            </div>			
            <div class="form-group row">
                <label class="col-form-label col-4">Username</label>
                <div class="col-8">
                    <input type="text" class="form-control" name="name" required>
                </div>        	
            </div>

            <div class="form-group row">
                <label class="col-form-label col-4">Password</label>
                <div class="col-8">
                    <input type="password" class="form-control" name="pass" required>
                </div>        	
            </div>
            <c:if test="${not empty error}">
                <p style="color: red"> ${error} </p>
            </c:if>

            <div class="col-8 offset-4">

                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
            </div>  
        </form>

    </div>	

    <div class="text-center">Dont have an account? <a href="GuestLoginController?view=regis">Sign up here</a></div>
</div>
</body>
</html>

<%@include file="footer.jsp" %>