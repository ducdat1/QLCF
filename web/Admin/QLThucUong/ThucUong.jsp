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
    <%@include file="/Template/head_admin.jsp"%>
    <body>
        <%@include file="/Template/menu_admin.jsp"%>
        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-10 main-detail col-sm-offset-1">
                    <div class="col-sm-6 addproduct">
                        <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                            <input type="hidden" name="form" value="insert">
                            <legend>Thêm nhân thức uống mới</legend>
                            <div class="form-group">
                                <label for="">Tên thức uống</label>
                                <input type="text" class="form-control" name="tentu" placeholder="Thức uống">
                                <label for="">Giá bán</label>
                                <input type="text" class="form-control" name="giaban" placeholder="Giá bán">
                                <label for="">Ảnh hiển thị</label>
                                <input type = "file" name = "file" size = "50" />
                                <label for="">Mã giảm giá</label>   
                                <select name="discount" class="form-control">
                                    <option value="1">Sản phẩm mới</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                </select>
                                <label for="">Ghi chú</label>
                                <textarea name="note" id="input" class="form-control" rows="2" required="required" placeholder="Ghi chú..."></textarea>
                                <label for="">Size mặc định</label>
                                <input type="text" class="form-control" name="size" placeholder="Size mặc định">
                                <label for="">Phụ thêm</label>
                                <input type="text" class="form-control" name="bonus1" placeholder="Phụ thêm">
                                <label for="">Phân loại</label>
                                 <select name="bonus2" class="form-control">
                                    <option value="1">Coffee</option>
                                    <option value="2">Tea</option>
                                    <option value="4">Snack</option>
                                    <option value="3">Other</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </form>
                    </div>
<!--                    <div class="col-sm-6">
                        <form action="/QLCF/ThucUong_servlet" method="POST" role="form">
                            <legend>Tìm thức uống</legend>
                            <div class="form-group">
                                <label for="">Nhập tên hoặc mã thức uống</label>
                                <input type="text" class="form-control" name="search" placeholder="Input field">
                            </div>
                            <button type="submit" class="btn btn-primary">Tìm</button>
                        </form>
                    </div>-->
<!--                    <div class="col-sm-12 display">
                        <ul class="nav nav-tabs" data-wow-delay=".6s">
                            <li class="tabsp coffee active"><a href="javascript:;">Coffee</a></li>
                            <li class="tabsp tea"><a href="javascript:;">Tea</a></li>
                            <li class="tabsp snack"><a href="javascript:;">Snack</a></li>
                            <li class="tabsp others"><a href="javascript:;">Others</a></li>
                        </ul>
                        <div class="tabs-content">
                            <div class="content-sp">
                                <jsp:include page='content.jsp'>
                                    <jsp:param name="type" value="1"/>
                                </jsp:include>
                            </div>
                            <div class="content-sp1 inactive">
                                <jsp:include page='content.jsp'>
                                    <jsp:param name="type" value="2"/>
                                </jsp:include>
                            </div>
                            <div class="content-sp2 inactive">
                                <jsp:include page='content.jsp'>
                                    <jsp:param name="type" value="3"/>
                                </jsp:include>
                            </div>
                            <div class="content-sp3 inactive">
                                <jsp:include page='content.jsp'>
                                    <jsp:param name="type" value="4"/>
                                </jsp:include>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        <script src="/QLCF/assets/js/main.js"></script>
        <%@include file="/Template/footer_admin.jsp" %>
    </body>
</html>



