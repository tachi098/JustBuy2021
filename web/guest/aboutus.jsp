
<%@include file="java.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About us | JustBuy</title>
        <style>

            .social-link {
                width: 30px;
                height: 30px;
                border: 1px solid #ddd;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #666;
                border-radius: 50%;
                transition: all 0.3s;
                font-size: 0.9rem;
            }

            .social-link:hover,
            .social-link:focus {
                background: #ddd;
                text-decoration: none;
                color: #555;
            }
        </style>
    </head>
    <body class="js">

        <%@include file="header.jsp" %>

        <div class="container-fluid">
            <div class="bg-light">
                <div class="container py-5">
                    <div class="row h-100 align-items-center py-5">
                        <div class="col-lg-6">
                            <h1 class="display-4">About us page</h1>
                            <p class="lead text-muted mb-0">Just Buy - Save your time from shopping</p>
                        </div>
                        <div class="col-lg-6 d-none d-lg-block"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/illus_kftyh4.png" alt="" class="img-fluid"></div>
                    </div>
                </div>
            </div>

            <div class="bg-white py-5">
                <div class="container py-5">
                    <div class="row align-items-center mb-5">
                        <div class="col-lg-6 order-2 order-lg-1"><i class="fa fa-bar-chart fa-2x mb-3 text-primary"></i>
                            <h2 class="font-weight-light">Customer support</h2>
                            <p class="font-italic text-muted mb-4">We provide 24/7 customer support.</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                        </div>
                        <div class="col-lg-5 px-5 mx-auto order-1 order-lg-2"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834139/img-1_e25nvh.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-lg-5 px-5 mx-auto"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834136/img-2_vdgqgn.jpg" alt="" class="img-fluid mb-4 mb-lg-0"></div>
                        <div class="col-lg-6"><i class="fa fa-leaf fa-2x mb-3 text-primary"></i>
                            <h2 class="font-weight-light">Competitive price</h2>
                            <p class="font-italic text-muted mb-4">We update product everyday with competitive price with lots of discount.</p><a href="#" class="btn btn-light px-5 rounded-pill shadow-sm">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light py-5">
                <div class="container py-5">
                    <div class="row mb-4">
                        <div class="col-lg-5">
                            <h2 class="display-4 font-weight-light">Our team</h2>
                            
                        </div>
                    </div>

                    <div class="row text-center">
                        <!-- Team item-->
                        <div class="col-xl-3 col-sm-6 mb-5">
                            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834132/avatar-4_ozhrib.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                <h5 class="mb-0">PHAM QUANG HUY</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
                                <ul class="social mb-0 list-inline mt-3">
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End-->

                        <!-- Team item-->
                        <div class="col-xl-3 col-sm-6 mb-5">
                            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834130/avatar-3_hzlize.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                <h5 class="mb-0">LE HOANG ANH TU</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
                                <ul class="social mb-0 list-inline mt-3">
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End-->

                        <!-- Team item-->
                        <div class="col-xl-3 col-sm-6 mb-5">
                            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-2_f8dowd.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                <h5 class="mb-0">PHAM XUAN HOAI</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
                                <ul class="social mb-0 list-inline mt-3">
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End-->

                        <!-- Team item-->
                        <div class="col-xl-3 col-sm-6 mb-5">
                            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-1_s02nlg.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                <h5 class="mb-0">LU HAN LUAN</h5><span class="small text-uppercase text-muted">CEO - Founder</span>
                                <ul class="social mb-0 list-inline mt-3">
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-facebook-f"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-twitter"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-instagram"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="social-link"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End-->

                    </div>
                </div>
            </div>
        </div>

        <!--/ End Contact -->        
        <%@include file="footer.jsp" %>
    </body>
</html>
