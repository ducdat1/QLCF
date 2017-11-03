<%-- 
    Document   : index.jsp - admin
    Created on : Oct 27, 2017, 10:23:42 PM
    Author     : ducdat
--%>

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
                <div class="col-sm-10 col-sm-offset-1">
                    <legend>Chi tiết bán</legend>
                    <table>
                        <thead>
                            <tr>
                                <th class="col center">Số hóa đơn</th>
                                <th class="col center">Tên khách hàng</th>
                                <th class="col center">Tình trạng</th>
                                <th class="col center">Tổng tiền</th>
                                <th class="col center">Hình thức thanh toán</th>
                                <th class="col center">Ngày thanh toán</th>
                                <th class="col center">Tùy chọn</th>
                            </tr>
                        </thead>
                        <%
                            ArrayList<Ban_DTO> list_ban = new Ban_Model().get_all();
                            for (Ban_DTO items : list_ban) {
                        %>
                        <tbody>
                            <tr>
                                <td class="col1 center"><%=items.getId_ban()%></td>
                                <td class="col1 center"><%=items.getId_customer()%></td>
                                <td class="col1 center"><%=items.getTrangthai()%></td>
                                <td class="col1 center"><%=items.getTongtien()%></td>
                                <td class="col1 center"><%=items.getPayment()%></td>
                                <td class="col1 center"><%=items.getCreatedate()%></td>
                                <td class="col1 center"><a href="/QLCF/Admin/QLBan/detail.jsp?id=<%=items.getId_ban()%>">Xem chi tiết</a></td>
                            </tr>
                        <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        <%@include file="/Template/footer_admin.jsp" %>
        </div> 
    </body>
</html>



