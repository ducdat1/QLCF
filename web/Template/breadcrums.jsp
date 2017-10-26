<%-- 
    Document   : breadcrums
    Created on : Oct 24, 2017, 4:54:23 PM
    Author     : DatND4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="breadcrumbs">
    <div class="container">
            <ol class="breadcrumb breadcrumb1 animated wow fadeInUp" data-wow-delay=".5s">
                    <li><a href="/QLCF/index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                    <li class="active"><%= request.getParameter("from")%></li>
            </ol>
    </div>
</div>
