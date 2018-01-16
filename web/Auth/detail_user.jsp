<%-- 
    Document   : detail_user
    Created on : Oct 23, 2017, 1:04:42 AM
    Author     : ducdat
--%>

<%@page import="java.sql.Array"%>
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
        <div class="new" id="personal">
                <div class="container">
                    <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                            <h3 class="title">Information's <span> Customer</span></h3>
                    </div>
                    <%
                    String msg = (String)session.getAttribute("FLG");
                    if("success002".equals(msg) ){%>
                        <h3>Cập nhật thành công</h3>
                    <%}else if("fail002".equals(msg) ){%>
                        <h3>Có lỗi xảy ra trong quá trình cập nhật. Thử lại sau</h3>
                    <%}else if("chgsuccess001".equals(msg) ){%>
                        <h3>Cập nhật password thành công</h3>
                    <%}%>
                    <ul class="nav nav-tabs" data-wow-delay=".6s">
                      <li class="active"><a href="javascript:;">Personal</a></li>
                      <li class="tb_history"><a href="javascript:;">History</a></li>
                    </ul>
                    <div class="widget-shadow">
                        <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                                <h4>Thông tin cá nhân của khách hàng</h4>
                        </div>
                        <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                            <%
                                String idusername = String.valueOf(session.getAttribute("UID"));
                                NguoiDung_DTO ngdung = new Nguoidung_Model().get_info(idusername);
                            %>
                            <form class="user_update" method="POST" action="/QLCF/Nguoidung_servlet">
                                <table>
                                    <tr>
                                        <th class="info_left"><label for="Firstname" class="info_label">Firstname</label></th>
                                        <td class="info_right"><input type="text" name="firstname" class="info_label" value="<%=ngdung.getFirstname()%>" /></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Lastname" class="info_label">Lastname</label></th>
                                        <td class="info_right"><input type="text" name="lastname"  class="info_label" value="<%=ngdung.getLastname()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Account" class="info_label">Account</label></th>
                                        <td class="info_right"><label for="Account" class="info_label"><%=ngdung.getCus_account()%></label></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Email" class="info_label">Email</label></th>
                                        <td class="info_right"><input type="email" name="email" class="info_label" value="<%=ngdung.getCus_email()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Telephone" class="info_label">Telephone</label></th>
                                        <td class="info_right"><input type="tel" name="tel" class="info_label" value="<%=ngdung.getCus_phone()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Address" class="info_label">Address</label></th>
                                        <td class="info_right"><input type="text" name="addr" class="info_label" value="<%=ngdung.getCus_address()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Plus" class="info_label">Plus</label></th>
                                        <td class="info_right"><label for="Plus" class="info_label"><%=ngdung.getPlus()%></label></td>
                                    </tr>
                                    <tr>
                                        <th class="info_left"><label for="Point" class="info_label">Point</label></th>
                                        <td class="info_right"><label for="Point" class="info_label"><%=ngdung.getPoint_sum()%></label></td>
                                    </tr>
                                </table>
                                <input type="hidden" name="form" value="update">
                            </form>
                        </div>
                    </div>
                    <div class="user-info">
                            <!--<h5> - OR -</h5>-->
                            <div class="social-btn"><a href="javascript:;" id="update"><i>Update</i></a></div>
                            <div class="social-btn sb-two"><a href="change_pass.jsp" id="update"><i>Change password</i></a></div>
                            <div class="social-btn sb-two"><a href="/QLCF/index.php"><i>Back to main page</i></a></div>
                    </div>
                </div>
        </div>
        <div class="new" id="history">
            <div class="container">
                <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="title">Purchase <span> History</span></h3>
                </div>
                <ul class="nav nav-tabs" data-wow-delay=".6s">
                    <li class="tb_personal"><a href="javascript:;">Personal</a></li>
                    <li class="active"  ><a href="javascript:;">History</a></li>
                 </ul>
                <div class="widget-shadow">
                        <div class="user-top wow fadeInUp animated" data-wow-delay=".7s">
                                <h4>Thông tin sản phẩm đã từng mua</h4>
                        </div>
                        <div class="user-body wow fadeInUp animated" data-wow-delay=".7s">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="col center tbno">No.</th>
                                        <th class="col center tbhd">Mã hoá đơn</th>
                                        <th class="col center tbdate">Ngày mua</th>
                                        <th class="col center tbname">Tên sản phẩm</th>
                                        <th class="col center tbprice">Gía sản phẩm</th>
                                        <th class="col center tbtype">Phương thức thanh toán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%     
                                        ArrayList inforbuy = new Nguoidung_Model().get_info_buy(idusername);                
                                        for (int i = 0; i < inforbuy.size(); i++) {
                                            String myString[] = (String[]) inforbuy.get(i); 
                                        
                                    %>
                                    <tr>
                                        <td class="col center tbno">No.</td>
                                        <td class="col center tbhd"><%=myString[0]%></td>
                                        <td class="col center tbdate"><%=myString[1]%></td>
                                        <td class="col center tbname"><%=myString[2]%></td>
                                        <td class="col center tbprice"><%=myString[3]%></td>
                                        <td class="col center tbtype"><%=myString[4]%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                </div>
                <div class="user-info"></div>
            </div>
        </div>
        <%}else{
            String redirectURL = "/QLCF/Auth/login.jsp";
            response.sendRedirect(redirectURL);
        }        
        %>
        
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
                        $("#update").click(function(){
                            console.log("---------------");
                            $(".user_update").submit();
                        })
			
		});
	</script>
	
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
