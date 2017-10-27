
<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="/Template/head_admin.jsp" %>

    <body>
        <%@include file="/Template/menu_admin.jsp"%>
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

                    <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                        <legend>Thêm nhân viên mới</legend>

                        <div class="form-group">

                            <label for="">Tên nhân viên</label>
                            <input type="text" class="form-control" name="tennv" placeholder="Tên nhân viên">
                            <label for="">Ngày sinh</label>
                            <input type="date" class="form-control" name="ngaysinh" placeholder="Tên nhân viên">
                            <label for="">Số điện thoại</label>
                            <input type="text" class="form-control" name="sdt" placeholder="Số điện thoại">
                            <label for="">Địa chỉ</label>
                            <input type="text" class="form-control" name="diachi" placeholder="Địa chỉ">
                            <label for="">Lương</label>
                            <input type="number" class="form-control" name="luong" placeholder="Lương">
                            <label for="">Giờ làm</label>
                            <input type="number" class="form-control" name="giolam" placeholder="Giờ làm">
                            <label for="">Cấp độ</label>
                            <select name="capdo" class="form-control">
                                <option value="1">Admin</option>
                                <option value="2">User</option>
                            </select>
                            <label for="">Tên tài khoản</label>
                            <input type="text" class="form-control" name="taikhoan" placeholder="Tên tài khoản">
                            <label for="">Mật khẩu</label>
                            <input type="text" class="form-control" name="matkhau" placeholder="Mật khẩu">

                        </div>



                        <button type="submit" class="btn btn-primary">Thêm mới</button>
                    </form>

                    <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                        <legend>Tìm nhân viên</legend>

                        <div class="form-group">
                            <label for="">Nhập tên hoặc mã nhân viên</label>
                            <input type="text" class="form-control" name="search" placeholder="Input field">
                        </div>

                        

                        <button type="submit" class="btn btn-primary">Tìm</button>
                    </form>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Mã nhân viên</th>
                                <th>Tên nhân viên</th>
                                <th>Số điện thoại</th>
                                <th>Địa chỉ</th>
                                <th>Ngày sinh</th>
                                <th>Lương</th>
                                <th>Cấp độ</th>
                                <th>Tài khoản</th>
                                <th>Mật khẩu</th>
                                <th>Tùy chọn</th>

                            </tr>
                        </thead>
                        <%
                            ArrayList<NhanVien_DTO> list_nv = new NhanVien_Model().get_all();
                            for (NhanVien_DTO items : list_nv) {
                        %>
                        <tbody>
                            <tr>
                                <td><%=items.getId_nhanvien()%></td>
                                <td><%=items.getTennv()%></td>
                                <td><%=items.getSdt()%></td>
                                <td><%=items.getDiachi()%></td>
                                <td><%=items.getNgaysinh()%></td>
                                <td><%=items.getLuong()%></td>
                                <td><%=items.getCapdo()%></td>
                                <td><%=items.getTaikhoan()%></td>
                                <td><%=items.getMatkhau()%></td>
                                <td><a href="/QLCF/Admin/QLNhanVien/Sua.jsp?idnv=<%=items.getId_nhanvien()%>">Sửa</a>

                                    <a href="/QLCF/NhanVien_servlet?idnv=<%=items.getId_nhanvien()%>">Xóa</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                            <button class="btn btn-success"><a href="/QLCF/NhanVien_servlet?bangluong=true">Xuất bảng lương trên desktop</a></button>
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



