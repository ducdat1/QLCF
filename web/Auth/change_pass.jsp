<%-- 
    Document   : forget_pass
    Created on : Oct 29, 2017, 1:30:02 PM
    Author     : ducdat
--%>

<%@page import="DTO.NguoiDung_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
    <%@include file="../Template/head_user.jsp" %>
    <body>
        <%@include file="../Template/header.jsp" %>
        <!--breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="/QLCF/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Register</li>
			</ol>
		</div>
	</div>
	<!--//breadcrumbs-->
	<!--login-->
	<div class="login-page">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">Change password</h3>
		</div>
                <div class="error">
                    <% 
                    String msg = (String)session.getAttribute("FLG");
                    if("chgfail001".equals(msg) ){%>
                        <h3>Mật khẩu mới và xác nhận không giống nhau</h3>
                    <%}else if("chgfail002".equals(msg) ){%>
                        <h3>Không thể đổi mật khẩu. Thử lại sau.</h3>
                    <%}else if("chgfail003".equals(msg) ){%>
                        <h3>Mật khẩu hiện tại nhập sai. Vui lòng thử lại</h3>
                    <%}else if("chgfail004".equals(msg) ){%>
                        <h3>Có lỗi đã xảy ra. Vui lòng thử lại sau</h3>
                    <%}%>
                </div>
		<div class="widget-shadow">
			<div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
				<h4>Already have an Account ?<a href="/QLCF/Auth/Login.jsp">  Sign In »</a> </h4>
			</div>
                        <% 
//                            NguoiDung_DTO ans = (NguoiDung_DTO)session.getAttribute("ANS");
                        %>
			<div class="login-body">
				<form class="wow fadeInUp animated" data-wow-delay=".7s" action="/QLCF/Nguoidung_servlet" method="POST" role="form">
					<input type="password" name="Newpass" class="lock" placeholder="Old Password">
                                        <input type="password" name="Oldpass" class="lock" placeholder="New Password">
					<input type="password" name="Confpass" class="lock" placeholder="Confirm Password">
					<input type="submit" name="change" value="Change">   
				</form>
			</div>
		</div>
                <div class="login-page-bottom">
			<h5> - OR -</h5>
			<div class="social-btn"><a href="/QLCF/index.jsp"><i>Homepage</i></a></div>
			<div class="social-btn sb-two"><a href="/QLCF/Auth/Login.jsp"><i>Sign In</i></a></div>
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
