
<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="/Template/head_admin.jsp" %>

    <body>
        <%@include file="/Template/menu_admin.jsp"%>
         <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-10 col-sm-offset-1">
                    <legend>Thêm nhân viên mới</legend>
                    <div class="new-nv">
                        <button type="submit" class="btn btn-primary btn-nv">Thêm mới nhân viên</button>
                        <button type="submit" class="btn btn-primary btn-close-nv">Đóng</button>
                        <div class="addnew">
                            <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                                <div class="form-group">
                                    <label for="">Tên nhân viên</label>
                                    <input type="text" class="form-control" name="tennv" placeholder="Tên nhân viên">
                                    <label for="">Ngày sinh</label>
                                    <input type="date" class="form-control" name="ngaysinh" placeholder="Ngày Sinh">
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
                                        <option value="1">Quản lý</option>
                                        <option value="2">Nhân Viên</option>
                                    </select>
                                    <label for="">Tên tài khoản</label>
                                    <input type="text" class="form-control" name="taikhoan" placeholder="Tên tài khoản">
                                    <label for="">Mật khẩu</label>
                                    <input type="text" class="form-control" name="matkhau" placeholder="Mật khẩu">
                                </div>
                                <input type="hidden" class="form-control" name="form" value="insert">
                                <button type="submit" class="btn btn-primary">Thêm mới</button>
                            </form>
                        </div>
                    </div>
                    <legend>Tìm nhân viên</legend>

                    <div class="search-nv">
                        <button type="submit" class="btn btn-primary btn-nv">Tìm kiếm nhân viên</button>
                        <button type="submit" class="btn btn-primary btn-close-nv">Đóng</button>
                        <div class="addnew">
                            <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                                <div class="form-group">
                                    <label for="">Nhập tên hoặc mã nhân viên</label>
                                    <input type="text" class="form-control" name="search" placeholder="Input field">
                                </div>
                                <button type="submit" class="btn btn-primary">Tìm</button>
                            </form>
                        </div>
                    </div>
                    <legend>Danh sách nhân viên</legend>
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
                        <tbody>
                        <%
                            ArrayList<NhanVien_DTO> list_nv = new NhanVien_Model().get_all();
                            for (NhanVien_DTO items : list_nv) {
                        %>
                            <tr>
                                <td><%=items.getId_nhanvien()%></td>
                                <td><%=items.getTennv()%></td>
                                <td><%=items.getSdt()%></td>
                                <td><%=items.getDiachi()%></td>
                                <td><%=items.getNgaysinh()%></td>
                                <td><%=items.getLuong()%></td>
                                <td><%if(items.getCapdo() == 5){
                                        out.print("Chủ cửa hàng");
                                    }else if(items.getCapdo() == 2){
                                        out.print("Quản lý");
                                    }else{
                                        out.print("Nhân viên");
                                    }%>
                                </td>
                                <td><%=items.getTaikhoan()%></td>
                                <td><%=items.getMatkhau()%></td>
                                <td><a href="/QLCF/Admin/QLNhanVien/Sua.jsp?idnv=<%=items.getId_nhanvien()%>">Sửa</a>

                                    <a href="/QLCF/NhanVien_servlet?idnv=<%=items.getId_nhanvien()%>">Xóa</a></td>
                            </tr>
                        <% }%>
                        </tbody>
                    </table>
                    <a href="/QLCF/NhanVien_servlet?bangluong=true"><button class="btn btn-success">Xuất bảng lương trên desktop</button></a>
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



