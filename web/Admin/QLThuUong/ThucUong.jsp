<%-- 
    Document   : ThucUong.jsp
    Created on : Oct 27, 2017, 10:23:42 PM
    Author     : ducdat
--%>

<%@page import="Model.*"%>
<%@page import="DTO.*"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="/Template/head_admin.jsp"%>
    <body>
        <%@include file="/Template/menu_admin.jsp"%>
        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-2 sidenav hidden-xs">
                    <h2>Danh Mục</h2>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="/QLCF/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
                        <li><a href="/QLCF/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
                        <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
                    </ul><br>
                </div>
                <br>
                <div class="col-sm-10">
                    <div class="col-sm-6 addproduct">
                        <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                            <legend>Thêm nhân thức uống mới</legend>
                            <div class="form-group">
                                <label for="">Tên thức uống</label>
                                <input type="text" class="form-control" name="tentu" placeholder="Thức uống">
                                <label for="">Giá bán</label>
                                <input type="text" class="form-control" name="giaban" placeholder="Giá bán">
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
                    <div class="col-sm-6">
                        <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                            <legend>Tìm thức uống</legend>

                            <div class="form-group">
                                <label for="">Nhập tên hoặc mã thức uống</label>
                                <input type="text" class="form-control" name="search" placeholder="Input field">
                            </div>



                            <button type="submit" class="btn btn-primary">Tìm</button>
                        </form>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Tên thức uống</th>
                                <th>Giá bán</th>
                                
                                <th>Tùy chọn</th>

                            </tr>
                        </thead>
                        <%
                            ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all(1);
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



