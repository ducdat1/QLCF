<%-- 
    Document   : index.jsp - admin
    Created on : Oct 27, 2017, 10:23:42 PM
    Author     : ducdat
--%>

<%@page import="DTO.NhanVien_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="../Template/head_admin.jsp" %>
    
<body>
    <%@include file="../Template/menu_admin.jsp"%>
    <div class="container">
        <div class="row content">
            <%
                if(session.getAttribute("log_flg")== "0"){
                    out.write("<h1>Đăng nhập thất bại</h1>");
                }
                if(session.getAttribute("flg_nv")==null){%>
                    <%@include file="Display/login.jsp"%>
            <%} else {
                    if(nv.getCapdo() == 5){%>
                        <%@include file="Display/attend.jsp"%>
                  <%}else{%>
                        <%@include file="Display/order.jsp"%>
                  <%}
            }%>
        </div>
    </div>
    <%@include file="../Template/footer_admin.jsp" %>
</body>
</html>



