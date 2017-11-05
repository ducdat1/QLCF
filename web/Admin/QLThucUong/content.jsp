<%-- 
    Document   : content
    Created on : Nov 5, 2017, 8:40:08 PM
    Author     : ducdat
--%>

<%@page import="DTO.ThucUong_DTO"%>
<%@page import="Model.ThucUong_Model"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    String id = request.getParameter("type");
    if("1".equals(id))
    {%>
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
                    <td><img src="/QLCF/images/thucuong/<%=items.geturl_image()%>" class="img-thumbnail" alt=""/></td>
                    <td><%=items.getdiscount()%></td>
                    <td><%=items.getnote()%></td>
                    <td><%=items.getsize()%></td>
                    <td><%=items.getextra1()%></td>
                    <td><a href="/QLCF/Admin/QLThucUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                        <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    <%}else if("2".equals(id))
    {%>
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
                    <th>Tùy chọn</th>

                </tr>
            </thead>
            <%
                ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all(2);
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
                    <td><a href="/QLCF/Admin/QLThucUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                        <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    <%}else if("3".equals(id))
    {%>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Tên thạch</th>
                    <th>Giá bán</th>
                    <th>Ảnh hiển thị</th>
                    <th>Ghi chú</th>
                    <th>Tùy chọn</th>

                </tr>
            </thead>
            <%
                ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all(3);
                for (ThucUong_DTO items : list_nv) {
            %>
            <tbody>
                <tr>
                    <td><%=items.getTen_thucuong()%></td>
                    <td><%=items.getGiaban()%></td>
                    <td><img src="/QLCF/images/thucuong/<%=items.geturl_image()%>" class="img-thumbnail" alt=""/></td>
                    <td><%=items.getnote()%></td>

                    <td><a href="/QLCF/Admin/QLThucUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                        <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    <%}else if("4".equals(id))
    {%>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Tên bánh</th>
                    <th>Giá bán</th>
                    <th>Ảnh hiển thị</th>
                    <th>Mã giảm giá</th>
                    <th>Ghi chú</th>
                    <th>Phụ thêm</th>
                    <th>Phân loại</th>
                    <th>Tùy chọn</th>

                </tr>
            </thead>
            <%
                ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all(4);
                for (ThucUong_DTO items : list_nv) {
            %>
            <tbody>
                <tr>
                    <td><%=items.getTen_thucuong()%></td>
                    <td><%=items.getGiaban()%></td>
                    <td><img src="/QLCF/images/thucuong/<%=items.geturl_image()%>" class="img-thumbnail" alt=""/></td>
                    <td><%=items.getdiscount()%></td>
                    <td><%=items.getnote()%></td>
                    <td><%=items.getextra1()%></td>
                    <td><a href="/QLCF/Admin/QLThucUong/Sua.jsp?idtu=<%=items.getId_thucuong()%>">Sửa</a>

                        <a href="/QLCF/ThucUong_servlet?idtu=<%=items.getId_thucuong()%>">Xóa</a></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    <%}else
    {
       response.sendRedirect("/QLCF/Admin/QLThucUong/ThucUong.jsp"); 
    }
%>
