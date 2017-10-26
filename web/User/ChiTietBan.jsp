<%-- 
    Document   : ChiTietBan
    Created on : Dec 1, 2016, 7:52:44 AM
    Author     : TiT_TM
--%>

<%@page import="Model.ThucUong_Model"%>
<%@page import="DTO.ThucUong_DTO"%>
<%@page import="Model.ChiTietBan_Model"%>
<%@page import="DTO.ChiTietBan_DTO"%>
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
            <div class="content">
            <div class="main">
                <div class="anh">
                    <div class="row">
                        <div class="col-sm-12">
                <form action="/QLCF/ChiTietBan_servlet" method="POST" role="form">
                <legend>Thêm chi vào bàn</legend>

                <div class="form-group">
		<label for="">Danh sách thức uống</label>
                <select class="form-control" name="idtu">
		<%
                            ArrayList<ThucUong_DTO> list_nv = new ThucUong_Model().get_all();
                            for (ThucUong_DTO items : list_nv) {
                        %>
                        <option value="<%=items.getId_thucuong()%>">
                            <%=items.getTen_thucuong()%>
                        </option>
                      
                        <% } %>
                        
                </select>
                        <label for="">Số lượng</label>
                <input type="number" name="soluong" placeholder="Thêm số lượng" class="form-control"/>
                <input type="hidden" name="idban" value="<%=request.getParameter("idban")%>"/>
                <label for="">Giá</label>
                <select class="form-control" name="giaban">
                    
                    <option value="10000">10.000</option>
                    <option value="15000">15.000</option>
                    <option value="20000">20.000</option>
                    <option value="25000">25.000</option>
                    <option value="30000">30.000</option>
                </select>
                </div>

	

                    <button type="submit" class="btn btn-primary">Thêm</button>
                </form>




                    <h2>Chi tiết bàn số <%=request.getParameter("idban")%></h2>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Bàn số</th>
                                <th>Tên thức uống</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <%
                            ArrayList<ChiTietBan_DTO> ctb = new ChiTietBan_Model().get_by_id(request.getParameter("idban"));
                            for (ChiTietBan_DTO items : ctb) {
                        %>
                        <tbody>
                            <tr>
                                <td><%=items.getId_ban()%></td>
                                <td><%=items.getId_thucuong()%></td>
                                <td><%=items.getSoluong_thucuong()%></td>
                                <td><%=items.getThanhtien()%></td>
                                <td><a href="/QLCF/User/Sua.jsp?idctb=<%=items.getId_chitiet_ban()%>&&idban=<%=request.getParameter("idban")%>">Sửa</a>
                                    <a href="/QLCF/ChiTietBan_servlet?idctb=<%=items.getId_chitiet_ban()%>&&idban=<%=request.getParameter("idban")%>">Xóa</a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                        <button class="btn btn-default"><a href="/QLCF/ChiTietBan_servlet?delete_all=true&&idban=<%=request.getParameter("idban")%>">Xóa hết</a></button>
                        <button class="btn btn-default"><a href="/QLCF/User/Cafe.jsp">Quay lại trang quản lý</a></button>
                    </div>
                </div>
            </div>
        </div>
             </div>           </div>
        <%@include file="/Template/footer.jsp" %>
    </body>
</html>

