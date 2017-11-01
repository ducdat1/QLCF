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
        <div class="container-fluid">
            <%@include file="/Template/menu_admin.jsp"%>
            <div class="row content">
                <div class="col-sm-10 col-sm-offset-1">
                    <legend>Chi tiết bán</legend>
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
        <%@include file="/Template/footer_admin.jsp" %>
        </div> 
    </body>
</html>



