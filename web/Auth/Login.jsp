<%-- 
    Document   : Login.jsp
    Created on : Oct 21, 2017, 10:23:42 PM
    Author     : ducdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Template/head_user.jsp" %>
    <body>
        <%@include file="../Template/header.jsp" %>
        <!--breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow fadeInUp" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Sign In</li>
			</ol>
		</div>
	</div>
	<!--//breadcrumbs-->
	<!--login-->
	<div class="login-page">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">Login<span> Zen's coffee</span></h3>
		</div>
		<div class="widget-shadow">
			<div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
				<h4>Welcome back to Zen's coffee ! <br> Not a Member? <a href="register.jsp">  Register Now »</a> </h4>
			</div>
			<div class="login-body wow fadeInUp animated" data-wow-delay=".7s">
				<form action="/QLCF/Nguoidung_servlet" method="POST">
                                    <input type="hidden" name="login" value="login"/>
                                    <input type="text" class="user" name="username" placeholder="Enter your email or username" required="">
                                    <input type="password" name="password" class="lock" placeholder="Password">
                                    <input type="submit" name="Sign In" value="Sign In">
                                    <div class="forgot-grid">
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Remember me</label>
                                            <div class="forgot">
                                                    <a href="#">Forgot Password?</a>
                                            </div>
                                            <div class="clearfix"> </div>
                                    </div>
                                        
				</form>
			</div>
		</div>
		<div class="login-page-bottom">
			<h5> - OR -</h5>
			<div class="social-btn"><a href="#"><i>Sign In with Facebook</i></a></div>
			<div class="social-btn sb-two"><a href="#"><i>Sign In with Twitter</i></a></div>
		</div>
	</div>
	<!--//login-->
        
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
