<%-- 
    Document   : register.jsp
    Created on : Oct 22, 2017, 1:30:02 PM
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
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Register</li>
			</ol>
		</div>
	</div>
	<!--//breadcrumbs-->
	<!--login-->
	<div class="login-page">
		<div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
			<h3 class="title">Register</h3>
		</div>
		<div class="widget-shadow">
			<div class="login-top wow fadeInUp animated" data-wow-delay=".7s">
				<h4>Already have an Account ?<a href="signin.html">  Sign In »</a> </h4>
			</div>
			<div class="login-body">
				<form class="wow fadeInUp animated" data-wow-delay=".7s" action="/QLCF/NhanVien_servlet" method="POST" role="form">
					<input type="text" placeholder="First Name" required="">
					<input type="text" placeholder="Last Name" required="">
					<input type="text" class="email" placeholder="Email Address" required="">
					<input type="password" name="password" class="lock" placeholder="Password">
					<input type="submit" name="Register" value="Register">
                                        <!--<div class="form-group">-->

<!--                            <label for="">Tên nhân viên</label>
                            <input type="text" class="form-control" name="tennv" placeholder="Tên nhân viên">
                            <label for="">Ngày sinh</label>
                            <input type="date" class="form-control" name="ngaysinh" placeholder="Tên nhân viên">
                            <label for="">Số điện thoại</label>
                            <input type="text" class="form-control" name="sdt" placeholder="Số điện thoại">
                            <label for="">Địa chỉ</label>
                            <input type="text" class="form-control" name="diachi" placeholder="Địa chỉ">
                            <label for="">Tên tài khoản</label>
                            <input type="text" class="form-control" name="taikhoan" placeholder="Tên tài khoản">
                            <label for="">Mật khẩu</label>
                            <input type="password" class="form-control" name="matkhau" placeholder="Mật khẩu">
                            <label for="">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" name="matkhau2" placeholder="Xác nhận mật khẩu">
                            <input type="hidden" class="form-control" name="capdo" value="2">
                        </div>



                        <button type="submit" class="btn btn-primary">Đăng ký</button>
                        <button type="button" class="btn btn-default"><a href="/QLCF/index.jsp">Đăng nhập</a></button>
                    -->
				</form>
			</div>
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
