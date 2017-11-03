<%-- 
    Document   : menu
    Created on : Oct 21, 2017, 1:30:02 PM
    Author     : ducdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<ul class="menu">
    <li><a href="/QLCF/User/index.jsp">Trang chủ</a></li> 
    <li><a href="/QLCF/User/Cafe.jsp">Quản lí bán</a></li> 
    <%
        if(session.getAttribute("loged")!=null){
    
    %>
    <li><a href = "/QLCF/NhanVien_servlet?logout=true">Đăng xuất</a></li>
    <% } else {%>
    <li><a href = "/QLCF/Auth/Login.jsp">Đăng nhập</a></li>

    <li><a href = "/QLCF/Auth/register.jsp">Đăng ký</a></li>
    <%}%>
</ul>
