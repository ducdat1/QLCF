<%-- 
    Document   : detail
    Created on : Oct 25, 2017, 10:48:43 PM
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
	<!--breadcrums-->
        <jsp:include page='../Template/breadcrums.jsp'>
            <jsp:param name="from" value="Detail"/>
        </jsp:include>
        <!--//breadcrums-->
        <div class="container">
            <div class="gallery">
                <% 
                    String result = request.getParameter("id");
                    ArrayList<ThucUong_DTO> tc = new ThucUong_Model().get_by_id(result);
                    for(ThucUong_DTO items : tc){
//                        out.println(items.getTen_thucuong());
//                        out.println(items.getGiaban());
//                        out.println(items.getRank());
//                        out.println(items.geturl_image());
//                        out.println(items.getdiscount());
//                        out.println(items.getsize());
//                        out.println(items.getextra1());
                        int type = Integer.parseInt(items.getextra2());

                %>
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Menu<span> <%if(type == 1){%>Coffee<%}else if(type == 2){%>Tea<%}%></span></h3>
                        <p>Mang đến cảm giác hài lòng với những thức uống và phong cách phục vụ tốt nhất</p>
                </div>
                <div class="gallery-info">
                    
                    <div class=" col-md-7 detail-img">    
                        <a href="detail.jsp?id=<%=items.getId_thucuong()%>"><img src="../images/thucuong/<%=items.geturl_image()%>" class="img-responsive wow flipInY animated" alt=""data-wow-delay="1.1s" /></a>
                    </div>
                    <div class=" col-md-5 detail-text">
                            <h5><a class="name" href="single.html"><%=items.getTen_thucuong()%></a></h5>
                            <% if("1".equals(items.getdiscount())){%>
                            <div class="ofr">
                                <p class="pric1"><del><%=items.getGiaban()%></del></p>
                            </div>
                            
                            <p>-> <span class="item_price"><%=items.getgia_discount()%></span> đồng.</p>
                            <%}else{%>
                                <p><span class="item_price"><%=items.getGiaban()%></span> đồng.</p>
                            <%}%>
                                                      
                            <h4 class="sizes">Sizes: <a href="#"> S</a> - <a href="#">M</a> </h4>                                   
                            <h3><%=items.getnote()%></h3>
                            <ul>
                                <li><a href="#"><span class="glyphicon glyphicon glyphicon-heart-empty" aria-hidden="true"></span> Yêu thích</a></li>
                                <li><a class="item_add purchase" href="javascript:;">
                                        <input type="hidden" class="cart_order" value="<%=items.getId_thucuong()%>"/>
                                        <span class="glyphicon glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Thêm vào giỏ hàng
                                </a></li>
                            </ul>
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
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
