<%-- 
Document   : contact
Created on : Apr 25, 2021, 3:29:38 PM
Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="java.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
    </head>


    <body class="js">

        <%@include file="header.jsp" %>


        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="index.html">Home<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="blog-single.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Contact -->
        <section id="contact-us" class="contact-us section">
            <div class="container">
                <div class="contact-head">
                    <div class="row">
                        <div class="col-lg-8 col-12">
                            <div class="form-main">
                                <div class="title">
                                    <h4>Get in touch</h4>
                                    <h3>Write us a message</h3>
                                </div>
                                <form class="form" method="post" action="GuestContactController?view=process">
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Your Email<span>*</span></label>
                                                <input name="email" type="email" placeholder="" required value="<%= user.getEmail()%>">
                                            </div>	
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group">
                                                <label>Your Subjects<span>*</span></label>
                                                <input name="subject" type="text" placeholder="" required>
                                            </div>
                                        </div>


                                        <div class="col-12">
                                            <div class="form-group message">
                                                <label>your message<span>*</span></label>
                                                <textarea name="message" placeholder="" minlength="10" required></textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group button">
                                                <button type="submit" class="btn ">Send Message</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="single-head">
                                <div class="single-info">
                                    <i class="fa fa-phone"></i>
                                    <h4 class="title">Call us Now:</h4>
                                    <ul>
                                        <li>+123 456-789-1120</li>
                                    </ul>
                                </div>
                                <div class="single-info">
                                    <i class="fa fa-envelope-open"></i>
                                    <h4 class="title">Email:</h4>
                                    <ul>
                                        <li><a href="mailto:info@yourwebsite.com">justbuy@gmail.com</a></li>
                                    </ul>
                                </div>
                                <div class="single-info">
                                    <i class="fa fa-location-arrow"></i>
                                    <h4 class="title">Our Address:</h4>
                                    <ul>
                                        <li>590 Cach Mang Thang Tam 11, District 3, Ho Chi Minh City
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Contact -->

        <%@include file="footer.jsp" %>

    </body>
</html>
