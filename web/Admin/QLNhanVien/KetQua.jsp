<%-- 
    Document   : KetQua.jsp
    Created on : Oct 27, 2017, 10:23:42 PM
    Author     : ducdat
--%>

<%@page import="DTO.NhanVien_DTO"%>
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
                            ArrayList<NhanVien_DTO> list_nv = (ArrayList<NhanVien_DTO>)session.getAttribute("result");
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
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



