<%-- 
    Document   : menu_admin.jsp
    Created on : Oct 21, 2017, 1:30:02 PM
    Author     : ducdat
--%>

<%@page import="DTO.NhanVien_DTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top">
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
            <%
                NhanVien_DTO nv = (NhanVien_DTO)session.getAttribute("flg_nv");
                if(nv!=null){
                    if(nv.getCapdo() == 5){%>
            <ul class="nav navbar-nav">
                <li><a href="/QLCF/Admin/QLBan/Ban.jsp">Quản lý bán hàng</a></li>
                <li><a href="/QLCF/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
                <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                <li><a href="/QLCF/Admin/QLNhanVien/chitietcatruc.jsp">Quản lý ca làm việc</a></li>
            </ul>
                    <%}else{%>
            <ul class="nav navbar-nav">
                <li><a href="/QLCF/Admin/QLNhanVien/banglamviec.jsp">Chi tiết ca trực</a></li>
            </ul>

                    <%}%>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/QLCF/Admin/QLNhanVien/Sua.jsp?idnv=<%=nv.getId_nhanvien()%>">Xin chào, <%=nv.getTennv()%></a></li>
                <li><a href="/QLCF/NhanVien_servlet?logout=true"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
                <%}%>
        </div>
    </div>
</nav>