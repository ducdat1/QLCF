<%-- 
    Document   : menu_admin.jsp
    Created on : Oct 21, 2017, 1:30:02 PM
    Author     : ducdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="/QLCF/Admin/index.jsp">Trang Admin</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="/QLCF/Admin/QLBan/Ban.jsp">Quản lý bán hàng</a></li>
                <li><a href="/QLCF/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
                <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>