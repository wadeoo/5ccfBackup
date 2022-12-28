<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>请求借阅</h3>
  <form action="IssueBook" method="post" style="width:300px">
  <div class="form-group">
    <label for="callno1">书号</label>
    <input type="text" class="form-control" name="callno" id="callno1" placeholder="书号"/>
  </div>
  <div class="form-group">
    <label for="id1">会员id</label>
    <input type="text" class="form-control" name="studentid" id="id1" placeholder="Id"/>
  </div>
  <div class="form-group">
    <label for="name1">姓名</label>
    <input type="text" class="form-control" name="studentname" id="name1" placeholder="姓名"/>
  </div>
  <div class="form-group">
    <label for="mobile1">电话</label>
    <input type="number" class="form-control" name="studentmobile" id="mobile1" placeholder="电话"/>
  </div>
  <button type="submit" class="btn btn-success">请求借阅</button>
</form>