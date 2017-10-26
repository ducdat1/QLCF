<%-- 
    Document   : menu_admin.jsp
    Created on : Oct 21, 2017, 1:30:02 PM
    Author     : ducdat
--%>


<%@page import="DTO.NhanVien_DTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="/QLCF/Admin/index.jsp">Trang QLGV</a>
        </div>
        <%
                  
                    NhanVien_DTO nv = new NhanVien_DTO();
                    if (session.getAttribute("loged") != null) {
                        nv = (NhanVien_DTO) session.getAttribute("loged");
                        if (nv.getCapdo() == 2) {
                            response.sendRedirect("/QLCF/User/index.jsp");
                            return;
                        }}
                %>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/QLCF/Admin/index.jsp">Trang Chủ</a></li>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              
                <li><a href="/QLCF/NhanVien_servlet?logout=true"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>