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
                <div class="col-sm-10 main-detail col-sm-offset-1">
                    <div class="col-sm-6 addproduct">
                        <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                            <input type="hidden" name="form" value="insert">
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
                    <div class="col-sm-12 display">
                        <ul class="nav nav-tabs" data-wow-delay=".6s">
                            <li class="coffee"><a href="#">Coffee</a></li>
                            <li class="tea"><a href="#">Tea</a></li>
                            <li class="snack"><a href="#">Snack</a></li>
                            <li class="others"><a href="#">Others</a></li>
                        </ul>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Tên thức uống</th>
                                    <th>Giá bán</th>
                                    <th>Ảnh hiển thị</th>
                                    <th>Mã giảm giá</th>
                                    <th>Ghi chú</th>
                                    <th>Size mặc định</th>
                                    <th>Phụ thêm</th>
                                    <th>Phân loại</th>
                                    <th>Tùy chọn</th>

                                </tr>
                            </thead>
                            <%
                                ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all(0);
                                for (ThucUong_DTO items : list_nv) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=items.getTen_thucuong()%></td>
                                    <td><%=items.getGiaban()%></td>
                                    <td><img src="/QLCF/images/thucuong/<%=items.geturl_image()%>" class="img-thumbnail" alt=""/></td>
                                    <td><%=items.getdiscount()%></td>
                                    <td><%=items.getnote()%></td>
                                    <td><%=items.getsize()%></td>
                                    <td><%=items.getextra1()%></td>
                                    <td><%=items.getextra2()%></td>
                                    <td><a href="/QLCF/Admin/QLThucUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                                        <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="/QLCF/assets/js/main.js"></script>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



