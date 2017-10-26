<%-- 
    Document   : confirm
    Created on : Oct 26, 2017, 10:52:34 AM
    Author     : ducdat
--%>

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
            <jsp:param name="from" value="Cart Confirm"/>
        </jsp:include>
        <!--//breadcrums-->
        <div class="new">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Cart <span> Information</span></h3>
                </div>
                <div class="widget-shadow">
                    <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                            <h4>Thông tin sản phẩm có trong giỏ hàng</h4>
                    </div>
                    <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                        <table>
                            <head>
                                <tr>
                                    <th class="col center tbno">No.</th>
                                    <th class="col center tbdate">Ngày mua</th>
                                    <th class="col center tbname">Tên sản phẩm</th>
                                    <th class="col center tbprice">Giá sản phẩm</th>
                                    <th class="col center tbtype">Phương thức thanh toán</th>
                                </tr>
                            </head>
                            <body
                            <%
                                ArrayList<ThucUong_DTO> list_tc = (ArrayList<ThucUong_DTO>)session.getAttribute("list_cart");
                                for (ThucUong_DTO items : list_tc) {
                            %>
                            
                                <tr>
                                    <td class="col center tbno"></td>
                                    <td class="col center tbdate">Ngày mua</td>
                                    <td class="col center tbname"><%=items.getTen_thucuong()%></td>
                                    <td class="col center tbprice"><%=items.getGiaban()%></td>
                                    <td class="col center tbtype">
                                        <select name="payment" id="payment">
                                            <option value="1">Point bonus</option>
                                            <option value="2">Point</option>
                                            <option value="3">Cash</option>
                                            <option value="4">ATM</option>
                                            <option value="5">Visa/Master card</option>
                                        </select>
                                    </td>
                                </tr>
                            <%}%>
                            </body>
                        </table>
                    </div>
                </div>
                <div class="user-info">
                    <!--<h5> - OR -</h5>-->
                    <div class="social-btn"><a href="#"><i>Mua hàng</i></a></div>
                    <div class="social-btn sb-two"><a href="#"><i>Xoá giỏ hàng</i></a></div>
                    <div class="social-btn sb-two"><a href="#"><i>Go to product page</i></a></div>
                </div>
            </div>
        </div>
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

