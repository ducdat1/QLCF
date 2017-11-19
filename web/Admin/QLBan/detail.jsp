<%-- 
    Document   : detail
    Created on : Nov 3, 2017, 9:50:36 PM
    Author     : ducdat
--%>

<%@page import="Model.ChiTietBan_Model"%>
<%@page import="DTO.ChiTietBan_DTO"%>
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
                    <div class="wow fadeInUp animated" data-wow-delay=".7s">
                            <legend>Chi tiết mua hàng</legend>
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th class="center">Tên thức uống</th>
                                        <th class="center">Số lượng</th>
                                        <th class="center">Phụ thêm</th>
                                        <th class="center">Số lượng</th>
                                        <th class="center">Giá bán</th>
                                        <th class="center">Cập nhật trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    String idthucuong = request.getParameter("id");
                                    ArrayList<ChiTietBan_DTO> list_order = new ChiTietBan_Model().get_by_id(idthucuong);
                                    for (ChiTietBan_DTO items : list_order) {
                                %>       
                                        <tr>
                                            <th class="center"><%=items.getTen_thucuong()%></th>
                                            <th class="center"><%=items.getSoluong_thucuong()%></th>
                                            <th class="center"><%=items.getTen_spkemtheo()%></th>
                                            <th class="center"><%=items.getSl_spkemtheo()%></th>
                                            <th class="center"><%=items.getThanhtien()%></th>
                                            <th class="center">Cập nhật - Đổi thức uống khác</th>               
                                        </tr>
                                <%}%>
                                </tbody>
                            </table>
                    </div>
                </div>
            </div> 
        </div> 
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>

