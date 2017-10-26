
<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="/Template/head_admin.jsp" %>

    <body>
        <%@include file="/Template/menu_admin.jsp"%>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <nav class="navbar navbar-inverse visible-xs">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Danh Mục Quản lý</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="/QLGV/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
                        <li><a href="/QLGV/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
                        <li><a href="/QLGV/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav hidden-xs">
                    <h2>Danh Mục Quản lý</h2>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="/QLGV/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
                        <li><a href="/QLGV/Admin/QLThuUong/ThucUong.jsp">Quản lý thức uống</a></li>
                        <li><a href="/QLGV/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                    </ul><br>
                </div>
                <br>
                <div class="col-sm-9">

                    
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Tên thức uống</th>
                                <th>Giá bán</th>
                                
                                <th>Tùy chọn</th>

                            </tr>
                        </thead>
                        <%
                            ArrayList<ThucUong_DTO> list_nv = (ArrayList<ThucUong_DTO>)session.getAttribute("result");
                            for (ThucUong_DTO items : list_nv) {
                        %>
                        <tbody>
                            <tr>
                                <td><%=items.getTen_thucuong()%></td>
                                <td><%=items.getGiaban()%></td>
                                
                                <td><a href="/QLCF/Admin/QLThuUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                                    <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



