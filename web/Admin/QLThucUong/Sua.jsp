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
    <%@include file="/Template/head_admin.jsp" %>

    <body>
        <%@include file="/Template/menu_admin.jsp"%>
       
        <div class="container-fluid">
            <div class="row content">
                <%
                    ThucUong_DTO tu = new ThucUong_Model().select_by_id(request.getParameter("idtu"));

                %>
                <div class="col-sm-4 col-sm-offset-1">
                    <img src="/QLCF/images/thucuong/<%=tu.geturl_image()%>" class="img-responsive" alt=""/>
                </div>
                <div class="col-sm-6">
                    <form action="/QLCF/ThucUong_servlet" method="POST" role="form" enctype = "multipart/form-data">
                        <input type="hidden" name="thucuong_id" value="<%=request.getParameter("idtu")%>">
                        <input type="hidden" name="form" value="update">
                        <legend>Sửa thức uống</legend>
                        <div class="form-group">
                            <label for="">Tên thức uống</label>
                            <input type="text" class="form-control" name="tentu" value="<%=tu.getTen_thucuong()%>" placeholder="Thức uống">
                            <label for="">Giá bán</label>
                            <input type="text" class="form-control" name="giaban" value="<%=tu.getGiaban()%>"placeholder="Giá bán">
                            <label for="">Ảnh hiển thị</label>
                            <input type = "file" name = "file" size = "50" />
                            <label for="">Mã giảm giá</label>   
                            <select name="discount" class="form-control">
                                <option value="1">Sản phẩm mới</option>
                                <option value="2">Ưu đãi ngày trong tuần</option>
                                <option value="3">Ưu đãi ngày lễ</option>
                                <option value="4">Ưu đãi coupon</option>
                                <option value="5">Ưu đãi thuộc sự kiện khác</option>
                            </select>
                            <label for="">Ghi chú</label>
                            <textarea name="note" id="input" class="form-control" rows="2" placeholder="Ghi chú..."><%=tu.getnote()%></textarea>
                            <label for="">Size mặc định</label>
                            <input type="hidden" name="old_size" value="<%=tu.getsize()%>">
                            <select name="size" class="form-control">
                                <option value="M">M</option>
                                <option value="S">S</option>
                                <option value="L">L</option>
                                <option value="XS">XS</option>
                            </select>
                            <label for="">Phụ thêm</label>
                            <input type="text" class="form-control" name="bonus1" value="<%=tu.getextra1()%>" placeholder="Phụ thêm">
                            <label for="">Phân loại</label>
                            <input type="hidden" name="old_bonus" value="<%=tu.getextra2()%>">
                            <select name="bonus2" class="form-control">
                                <option value="1">Cà phê</option>
                                <option value="2">Trà</option>
                                <option value="3">Phần thêm</option>
                                <option value="4">Bánh & ăn nhẹ</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Lưu</button>
                        <a href="/QLCF/Admin/QLThucUong/ThucUong.jsp"><button type="button" class="btn btn-primary">Cancel</button></a>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



