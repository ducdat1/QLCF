<%-- 
    Document   : login
    Created on : Nov 4, 2017, 12:11:58 AM
    Author     : ducdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="login-page">
    <div class="widget-shadow">
            <div class="login-top">
                    <h4>Login to admin page</h4>
            </div>
            <div class="login-body wow fadeInUp animated" data-wow-delay=".7s">
                    <form action="/QLCF/NhanVien_servlet" method="POST">
                        <input type="hidden" name="form" value="login"/>
                        <input type="text" class="user" name="username" placeholder="Enter your staff number..." required="">
                        <input type="password" name="password" class="lock" placeholder="Password...">
                        <input type="submit" name="Sign In" value="Sign In">
                    </form>
            </div>
    </div>
</div>
