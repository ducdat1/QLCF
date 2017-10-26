
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
                        <li><a href="/QLCF/Admin/QLThuUong/ThucUong.jsp">Quản lý thức uống</a></li>
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
                    <%
                        NhanVien_DTO nv1 = new NhanVien_Model().select_by_id(request.getParameter("idnv"));
                    
                    %>
                    <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                        <legend>Thêm nhân viên mới</legend>

                        <div class="form-group">

                            <label for="">Tên nhân viên</label>
                            <input type="text" class="form-control" name="tennv" value="<%=nv1.getTennv()%>" placeholder="Tên nhân viên">
                            <label for="">Số điện thoại</label>
                            <input type="text" class="form-control" name="sdt" value="<%=nv1.getSdt()%>" placeholder="Số điện thoại">
                            <label for="">Địa chỉ</label>
                            <input type="text" class="form-control" name="diachi" value="<%=nv1.getDiachi()%>" placeholder="Địa chỉ">
                            <label for="">Ngày sinh</label>
                            <input type="date" class="form-control" name="ngaysinh" placeholder="Tên nhân viên">
                            <label for="">Giờ làm</label>
                            <input type="number" class="form-control" name="giolam" value="<%=nv1.getGiolam()%>" placeholder="Giờ làm">
                            <label for="">Cấp độ</label>
                            <select name="capdo" class="form-control">
                                <option value="1">Admin</option>
                                <option value="2">User</option>
                            </select>
                            <label for="">Tên tài khoản</label>
                            <input type="text" class="form-control" name="taikhoan" value="<%=nv1.getTaikhoan()%>" placeholder="Tên tài khoản">
                            <label for="">Mật khẩu</label>
                            <input type="text" class="form-control" name="matkhau" value="<%=nv1.getMatkhau()%>" placeholder="Mật khẩu">
                            <input type="hidden" name="idnv" value="<%=nv1.getId_nhanvien()%>"/>
                        </div>



                        <button type="submit" class="btn btn-primary">Lưu</button>
                    </form>
                    
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



