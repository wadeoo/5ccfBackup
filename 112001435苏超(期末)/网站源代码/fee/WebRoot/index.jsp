<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>财务管理</title>
<link rel="stylesheet" href="resources/bootstrap.min.css"/>
<link rel="stylesheet" href="style.css"/>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">开关导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">财务管理</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">主页</a></li>
       </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container">
<div class="row">
<div class="col-md-6">
<h2>管理员登录界面</h2>
<form action="AdminLogin" method="post">
<table>
<tr><td>邮箱：</td><td><input type="email" name="email" required/></td></tr>
<tr><td>密码：</td><td><input type="password" name="password" required/></td></tr>
<tr><td colspan="2" align="center"><input type="submit" class="btn btn-default" value="登录"/></td></tr>
</table>
</form>
</div>

<div class="col-md-6">
<h2>财务登录界面</h2>
<form action="AccountantLogin" method="post">
<table>
<tr><td>邮箱：</td><td><input type="email" name="email" required/></td></tr>
<tr><td>密码：</td><td><input type="password" name="password" required/></td></tr>
<tr><td colspan="2" align="center"><input type="submit" class="btn btn-default" value="登录"/></td></tr>
</table>
</form>
</div>
</div>

</div>

<div class="container-fluid footer">
<p>&copy;所有权 2022. sc</p>
</div>
  <script src="resources/jquery.min.js"></script>
  <script src="resources/bootstrap.min.js"></script>
</body>
</html>