<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="java.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
                                <li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
                                <li class="active"><a href="blog-single.html">Cart</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- Shopping Cart -->
        <div class="shopping-cart section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        
                        <h2 style="text-align: center; margin-bottom: 10px; color: red;">
                            <%
                                if(session.getAttribute("payment") != null) {
                            %>
                                    ${sessionScope.payment}
                            <%
                                    session.removeAttribute("payment");
                                }
                            %>
                        </h2>
                        
                        <%
                            int countCart = (int)session.getAttribute("countCart");
                            if(countCart > 0) {
                        %>
                        
                        <!-- Shopping Summery -->
                        <fmt:setLocale value="en_US" />
                        <table class="table shopping-summery">
                            <thead>
                                <tr class="main-hading">
                                    <th>PRODUCT</th>
                                    <th>NAME</th>
                                    <th class="text-center">UNIT PRICE</th>
                                    <th class="text-center">QUANTITY</th>
                                    <th class="text-center">DISCOUNT</th>
                                    <th class="text-center">TOTAL</th> 
                                    <th class="text-center"><i class="ti-trash remove-icon"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="billDetail" items="${billDetail}">
                                    <tr>
                                        <td class="image" data-title="No"><img src="${billDetail.productId.image}" alt="#"></td>
                                        <td class="product-des" data-title="Description">
                                            <p class="product-name"><a href="#">${billDetail.productId.name}</a></p>
                                            <p class="product-des">${billDetail.productId.description}</p>
                                        </td>
                                        <td class="price" data-title="Price"><span><fmt:formatNumber value="${billDetail.productId.price}" type="currency" /></span></td>
                                        <td class="qty" data-title="Qty"><!-- Input Order -->
                                            <div class="input-group" style="width: 150px;">
                                                <form action="GuestCartController?view=change" class="d-flex" method="post">
                                                    <input type="hidden" name="productId" value="${billDetail.productId.id}" />
                                                    <input type="hidden" name="billDetailId" value="${billDetail.id}" />
                                                    <input type="number" name="quantity" style="padding: 0;" class="input-number"  data-min="1" data-max="100" min="1" max="100" value="${billDetail.quantity}">
                                                    &nbsp;
                                                    <input type="submit" value="Change"  />
                                                </form>
                                                <span style="color: red; font-size: small;">
                                                    <%
                                                        if(session.getAttribute("errorQuantity") != null) {
                                                    %>
                                                            ${sessionScope.errorQuantity}
                                                    <%
                                                            session.removeAttribute("errorQuantity");
                                                        }
                                                    %>
                                                </span>
                                            </div>
                                            <!--/ End Input Order -->
                                        </td>
                                        <td class="discount" data-title="Discount"><span>${billDetail.discount * 100}%</span></td>
                                        <td class="total-amount" data-title="Total"><span></span><fmt:formatNumber value="${billDetail.productId.price * (1 - billDetail.discount) * billDetail.quantity}" type="currency" /></td>
                                        <td class="action" data-title="Remove">
                                            <form action="GuestCartController?view=remove" method="post">
                                                <input type="hidden" value="${billDetail.id}" name="billDetailId" />
                                                <input type="hidden" value="${billDetail.billId.id}" name="billId" />
                                                <input type="hidden" value="${billDetail.productId.id}" name="productId" />
                                                <button type="submit"><i class="ti-trash remove-icon"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!--/ End Shopping Summery -->
                        
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <!-- Total Amount -->
                        <div class="total-amount">
                            <div class="row">
                                <div class="col-lg-8 col-md-5 col-12">
                                    <div class="left">

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-7 col-12">
                                    <div class="right">
                                        <c:if test="${subTotal > 0}">
                                            <ul>
                                                <li>You Pay<span>
                                                        <fmt:formatNumber value="${subTotal}" type="currency" />
                                                    </span></li>
                                            </ul>
                                        </c:if>
                                        <div class="button5">
                                            <c:if test="${subTotal > 0}">
                                                <form action="GuestCartController?view=checkout" method="post">
                                                    <input type="hidden" name="billId" value="${bill.id}" />
                                                    <input type="hidden" name="subtotal" value="${subTotal}" />
                                                    <button href="GuestCartController?view=checkout" class="btn">Checkout</button>
                                                </form>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}" class="btn">Continue shopping</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ End Total Amount -->
                    </div>
                </div>
            </div>
        </div>
        <!--/ End Shopping Cart -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row no-gutters">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <!-- Product Slider -->
                                <div class="product-gallery">
                                    <div class="quickview-slider-active">
                                        <div class="single-slider">
                                            <img src="images/modal1.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal2.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal3.jpg" alt="#">
                                        </div>
                                        <div class="single-slider">
                                            <img src="images/modal4.jpg" alt="#">
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product slider -->
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="quickview-content">
                                    <h2>Flared Shift Dress</h2>
                                    <div class="quickview-ratting-review">
                                        <div class="quickview-ratting-wrap">
                                            <div class="quickview-ratting">
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="yellow fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <a href="#"> (1 customer review)</a>
                                        </div>
                                        <div class="quickview-stock">
                                            <span><i class="fa fa-check-circle-o"></i> in stock</span>
                                        </div>
                                    </div>
                                    <h3>$29.00</h3>
                                    <div class="quickview-peragraph">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam.</p>
                                    </div>
                                    <div class="size">
                                        <div class="row">
                                            <div class="col-lg-6 col-12">
                                                <h5 class="title">Size</h5>
                                                <select>
                                                    <option selected="selected">s</option>
                                                    <option>m</option>
                                                    <option>l</option>
                                                    <option>xl</option>
                                                </select>
                                            </div>
                                            <div class="col-lg-6 col-12">
                                                <h5 class="title">Color</h5>
                                                <select>
                                                    <option selected="selected">orange</option>
                                                    <option>purple</option>
                                                    <option>black</option>
                                                    <option>pink</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="quantity">
                                        <!-- Input Order -->
                                        <div class="input-group">
                                            <div class="button minus">
                                                <button type="button" class="btn btn-primary btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                    <i class="ti-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" name="quant[1]" class="input-number"  data-min="1" data-max="1000" value="1">
                                            <div class="button plus">
                                                <button type="button" class="btn btn-primary btn-number" data-type="plus" data-field="quant[1]">
                                                    <i class="ti-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!--/ End Input Order -->
                                    </div>
                                    <div class="add-to-cart">
                                        <a href="#" class="btn">Add to cart</a>
                                        <a href="#" class="btn min"><i class="ti-heart"></i></a>
                                        <a href="#" class="btn min"><i class="fa fa-compress"></i></a>
                                    </div>
                                    <div class="default-social">
                                        <h4 class="share-now">Share:</h4>
                                        <ul>
                                            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a class="youtube" href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                            <li><a class="dribbble" href="#"><i class="fa fa-google-plus"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal end -->

        <%@include file="footer.jsp" %>
    </body>
</html>
