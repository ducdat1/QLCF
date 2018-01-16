<%-- 
    Document   : confirm
    Created on : Oct 26, 2017, 10:52:34 AM
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
        <%    
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
        %>
        <div class="new">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Cart <span> Confirm</span></h3>
                </div>
                <%if(session.getAttribute("list_cart") != null){%>
                <div class="widget-shadow">
                    <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                            <h4>Xác nhận sản phẩm có trong giỏ hàng</h4>
                    </div>
                    <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                        <table>
                            <head>
                                <tr>
                                    <th class="col center tbno">No.</th>
                                    <th class="col center tbdate">Ngày mua</th>
                                    <th class="col center tbname">Tên sản phẩm</th>
                                    <th class="col center tbprice">Số lượng</th>
                                    <th class="col center tbprice">Giá sản phẩm</th>
                                    <th class="col center tbtype">Phụ thêm</th>
                                    <th class="col center tbprice">Thanh toán</th>
                                </tr>
                            </head>
                            <body
                            <%
                                ArrayList<ThucUong_DTO> list_tc = (ArrayList<ThucUong_DTO>)session.getAttribute("list_cart");
                                double tong = 0; double n = 1; 
                                double thanhtoan = 0;int plus=0;
                                if(session.getAttribute("UID") != null){
                                    plus = Integer.parseInt((String)session.getAttribute("PLUS"));
                                }
                               
                                for (ThucUong_DTO items : list_tc) {
                                    if(items.getdiscount()== 1 && "New".equals(items.getextra1())){
                                        n = 0.85;
                                    }else{
                                        n = 1;
                                    }
                                    tong = tong +(items.getSoluong()*items.getGiaban()*n);
                                    thanhtoan = tong;
                                    if(plus > 50000){
                                        thanhtoan = thanhtoan*0.9;
                                    }else if(plus > 100000){
                                        thanhtoan = thanhtoan*0.85;
                                    }
                            %>
                            
                                <tr>
                                    <td class="col center tbno"><%=items.getId_thucuong()%></td>
                                    <td class="col center tbdate"><%=dateFormat.format(date)%></td>
                                    <td class="col center tbname"><%=items.getTen_thucuong()%></td>
                                    <td class="col center tbprice"><%=items.getSoluong()%></td>
                                    <td class="col center tbprice"><%=items.getGiaban()%></td>
                                    <td class="col center tbtype"></td>
                                    <td class="col center tbprice">Point</td>
                                </tr>
                            <%}%>
                            </body>
                        </table>
                        <div class="total_price"><p>Tổng số tiền phải thanh toán là: <span class="price"><%out.print(thanhtoan);%></span> VND </p></div>
                    </div>
                </div>
                <div class="user-info">
                    <!--<h5> - OR -</h5>-->
                    <div class="social-btn"><a href="/QLCF/Muahang_servlet?muahang=true"><i>Purchase</i></a></div>
                    <div class="social-btn sb-two"><a href="javascript:;" class="back-cart"><i>Quay lại trang giỏ hàng</i></a></div>
                </div>
                <%} else {%>
                <div class="widget-shadow">
                    <div class="cart-top wow fadeInUp animated" data-wow-delay=".7s">
                        <h4>Giỏ hàng của bạn đang trống, bạn không có gì để confirm.</h4>
                    </div>
                </div>
                <div class="user-info">
                    <!--<h5> - OR -</h5>-->
                    <div class="social-btn"><a href="/QLCF/index.jsp"><i>Go to Homepage</i></a></div>
                    <div class="social-btn sb-two"><a href="/QLCF/product/menu.jsp"><i>Go to product page</i></a></div>
                </div>
                <%}%>
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

