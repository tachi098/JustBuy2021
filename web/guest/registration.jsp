<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="java.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>


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
        <form action="GuestLoginController?view=create" method="post" class="form-horizontal">
            <div class="row">
                <div class="col-8 offset-4">
                    <h2>Sign Up</h2>
                </div>	
            </div>			
            <div class="form-group row">
                <label class="col-form-label col-4">Username</label>
                <div class="col-8">
                    <input type="text" minlength="7" class="form-control" name="name" required="required">
                </div>    
            </div>
            <div class="form-group row">
                <label class="col-form-label col-4">Email Address</label>
                <div class="col-8">
                    <input type="email" class="form-control" name="email" required="required">
                </div>        	
            </div>
            <div class="form-group row">
                <label class="col-form-label col-4">Password</label>
                <div class="col-8">
                    <input type="password" minlength="7" class="form-control" name="pass" required="required">
                </div>        	
            </div>
            <div class="form-group row">
                <label class="col-form-label col-4">Confirm Password</label>
                <div class="col-8">
                    <input type="password" minlength="8" class="form-control" name="cfpass" required="required">
                </div>        	
            </div>
            <c:if test="${not empty errorPass}">
                <p style="color: red">${errorPass}</p>
            </c:if>
            <c:if test="${not empty errorUsername}">
                <p style="color: red">${errorUsername}</p>
            </c:if>
            <div class="form-group row">
                <div class="col-8 offset-4">
                    <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
                </div>  
            </div>		      
        </form>
        <div class="text-center">Already have an account? <a href="${pageContext.request.contextPath}/guest/login.jsp">Login here</a></div>
    </div>
</body>
</html>

<%@include file="footer.jsp" %>