<%-- 
    Document   : cart
    Created on : Oct 24, 2017, 4:48:40 PM
    Author     : DatND4
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
            <jsp:param name="from" value="Order"/>
        </jsp:include>
        <!--//breadcrums-->
        <%    
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
        %>
        <div class="new">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Order <span> Information</span></h3>
                </div>
                <div class="error">
                    <% 
                    String msg = request.getParameter("Msg");
                    if("PL001".equals(msg) ){%>
                        <h3>Point không đủ. Vui lòng nạp thêm point <a href="/QLCF/Auth/buy_point.jsp">tại đây</a></h3>
                    <%}%>
                </div>
                <%if(session.getAttribute("list_cart") != null){%>
                <div class="widget-shadow">
                    <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                            <h4>Thông tin sản phẩm có trong giỏ hàng</h4>
                    </div>
                    <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                        <table>
                            <thead>
                                <tr>
                                    <th class="col center tbno">No.</th>
                                    <th class="col center tbdate">Ngày mua</th>
                                    <th class="col center tbname">Tên sản phẩm</th>
                                    <th class="col center tbprice">Số lượng</th>
                                    <th class="col center tbprice">Giá sản phẩm</th>
                                    <th class="col center tbtype">Phụ thêm</th>
                                    <th class="col center tbprice">Tùy chọn</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                ArrayList<ThucUong_DTO> list_tc = (ArrayList<ThucUong_DTO>)session.getAttribute("list_cart");
                                int tong = 0; int i = 0;
                                for (ThucUong_DTO items : list_tc) {
                                    tong = tong +items.getSoluong()*items.getGiaban();
                                    i += 1;
                            %>
                                <tr>
                                    <td class="col center tbno"><%=i%></td>
                                    <td class="col center tbdate"><%=dateFormat.format(date)%></td>
                                    <td class="col center tbname"><%=items.getTen_thucuong()%></td>
                                    <td class="col center qty">
                                        <input type="hidden" class="tcno" value="<%=items.getId_thucuong()%>" />
                                        <p class="qty_cart"><%=items.getSoluong()%></p>
                                        <input type="tel" id="qty" class="form-control qty_cart" min="1" maxlength="2" value="<%=items.getSoluong()%>" />
                                    </td>
                                    <td class="col center tbprice"><%=items.getGiaban()%></td>
                                    <td class="col center tbtype"><a class="plus1" href="javascript:;"><span class="topping glyphicon glyphicon-plus"></span></a></td>
                                    <td class="col center tbprice"><input class="btn btn-danger" value="Delete"/></td>
                                </tr> 
                            <%}%>
                            </tbody>
                        </table>
                        <div class="note_cart">
                            <p>* Nhấn vào ô số lượng để chỉnh số lượng muốn order. </p>
                            <p>* Bạn chỉ có thể order số lượng tối đa là 10 cho 1 loại thức uống. Trên 20000 điểm thành viên mức tối đa là 20 </p>
                            <p>* Dưới 20000 điểm thành viên, bạn chỉ có thể order tối đa là tối 20 cho tất cả thức uống có trong giỏ hàng</p>
                            <p>* Trên 20000 điểm thành viên, bạn chỉ có thể order tối đa là tối 50 cho tất cả thức uống có trong giỏ hàng</p>
                            <p>* Tổng giá trị đơn hàng trên 800000 đồng thì bạn sẽ cần phải thanh toán trước 50%</p>
                        </div>
                        <div class="total_price"><p>Tổng số tiền phải thanh toán là: <span class="price"><%out.print(tong);%></span> VND </p></div>
                    </div>
                </div>
                            
                <div class="user-info">
                    <div class="col-sm-4 form-inline">
                        <label>Phương thức thanh toán: </label>
                        <select name="payment" id="payment" class="form-control">
                            <option value="1">Point bonus</option>
                            <option value="2">Point</option>
                            <option value="3">Cash</option>
                            <option value="4">ATM</option>
                            <option value="5">Visa/Master card</option>
                        </select>
                    </div>
                    <!--<h5> - OR -</h5>-->
                    <div class="social-btn"><a href="confirm.jsp"><i>Confirm</i></a></div>
                    <div class="social-btn sb-del"><a href="remove_cart.jsp"><i>Remove Cart</i></a></div>
                    <div class="social-btn sb-two"><a href="/QLCF/product/menu.jsp"><i>Continue Purchase</i></a></div>
                </div>
                <%} else {%>
                <div class="widget-shadow">
                    <div class="cart-top wow fadeInUp animated" data-wow-delay=".7s">
                        <h4>Giỏ hàng của bạn đang trống</h4>
                    </div>
                </div>
                <div class="user-info">
                    <!--<h5> - OR -</h5>-->
                    <div class="social-btn"><a href="/QLCF/index.jsp"><i>Go to Homepage</i></a></div>
                    <div class="social-btn sb-two"><a href="/QLCF/product/menu.jsp"><i>Go to product page</i></a></div>
                </div>
                <%}%>
            </div>
            <div style="display: none;">
		<div id="inline1" style="width:400px;height:100px;overflow:auto;">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis mi eu elit tempor facilisis id et neque. Nulla sit amet sem sapien. Vestibulum imperdiet porta ante ac ornare. Nulla et lorem eu nibh adipiscing ultricies nec at lacus. Cras laoreet ultricies sem, at blandit mi eleifend aliquam. Nunc enim ipsum, vehicula non pretium varius, cursus ac tortor. Vivamus fringilla congue laoreet. Quisque ultrices sodales orci, quis rhoncus justo auctor in. Phasellus dui eros, bibendum eu feugiat ornare, faucibus eu mi. Nunc aliquet tempus sem, id aliquam diam varius ac. Maecenas nisl nunc, molestie vitae eleifend vel, iaculis sed magna. Aenean tempus lacus vitae orci posuere porttitor eget non felis. Donec lectus elit, aliquam nec eleifend sit amet, vestibulum sed nunc.
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
                    $("table tr td > p.qty_cart").show();
                    $("table tr td > input.qty_cart").hide();
                    $("table tr td.qty > input.qty_cart").blur(function(){
                        var qty = $(this).val();
                        $(this).parent().find("p.qty_cart").text(qty)
                        var idtu = $(this).parent().find('.tcno').val();
                        $.ajax({
                                type: "post",
                                url : '/QLCF/cart_servlet',
                                data : {
                                    idthucuong:idtu,
                                    quantity : qty
                                },
                                success : function(responseText) {
                                    $('#Cart_quantity').text(responseText);
                                }
                        });
//                        var tong = 0;
//                        $("span.price").text("33333##");
                        $("table tr td.qty > p.qty_cart").show();
                        $(this).hide();                      
                    });
                    $("table tr td.qty").click(function(){
                        $(this).find("p").hide();
                        $(this).find("input").show();
                    });
                    
		});
	</script>
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
