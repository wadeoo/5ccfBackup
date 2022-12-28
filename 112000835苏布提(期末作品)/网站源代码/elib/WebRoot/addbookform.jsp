<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>添加书籍</h3>
  <form action="AddBook" method="post" style="width:300px">
  <div class="form-group">
    <label for="callno1">书号</label>
    <input type="text" class="form-control" name="callno" id="callno1" placeholder="书号"/>
  </div>
  <div class="form-group">
    <label for="name1">书名</label>
    <input type="text" class="form-control" name="name" id="name1" placeholder="书名"/>
  </div>
  <div class="form-group">
    <label for="author1">作者</label>
    <input type="text" class="form-control" name="author" id="author1" placeholder="作者"/>
  </div>
  <div class="form-group">
    <label for="publisher1">出版社</label>
    <input type="text" class="form-control" name="publisher" id="publisher1" placeholder="出版社"/>
  </div>
  <div class="form-group">
    <label for="quantity1">数量</label>
    <input type="number" class="form-control" name="quantity" id="quantity1" placeholder="数量"/>
  </div>
  <button type="submit" class="btn btn-success">提交</button>
</form>