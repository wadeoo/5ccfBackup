<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>电子图书馆</title>
<link rel="stylesheet" href="bootstrap.min.css"/>
</head>
<body style="background-color:gray;">

<nav class="navbar navbar-inversea" style="background-color:white;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">开关导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">电子图书馆</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp" class="active">主页</a></li>
        <li><a href="#">管理员</a></li>
        <li><a href="#">图书馆会员</a></li>
       </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
<h1>电子图书馆</h1>

<div class="row">
  <div class="col-md-6">
  <h3>管理员登录</h3>
  <form action="AdminLogin" method="post" style="width:300px">
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
  
  </div>
  <div class="col-md-6">
  <h3>图书馆会员登录</h3>
  <form action="LibrarianLogin" method="post" style="width:300px">
  <div class="form-group">
    <label for="email1">邮箱地址</label>
    <input type="email" class="form-control" id="email1" name="email" placeholder="邮箱"/>
  </div>
  <div class="form-group">
    <label for="password1">密码</label>
    <input type="password" class="form-control" id="password1" name="password" placeholder="密码"/>
  </div>  
  <button type="submit" class="btn btn-success">登录</button>
</form>
</div>
  </div>
</div>




  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
</body>
</html>