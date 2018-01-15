
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
                    <%
                        NhanVien_DTO nv1 = new NhanVien_Model().select_by_id(request.getParameter("idnv"));
                    
                    %>
                    <form action="/QLCF/NhanVien_servlet" method="POST" role="form">
                        <legend>Sửa thông tin nhân viên</legend>

                        <div class="form-group">

                            <label for="">Tên nhân viên</label>
                            <input type="text" class="form-control" name="tennv" value="<%=nv1.getTennv()%>" placeholder="Tên nhân viên">
                            <label for="">Số điện thoại</label>
                            <input type="text" class="form-control" name="sdt" value="<%=nv1.getSdt()%>" placeholder="Số điện thoại">
                            <label for="">Địa chỉ</label>
                            <input type="text" class="form-control" name="diachi" value="<%=nv1.getDiachi()%>" placeholder="Địa chỉ">
                            <label for="">Ngày sinh</label>
                            <input type="date" class="form-control" name="ngaysinh" value="<%=nv1.getNgaysinh()%>" placeholder="Ngày sinh">
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
                        <input type="hidden" name="form" value="update"/>
                        <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



