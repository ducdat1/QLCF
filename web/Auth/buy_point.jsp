<%-- 
    Document   : buy_point
    Created on : Jan 9, 2018, 12:33:37 AM
    Author     : ducdat
--%>

<%@page import = "java.io.*,java.util.*" %>
<%@page import="Model.Nguoidung_Model"%>
<%@page import="DTO.NguoiDung_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Template/head_user.jsp" %>
    <body>
        <!--header-->
        <%@include file="../Template/header.jsp" %>
        <!--//header-->
        <!--breadcrums-->
        <jsp:include page='../Template/breadcrums.jsp'>
            <jsp:param name="from" value="Detail"/>
        </jsp:include>
        <!--//breadcrums-->
        <!--detail-->
        <%
            if(session.getAttribute("UID") != null){                       
        %>
        <div class="login-page">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">Add Point</h3>
		</div>
		<div class="widget-shadow">
<!--			<div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
				<h4>Already have an Account ?<a href="/QLCF/Auth/Login.jsp">  Sign In »</a> </h4>
			</div>-->
			<div class="login-body wow fadeInUp animated" data-wow-delay=".7s">
				<form class="wow fadeInUp animated" data-wow-delay=".7s" action="/QLCF/Nguoidung_servlet" method="GET" role="form">
                                    <select name="point">
                                        <option selected>Hãy chọn giá trị point muốn mua</option>
                                        <option value="1">50000</option>
                                        <option value="2">100000</option>
                                        <option value="3">200000</option>
                                        <option value="4">300000</option>
                                        <option value="5">500000</option>
                                        <option value="6">1000000</option>
                                        <option value="7">2000000</option>
                                    </select>
                                    <input type="submit" name="btnadd" value="Buy">   
				</form>
			</div>
		</div>
                <div class="login-page-bottom">
			<h5> - OR -</h5>
			<div class="social-btn"><a href="/QLCF/index.jsp"><i>Homepage</i></a></div>
			<div class="social-btn sb-two"><a href="/QLCF/Auth/Login.jsp"><i>Sign In</i></a></div>
		</div>
	</div>  
        <%}else{%>
            <script>window.location.href = "/QLCF/Auth/Login.jsp";</script>
        <%}%>
        
	<!--//detail-->
        <!--footer-->
        <%@include file="../Template/footer.jsp" %>
        <!--//footer-->
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
