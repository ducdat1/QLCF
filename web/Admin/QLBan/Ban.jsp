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

    <body id="javaquery">
        <%@include file="/Template/menu_admin.jsp"%>
        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-10 col-sm-offset-1">
                    <legend>Chi tiết bán</legend>
                    <div class="form-group form-inline">
                        <%      
                            int a=0;
                            String q = request.getParameter("q");
                            if(q != null){
                               a = Integer.parseInt(q);
                            }
                        %>
                        <script>
                            $("select#status > option[value="+<%=a%>+"]").prop('selected',true);
                        </script>
                        <select name="sale-disp" class="form-control" id="status">
                            <option value="0">Tất cả</option>
                            <option value="1">Đã thanh toán</option>
                            <option value="2">Chưa thanh toán</option>
                            <option value="3">Đang giao hàng</option>
                            <option value="4">Hoàn tất</option>
                        </select>
                    </div>
                    <div>
                        <table>
                            <thead>
                                <tr>
                                    <th class="col center">Số hóa đơn</th>
                                    <th class="col center">Tên khách hàng</th>
                                    <th class="col center">Tình trạng</th>
                                    <th class="col center">Tổng tiền</th>
                                    <th class="col center">Hình thức thanh toán</th>
                                    <th class="col center">Ngày đặt hàng</th>
                                    <th class="col center">Tùy chọn</th>
                                </tr>
                            </thead>
                            <%  
                                String date = null;
                                ArrayList<Ban_DTO> list_ban = new Ban_Model().get_all(a,date);
                                for (Ban_DTO items : list_ban) {
                            %>
                            <tbody>
                                <tr>
                                    <td class="col1 center"><%=items.getId_ban()%></td>
                                    <td class="col1 center"><%=items.getName_Customer()%></td>
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
            </div>
        <%@include file="/Template/footer_admin.jsp" %>
        </div> 
    </body>
    <script>
        $(document).ready(function(){
             $("#status").change(function(){
                 var value = $(this).val();
                 $.get("Ban.jsp",{q:value},function(data){
                  $("#javaquery").html(data);
                 });
             });
         });
    </script>
</html>



