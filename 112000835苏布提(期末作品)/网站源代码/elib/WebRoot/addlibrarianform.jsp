<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>添加图书馆会员</h3>
  <form action="AddLibrarian" method="post" style="width:300px">
  <div class="form-group">
    <label for="name1">姓名</label>
    <input type="text" class="form-control" name="name" id="name1" placeholder="姓名"/>
  </div>
  <div class="form-group">
    <label for="email1">邮箱</label>
    <input type="email" class="form-control" name="email" id="email1" placeholder="邮箱"/>
  </div>
  <div class="form-group">
    <label for="password1">密码</label>
    <input type="password" class="form-control" name="password" id="password1" placeholder="密码"/>
  </div>  
  <div class="form-group">
    <label for="mobile1">电话</label>
    <input type="number" class="form-control" name="mobile" id="mobile1" placeholder="电话"/>
  </div>
  <button type="submit" class="btn btn-success">提交</button>
</form>