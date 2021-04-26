<%@include file="java.jsp" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.fpt.model.Users"%>
<%
    Users user = (Users) session.getAttribute("user");
    String username = "";
    int count = 0;
    if (user != null) {
        if (session.getAttribute("countCart") != null) {
            count = (int) session.getAttribute("countCart");
        }
        username = user.getName();
        if ("regis".equals(request.getParameter("view")) || "process".equals(request.getParameter("view")) || "login".equals(request.getParameter("view"))) {
            response.sendRedirect("GuestIndexController?view=show");
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>        
<!-- Header -->
<header class="header shop">
    <!-- Topbar -->
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-12">
                    <!-- Top Left -->
                    <div class="top-left">
                        <ul class="list-main">
                            <li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
                            <li><i class="ti-email"></i> support@shophub.com</li>
                        </ul>
                    </div>
                    <!--/ End Top Left -->
                </div>
                <div class="col-lg-7 col-md-12 col-12">
                    <!-- Top Right -->
                    <div class="right-content">
                        <ul class="list-main">
                            <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>
                                <c:if test="<%= username.length() > 0%>">
                                <li><i class="ti-user"></i> <a href="#"><%= username%></a></li>
                                </c:if>
                                <c:if test="<%= username.length() == 0%>">
                                <!--<li><i class="ti-user"></i> <a href="#">My Account</a></li>-->
                            </c:if>

                            <c:if test="<%= username.length() > 0%>">
                                <li><i class="ti-power-off"></i><a href="GuestLoginController?view=logout">Logout</a></li>
                                    </c:if>
                                    <c:if test="<%= username.length() == 0%>">
                                <li><i class="ti-power-off"></i><a href="GuestLoginController?view=show">Login</a></li>
                                    </c:if>
                        </ul>
                    </div>
                    <!-- End Top Right -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Topbar -->
    <div class="middle-inner">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-12">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/guest/assets/images/logo.png" alt="logo"></a>
                    </div>
                    <!--/ End Logo -->
                    <!-- Search Form -->
                    <div class="search-top">
                        <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                        <!-- Search Form -->
                        <div class="search-top">
                            <form class="search-form">
                                <input type="text" placeholder="Search here..." name="search">
                                <button value="search" type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                        <!--/ End Search Form -->
                    </div>
                    <!--/ End Search Form -->
                    <div class="mobile-nav"></div>
                </div>
                <div class="col-lg-8 col-md-7 col-12">
                    <div class="search-bar-top">
                        <div class="search-bar">
                            <select>
                                <option selected="selected">All Category</option>
                                <option>watch</option>
                                <option>mobile</option>
                                <option>kid’s item</option>
                            </select>
                            <form>
                                <input name="search" placeholder="Search Products Here....." type="search">
                                <button class="btnn"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-12">
                    <div class="right-bar">
                        <!-- Search Form -->

                        <c:if test="<%= username.length() > 0%>">
                            <div class="sinlge-bar shopping">
                                <a href="GuestCartController?view=show" class="single-icon"><i class="ti-bag"></i> <span class="total-count"><%= count%></span></a>
                            </div>
                        </c:if>



                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header Inner -->
    <div class="header-inner">
        <div class="container">
            <div class="cat-nav-head">
                <div class="row">
                    <div class="col-12">
                        <div class="menu-area">
                            <!-- Main Menu -->
                            <nav class="navbar navbar-expand-lg">
                                <div class="navbar-collapse">	
                                    <div class="nav-inner">	
                                        <ul class="nav main-menu menu navbar-nav">
                                            <li class="active"><a href="${pageContext.request.contextPath}/guest/index.jsp">Home</a></li>
                                            <li><a href="${pageContext.request.contextPath}/GuestIndexController?view=showProduct">Product</a></li>												
                                            <li><a href="#">Service</a></li>
                                            <li><a href="#">Pages</a></li>									

                                            <li><a href="${pageContext.request.contextPath}/guest/contact.jsp">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                            <!--/ End Main Menu -->	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ End Header Inner -->
</header>
<!--/ End Header -->