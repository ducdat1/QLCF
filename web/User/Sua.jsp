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
                <label for="">Giá</label>
                <select class="form-control" name="giaban">
                    
                    <option value="10000">10.000</option>
                    <option value="15000">15.000</option>
                    <option value="20000">20.000</option>
                    <option value="25000">25.000</option>
                    <option value="30000">30.000</option>
                </select>
                <input type="hidden" name="idban" value="<%=request.getParameter("idban")%>"/>
                <input type="hidden" name="idctb" value="<%=request.getParameter("idctb")%>"/>
                </div>

                <input type="hidden" name="update" value="update"/>

                    <button type="submit" class="btn btn-primary">Lưu</button>
                </form>




                    
                </div>
            </div>
        </div>
             </div>           </div>
        <%@include file="/Template/footer.jsp" %>
    </body>
</html>

