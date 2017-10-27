
<%@page import="Model.Ban_Model"%>
<%@page import="DTO.Ban_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="/Template/head_admin.jsp" %>

    <body>
        <%@include file="/Template/menu_admin.jsp"%>
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



