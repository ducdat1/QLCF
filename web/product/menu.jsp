<%-- 
    Document   : menu
    Created on : Oct 25, 2017, 10:48:56 PM
    Author     : ducdat
--%>

<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <%@include file="../Template/head_user.jsp" %>
    <body>
        <%@include file="../Template/header.jsp" %>
	<%@include file="../Template/banner.jsp" %>
        <div class="container">
            <div class="menu">	
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Menu<span> Coffee</span></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
                </div>
                <div class="gallery-info">
                    <%
                    ArrayList<ThucUong_DTO> list_tc = new ThucUong_Model().get_all(1,2);
                    for (ThucUong_DTO items : list_tc) {
                    %>
                        <div class="col-md-3 gallery-grid wow flipInY animated" data-wow-delay="1.1s">
                                <a href="detail.jsp?id=<%=items.getId_thucuong()%>"><img src="../images/thucuong/<%=items.geturl_image()%>" class="img-responsive" alt=""/></a>
                                <div class="gallery-text simpleCart_shelfItem">
                                        <h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
                                        <p><span class="item_price"><%=items.getGiaban()%></span></p>
                                        <h4 class="sizes">Sizes: <a href="#"> s</a> - <a href="#">M</a> </h4>
                                        <ul>
                                                <li><a class="item_add purchase" href="javascript:;">
                                                            <input type="hidden" class="cart_order" value="<%=items.getId_thucuong()%>"/>
                                                            <span class="glyphicon glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                                </a></li>
                                                <li><a href="#"><span class="glyphicon glyphicon glyphicon-heart-empty" aria-hidden="true"></span></a></li>
                                        </ul>
                                </div>
                        </div>
                    <% }%>
                        <div class="clearfix"></div>
                </div>
            </div>
            <div class="menu">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Menu<span> Tea</span></h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
                </div>
                <div class="gallery-info">
                    <%
                    ArrayList<ThucUong_DTO> list_ts = new ThucUong_Model().get_all(2,2);
                    for (ThucUong_DTO items : list_ts) {
                    %>
                        <div class="col-md-3 gallery-grid wow flipInY animated" data-wow-delay="1.1s">
                                <a href="detail.jsp?id=<%=items.getId_thucuong()%>"><img src="../images/thucuong/<%=items.geturl_image()%>" class="img-responsive" alt=""/></a>
                                <div class="gallery-text simpleCart_shelfItem">
                                        <h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
                                        <p><span class="item_price"><%=items.getGiaban()%></span></p>
                                        <h4 class="sizes">Sizes: <a href="#"> s</a> - <a href="#">M</a> </h4>
                                        <ul>
                                                <li><a class="item_add purchase" href="javascript:;">
                                                            <input type="hidden" class="cart_order" value="<%=items.getId_thucuong()%>"/>
                                                            <span class="glyphicon glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                                </a></li>
                                                <li><a href="#"><span class="glyphicon glyphicon glyphicon-heart-empty" aria-hidden="true"></span></a></li>
                                        </ul>
                                </div>
                        </div>
                    <% }%>
                        <div class="clearfix"></div>
                </div>
            </div>
            <div class="gallery">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Others</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
                </div>
                <div class="gallery-info">
                    <%
                    ArrayList<ThucUong_DTO> list_to = new ThucUong_Model().get_all(4,2);
                    for (ThucUong_DTO items : list_to) {
                    %>
                        <div class="col-md-3 gallery-grid wow flipInY animated" data-wow-delay="1.1s">
                                <a href="detail.jsp?id=<%=items.getId_thucuong()%>"><img src="../images/thucuong/<%=items.geturl_image()%>" class="img-responsive" alt=""/></a>
                                <div class="gallery-text simpleCart_shelfItem">
                                        <h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
                                        <p><span class="item_price"><%=items.getGiaban()%></span></p>
                                        <h4 class="sizes">Sizes: <a href="#"> s</a> - <a href="#">M</a> </h4>
                                        <ul>
                                                <li><a class="item_add purchase" href="javascript:;">
                                                            <input type="hidden" class="cart_order" value="<%=items.getId_thucuong()%>"/>
                                                            <span class="glyphicon glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                                                </a></li>
                                                <li><a href="#"><span class="glyphicon glyphicon glyphicon-heart-empty" aria-hidden="true"></span></a></li>
                                        </ul>
                                </div>
                        </div>
                    <% }%>
                        <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <%@include file="../Template/footer.jsp" %>
	<!--search jQuery-->
	<script src="/QLCF/assets/js/main.js"></script>
	<!--//search jQuery-->
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {
		
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<script type="text/javascript" src="/QLCF/assets/js/cart.js"></script>
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
