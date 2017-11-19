<%-- 
    Document   : buy_thanks
    Created on : Nov 19, 2017, 11:21:01 PM
    Author     : ducdat
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../Template/head_user.jsp" %>
    <body>
        <%@include file="../Template/header.jsp" %>
	<!--breadcrums-->
        <jsp:include page='../Template/breadcrums.jsp'>
            <jsp:param name="from" value="Order Confirm"/>
        </jsp:include>
        <!--//breadcrums-->
        <div>
            <h2>Cảm ơn đã mua hàng tại cửa hàng của chúng tôi.</h2>
            <h2>Xin để lại địa chỉ nếu địa chỉ nơi nhận khác với địa chỉ đăng ký.</h2>
            <h2>Nếu bạn không có thay đổi thì đơn hàng sẽ được giao đến địa chỉ nơi ở được đăng ký trong phần thông tin người dùng.</h2>
            <h2>Xem thông tin người dùng <a href="#">tại đây</a></h2>
            <form>
                
            </form>
            <span>Lưu ý: trường hợp người dùng đặt hàng nhưng không nhận hàng thì sẽ bị hạ điểm VIP tương ứng với 15000 điểm</span>
            <span>Lưu ý: Với các hóa đơn trên 150.000 VND cần phải có điểm VIP lớn hơn 50000 điểm để được đặt hàng thanh toán khi nhận hàng</span>
        </div>
        <div class="user-info">
            <div class="social-btn"><a href="/QLCF/index.jsp"><i>Go to Homepage</i></a></div>
            <div class="social-btn sb-two"><a href="/QLCF/product/menu.jsp"><i>Go to product page</i></a></div>
        </div>
        <%@include file="../Template/footer.jsp" %>
        <!--//footer-->
	<!--search jQuery-->
	<script src="/QLCF/assets/js/main.js"></script>
	<!--//search jQuery-->
	<!--smooth-scrolling-of-move-up-->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });	
		});
	</script>
	
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
