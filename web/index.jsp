<%-- 
    Document   : index.jsp
    Created on : Oct 21, 2017, 1:30:02 PM
    Author     : ducdat
--%>

<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <%@include file="Template/head_user.jsp" %>
    <body>
        <%@include file="Template/header.jsp" %>
	<%@include file="Template/banner.jsp" %>
	<!--new-->
	<div class="new">
		<div class="container">
			<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
				<h3 class="title">New <span>Drink</span></h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
			</div>
			<div class="new-info">
                            <div class="col-md-5" data-wow-delay=".5s">
                                 <%
                            String applicationPath = request.getServletContext().getRealPath("");
                            ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_new();
                            for (ThucUong_DTO items : list_nv) {
                        %>
                                <div class="new-bottom">
                                        <h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
                                        <div class="rating">
                                            <a class="rank" href="rank.jsp">
                                                <span class="on">☆</span>
                                                <span class="on">☆</span>
                                                <span class="on">☆</span>
                                                <span class="on">☆</span>
                                                <span>☆</span>
                                            </a>
                                        </div>	
                                        <div class="size">
                                            <p>Size: </p> 
                                        </div>
                                        <div class="ofr">
                                            <p class="pric1"><del><%=items.getGiaban()%></del></p>
                                            <p>-> <span class="item_price"><%=items.getgia_discount()%></span> đồng.</p>
                                        </div>
                                        <div class="detail">
                                            <p><%=items.getnote()%></p>
                                        </div>
                                </div>
                                <div class="new-top">
                                    <a href="javascript:;" class="btn btn-info btn-lg purchase">
                                        <input type="hidden" id="cart_order" value="<%=items.getId_thucuong()%>"/>
                                        <span class="glyphicon glyphicon-shopping-cart" ></span> Purchase online
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-7 simpleCart_shelfItem wow flipInY animated" data-wow-delay=".5s">
                                <a href="single.html"><img src="images/thucuong/<%=items.geturl_image()%>" class="img-responsive" alt=""/></a>
                            </div> 
                            <% }%>
                            <div class="clearfix"> </div>
			</div>
		</div>
	</div>		
	<!--//new-->
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
				<h3 class="title">Popular<span> Products</span></h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit curabitur </p>
			</div>
			<div class="gallery-info">
                            <%
                            ArrayList<ThucUong_DTO> list_tc = new ThucUong_Model().get_pop();
                            for (ThucUong_DTO items : list_tc) {
                            %>
				<div class="col-md-3 gallery-grid wow flipInY animated" data-wow-delay="1.1s">
					<a href="products.html"><img src="images/thucuong/<%=items.geturl_image()%>" class="img-responsive" alt=""/></a>
					<div class="gallery-text simpleCart_shelfItem">
						<h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
						<p><span class="item_price"><%=items.getGiaban()%></span></p>
						<h4 class="sizes">Sizes: <a href="#"> s</a> - <a href="#">M</a> </h4>
						<ul>
                                                    <li><a class="item_add purchase" href="javascript:;">
                                                            <input type="hidden" id="cart_order" value="<%=items.getId_thucuong()%>"/>
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
	<!--//gallery-->
	<!--trend-->
	<div class="trend wow zoomIn animated" data-wow-delay=".5s">
		<div class="container">
			<div class="trend-info">
				<section class="slider grid">
					<div class="flexslider trend-slider">
						<ul class="slides">
							<li>
								<div class="col-md-5 trend-left">
									<img src="images/t1.png" alt=""/>
								</div>
								<div class="col-md-7 trend-right">
									<h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
									<h5>Flat 20% OFF</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
								</div>
								<div class="clearfix"></div>
							</li>
							<li>
								<div class="col-md-5 trend-left">
									<img src="images/t2.png" alt=""/>
								</div>
								<div class="col-md-7 trend-right">
									<h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
									<h5>Flat 20% OFF</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
								</div>
								<div class="clearfix"></div>
							</li>
							<li>
								<div class="col-md-5 trend-left">
									<img src="images/t3.png" alt=""/>
								</div>
								<div class="col-md-7 trend-right">
									<h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
									<h5>Flat 20% OFF</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
								</div>
								<div class="clearfix"></div>
							</li>
							<li>
								<div class="col-md-5 trend-left">
									<img src="images/t4.png" alt=""/>
								</div>
								<div class="col-md-7 trend-right">
									<h4>TOP 10 TRENDS <span>FOR YOU</span></h4>
									<h5>Flat 20% OFF</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tempus, justo ac volutpat vestibulum, dolor massa pharetra nunc, nec facilisis lectus nulla a tortor. Duis ultrices nunc a nisi malesuada suscipit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam eu bibendum felis. Sed viverra dapibus tincidunt.</p>
								</div>
								<div class="clearfix"></div>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!--//trend-->
	<%@include file="Template/footer.jsp" %>
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
