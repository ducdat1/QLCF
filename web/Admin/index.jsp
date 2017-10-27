<%-- 
    Document   : index.jsp - admin
    Created on : Oct 27, 2017, 10:23:42 PM
    Author     : ducdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="../Template/head_admin.jsp" %>
    
<body>
    <%@include file="../Template/menu_admin.jsp"%>
    <div class="container-fluid">
      <div class="row content">
        <div class="col-sm-3 sidenav hidden-xs">
          <h2>Danh Mục Quản lý</h2>
          <ul class="nav nav-pills nav-stacked">
            <li><a href="/QLCF/Admin/QLBan/Ban.jsp"">Quản lý bàn</a></li>
            <li><a href="/QLCF/Admin/QLThucUong/ThucUong.jsp">Quản lý thức uống</a></li>
            <li><a href="/QLCF/Admin/QLNhanVien/NhanVien.jsp">Quản lý nhân viên</a></li>
          </ul><br>
        </div>
        <br>

      </div>
    </div>
    <%@include file="../Template/footer_admin.jsp" %>
</body>
</html>



