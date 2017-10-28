<%-- 
    Document   : detail_user
    Created on : Oct 23, 2017, 1:04:42 AM
    Author     : ducdat
--%>

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
            <jsp:param name="from" value="Cart"/>
        </jsp:include>
        <!--//breadcrums-->
        <!--detail-->
        <div class="new" id="personal">
                <div class="container">
                        <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                                <h3 class="title">Information's <span> Customer</span></h3>
                        </div>
                        <ul class="nav nav-tabs" data-wow-delay=".6s">
                          <li class="active"><a href="#">Personal</a></li>
                          <li class="tb_history"><a href="#">History</a></li>
                        </ul>
                        <div class="widget-shadow">
                                <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                                        <h4>Thông tin cá nhân của khách hàng</h4>
                                </div>
                                <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                                    <div class="info_left">
                                            <label for="Firstname" class="info_label">Firstname</label>
                                            <label for="Lastname" class="info_label">Lastname</label>
                                            <label for="Account" class="info_label">Account</label>
                                            <label for="Password" class="info_label">Password</label>
                                            <label for="Email" class="info_label">Email</label>
                                            <label for="Telephone" class="info_label">Telephone</label>
                                            <label for="Address" class="info_label">Address</label>
                                            <label for="Plus" class="info_label">Plus</label>
                                            <label for="Point" class="info_label">Point</label>    
                                    </div>
                                    <div class="info_right">
                                            <label for="Firstname" class="info_label">Firstname</label>
                                            <label for="Lastname" class="info_label">Lastname</label>
                                            <label for="Account" class="info_label">Account</label>
                                            <label for="Password" class="info_label">Password</label>
                                            <label for="Email" class="info_label">Email</label>
                                            <label for="Telephone" class="info_label">Telephone</label>
                                            <label for="Address" class="info_label">Address</label>
                                            <label for="Plus" class="info_label">Plus</label>
                                            <label for="Point" class="info_label">Point</label>   
                                    </div>
                                </div>
                        </div>
                        <div class="user-info">
                                <!--<h5> - OR -</h5>-->
                                <div class="social-btn"><a href="#"><i>Update</i></a></div>
                                <div class="social-btn sb-two"><a href="#"><i>Back to main page</i></a></div>
                        </div>

                </div>
        </div>
        <div class="new" id="history">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Purchase <span> History</span></h3>
                </div>
                <ul class="nav nav-tabs" data-wow-delay=".6s">
                    <li class="tb_personal"><a href="#">Personal</a></li>
                    <li class="active"  ><a href="#">History</a></li>
                 </ul>
                <div class="widget-shadow">
                        <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                                <h4>Thông tin sản phẩm đã từng mua</h4>
                        </div>
                        <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                            <table>
                                <head>
                                    <tr>
                                        <th class="col center tbno">No.</th>
                                        <th class="col center tbhd">Mã hoá đơn</th>
                                        <th class="col center tbdate">Ngày mua</th>
                                        <th class="col center tbname">Tên sản phẩm</th>
                                        <th class="col center tbprice">Gía sản phẩm</th>
                                        <th class="col center tbtype">Phương thức thanh toán</th>
                                    </tr>
                                </head>
                                <body
                                    <tr>
                                        <td class="col center tbno">No.</td>
                                        <td class="col center tbhd">Mã hoá đơn</td>
                                        <td class="col center tbdate">Ngày mua</td>
                                        <td class="col center tbname">Tên sản phẩm</td>
                                        <td class="col center tbprice">Gía sản phẩm</td>
                                        <td class="col center tbtype">Phương thức thanh toán</td>
                                    </tr>
                                </body>
                            </table>
                        </div>
                </div>
                <div class="user-info"></div>
            </div>
        </div>
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
