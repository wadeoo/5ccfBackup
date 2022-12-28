<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>图书馆会员登录</h3>
  <form action="LibrarianLogin" method="post" style="width:300px">
  <div class="form-group">
    <label for="email1">邮箱地址</label>
    <input type="email" class="form-control" name="email" id="email1" placeholder="邮箱"/>
  </div>
  <div class="form-group">
    <label for="password1">密码</label>
    <input type="password" class="form-control" name="password" id="password1" placeholder="密码"/>
  </div>  
  <button type="submit" class="btn btn-success">登录</button>
</form>