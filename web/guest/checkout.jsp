<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="java.jsp" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
        
        <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    </head>
    <body class="js">

        <!-- Preloader -->
        <!--        <div class="preloader">
                    <div class="preloader-inner">
                        <div class="preloader-icon">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                </div>-->
        <!-- End Preloader -->


        <!-- Breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="bread-inner">
                            <ul class="bread-list">
                                <li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="blog-single.html">Checkout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Start Checkout -->
        <section class="shop checkout section">
            <div class="container">
                <div class="row"> 
                    <div class="col-lg-8 col-12">
                        <div class="checkout-form">
                            <h2>Make Your Checkout Here</h2>
                            <p>Please register in order to checkout more quickly</p>
                            <!-- Form -->
                            <form class="form" method="post" action="#">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" value="${users.name}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" value="${users.email}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="text" value="${users.phone}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>City</label>
                                            <input type="text" value="${users.address.city}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>State</label>
                                            <input type="text" value="${users.address.state}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>ZipCode</label>
                                            <input type="text" value="${users.address.zipcode}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Address 1</label>
                                            <input type="text" value="${users.address.line1}" disabled required="required">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>Address 2</label>
                                            <input type="text" value="${users.address.line2}" disabled required="required">
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--/ End Form -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="order-details">
                            <!-- Order Widget -->
                            <div class="single-widget">
                                <h2>CART  TOTALS</h2>
                                <div class="content">
                                    <ul>
                                        <li class="last">Total<span><fmt:formatNumber value="${subtotal}" type="currency" /></span></li>
                                    </ul>
                                </div>
                            </div>
                            <!--/ End Order Widget -->
                            <!-- Order Widget -->

                            <!--/ End Order Widget -->
                            <!-- Button Widget -->
                            <div class="single-widget get-button">
                                <div class="content">
                                    <div class="button">
                                        <form action="GuestCartController?view=processCheckout" method="post">
                                            <input type="hidden" name="billId" value="${billId}" />
                                            <button class="btn">proceed to checkout</button>
                                        </form>
                                            
                                            Or
                                            
                                        <div id="paypal-button-container"></div>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Button Widget -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--/ End Checkout -->

            <script>

                // Render the PayPal button

                paypal.Button.render({

                    // Set your environment

                    env: 'sandbox', // sandbox | production

                    // Specify the style of the button

                    style: {
                        label: 'paypal',
                        size:  'medium',    // small | medium | large | responsive
                        shape: 'rect',     // pill | rect
                        color: 'blue',     // gold | blue | silver | black
                        tagline: false    
                    },

                    // PayPal Client IDs - replace with your own
                    // Create a PayPal app: https://developer.paypal.com/developer/applications/create

                    client: {
                        sandbox:    'AeziYRAGktWGm1vfRMAo7aWJvO6oZ79-TQC-1kU24GUjza7ADyE2cyrVOl5mBSwDbLV4zcCOhCPpQHnK',
                        production: '<insert production client id>'
                    },

                    payment: function(data, actions) {
                        return actions.payment.create({
                            payment: {
                                transactions: [
                                    {
                                        amount: { total: ${subtotal}, currency: 'USD' }
                                    }
                                ]
                            }
                        });
                    },

                    onAuthorize: function(data, actions) {
                        return actions.payment.execute().then(function() {
                            window.location = 'GuestCartController?view=processCheckout&billId=${billId}';
                        });
                    }

                }, '#paypal-button-container');

            </script>
    </body>
</html>

<%@include file="footer.jsp" %>
