
<%@page import="Model.Ban_Model"%>
<%@page import="DTO.Ban_DTO"%>
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
                        <li><a href="/QLGV/Admin/QLThuUong/ThucUong.jsp">Quản lý thức uống</a></li>
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

                    <form action="/QLCF/Ban_servlet" method="POST" role="form">
                        <legend>Thêm bàn mới</legend>

                        <div class="form-group">
                           
                            <input type="hidden" class="form-control" id="" name = "insert" values="insert">
                        </div>



                        <button type="submit" class="btn btn-primary">Thêm</button>
                    </form>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Bàn số</th>
                                <th>Tùy chọn</th>
                            </tr>
                        </thead>
                        <%
                            ArrayList<Ban_DTO> list_ban = new Ban_Model().get_all();
                            for (Ban_DTO items : list_ban) {
                        %>
                        <tbody>
                            <tr>
                                <td><%=items.getId_ban()%></td>
                                <td><a href="/QLCF/Ban_servlet?idban=<%=items.getId_ban()%>">Xóa</a></td>
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



