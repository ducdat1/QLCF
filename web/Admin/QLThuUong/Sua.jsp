
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
                        <li><a href="/QLCF/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
                        <li><a href="/QLCF/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
                        <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav hidden-xs">
                    <h2>Danh Mục Quản lý</h2>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="/QLCF/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
                        <li><a href="/QLCF/Admin/QLThuUong/ThucUong.jsp">Quản lý thức uống</a></li>
                        <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                    </ul><br>
                </div>
                <br>
                <div class="col-sm-9">

                    <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                        <legend>Sửa thức uống</legend>
                        <%
                            ThucUong_DTO tu = new ThucUong_Model().select_by_id(request.getParameter("idtu"));
                            
                        %>
                        <div class="form-group">

                            <label for="">Tên thức uống</label>
                            <input type="text" class="form-control" name="tentu" value="<%=tu.getTen_thucuong()%>" placeholder="Thức uống">
                            <label for="">Giá bán</label>
                            <input type="text" class="form-control" name="giaban" value="<%=tu.getGiaban()%>"placeholder="Giá bán">


                        </div>



                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>





                    
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



