<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User | JustBuy</title>
    </head>
    <body>
        <h1>Update Profile</h1>
        <form action="GuestUserController?view=processUpdate" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Full name</td>
                    <td><input type="text" name="name" value="${user.name}"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="${user.email}"/></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="email" value="${user.phone}"/></td>
                </tr>
                <tr>
                    <td>Address 1</td>
                    <td><input type="text" name="email" value="${user.address.line1}"/></td>
                </tr>
                <tr>
                    <td>Address 2</td>
                    <td><input type="text" name="email" value="${user.address.line2}"/></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" readonly name="email" value="${user.address.city}"/></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><input type="text" readonly name="email" value="${user.address.state}"/></td>
                </tr>
                <tr>
                    <td>Zipcode</td>
                    <td><input type="text" readonly name="email" value="${user.address.zipcode}"/></td>
                </tr>
                <c:if test="${not empty user.avatar}">
                    <tr>
                        <td>Avatar</td>
                        <td><img src="${pageContext.request.contextPath}/guest/assets/images/user/${user.avatar}"/></td>
                    </tr>
                </c:if>
            </table>
            <div>
                <a href="GuestUserController?view=update">Update</a>
                <span><a href="GuestUserController?view=changePass">Change password</a></span>
            </div>
        </form>
    </body>
</html>
