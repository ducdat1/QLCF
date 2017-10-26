<%-- 
    Document   : index.jsp
    Created on : Nov 30, 2016, 1:30:02 PM
    Author     : TiT_TM
--%>

<%@page import="Model.Ban_Model"%>
<%@page import="DTO.Ban_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="/Template/head_user.jsp" %>
    <body>
        <div>
            <div class="header">
                <img src = "/QLCF/images/bg-banner.jpg" width="100%" height="250"></img>
            </div>
            <%@include file="/Template/menu.jsp"%>
            <div class="main">
                <div class="anh">
                    <div class="row">
                        <div class="col-sm-6">
                        <h2>Danh sách bàn trống</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Bàn số</th>
                                    <th>Tùy chọn</th>
                                </tr>
                            </thead>
                            <%
                                ArrayList<Ban_DTO> list_ban = new Ban_Model().get_empty();
                                for (Ban_DTO items : list_ban) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=items.getId_ban()%></td>
                                    <td><a href="/QLCF/User/ChiTietBan.jsp?idban=<%=items.getId_ban()%>">Thêm</a></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm-6">
                        <h2>Danh sách bàn đã đặt</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Bàn số</th>
                                    <th>Tùy chọn</th>
                                </tr>
                            </thead>
                            <%
                                ArrayList<Ban_DTO> list_check = new Ban_Model().get_check();
                                for (Ban_DTO items : list_check) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%=items.getId_ban()%></td>
                                    <td><a href="/QLCF/ChiTietBan_servlet?delete_all=true&&idban=<%=items.getId_ban()%>">Xóa bàn này</a>
                                        <a href="/QLCF/User/ChiTietBan.jsp?idban=<%=items.getId_ban()%>">Chi tiết</a>
                                        <div> <%=items.getTongtien()%></div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                    </div>
                    
            </div>
        </div>
        <%@include file="/Template/footer.jsp" %>
    </body>
</html>
