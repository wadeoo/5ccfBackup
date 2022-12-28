<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>归还书籍</h3>
  <form action="ReturnBook" method="post" style="width:300px">
  <div class="form-group">
    <label for="callno1">书号</label>
    <input type="text" class="form-control" name="callno" id="callno1" placeholder="书号"/>
  </div>
  <div class="form-group">
    <label for="studentid1">会员id</label>
    <input type="text" class="form-control" name="studentid" id="studentid1" placeholder="Id"/>
  </div>
  <button type="submit" class="btn btn-success">归还</button>
</form>