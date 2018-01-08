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
        <div class="new" id="personal">
                <div class="container">
                    <div class="title-info wow fadeInUp animated" data-wow-delay=".5s">
                            <h3 class="title">Buy <span> Point</span></h3>
                    </div>
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
                                <%
                                    String idusername = String.valueOf(session.getAttribute("UID"));
                                    NguoiDung_DTO ngdung = new Nguoidung_Model().get_info(idusername);
                                %>
                                <div class="info_right">
                                        <input type="text" class="info_label" value="<%=ngdung.getFirstname()%>" />
                                        <input type="text" class="info_label" value="<%=ngdung.getLastname()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getCus_account()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getCus_password()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getCus_email()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getCus_phone()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getCus_address()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getPlus()%>"/>
                                        <input type="text" class="info_label" value="<%=ngdung.getPoint_sum()%>"/>
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
			
		});
	</script>
	
        <script src="/QLCF/assets/js/bootstrap.js"></script>
    </body>
</html>
