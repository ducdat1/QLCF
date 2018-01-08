<%-- 
    Document   : order.jsp
    Created on : Nov 4, 2017, 12:32:26 AM
    Author     : ducdat
--%>

<%@page import="Model.Ban_Model"%>
<%@page import="DTO.Ban_DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<legend>Hóa đơn đặt hàng</legend>
<table class="table table-hover table-bordered">
    <thead>
        <tr>
            <th class="center">Số</th>
            <th class="center">Tên khách hàng</th>
            <th class="center">Tình trạng</th>
            <th class="center">Địa chỉ nhận hàng</th>
            <th class="center">Tổng tiền</th>
            <th class="center">Thanh toán</th>
            <th class="center">Thời gian đặt hàng</th>
            <th class="center">Tùy chọn</th>
        </tr>
    </thead>
    <tbody>
    <%
                            ArrayList<Ban_DTO> list_order = new Ban_Model().get_empty();
                            for (Ban_DTO items : list_order) {
    %>       
            <tr>
                <th class="center"><a href="/QLCF/Admin/QLBan/detail.jsp?id=<%=items.getId_ban()%>"><%=items.getId_ban()%></a></th>
                <th class="center"><%=items.getName_Customer()%></th>
                <% if(items.getTrangthai() == 1){
                    out.print("<th class='center'>Đã Thanh toán</th>");
                }else if(items.getTrangthai() == 2){
                    out.print("<th class='center'>Chưa thanh toán</th>");
                }else if(items.getTrangthai() == 3){
                    out.print("<th class='center'>Đang giao hàng</th>");
                }else if(items.getTrangthai() == 4){
                    out.print("<th class='center'>Hoàn tất</th>");
                }%>
                <th class="center col-address"><%=items.getDc_nhan()%></th>
                <th class="center"><%=items.getTongtien()%></th>
                <th class="center"><%=items.getPayment()%></th>
                <th class="center col-time"><%=items.getCreatedate()%></th>
                <% if(items.getTrangthai() == 1){%>
                    <th class="center"><a href="/QLCF/Admin/QLBan/detail.jsp?id=<%=items.getId_ban()%>"><button class="btn btn-success">Hoàn tất</button></a></th>
                <%}else if(items.getTrangthai() == 2){%>
                    <th class="center"><a href="/QLCF/Admin/QLBan/detail.jsp?id=<%=items.getId_ban()%>"><button class="btn btn-success">Giao hàng</button></a></th>
                <%}else if(items.getTrangthai() == 3){%>
                    <th class="center"><a href="/QLCF/Admin/QLBan/detail.jsp?id=<%=items.getId_ban()%>"><button class="btn btn-success">Hoàn tất</button></a></th>
                <%}%> 
            </tr>
    <%}%>
    </tbody>
</table>