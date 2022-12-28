<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <li><a href="index.jsp">主页</a></li>
        <li><a href="AddBookForm">添加书籍</a></li>
        <li><a href="ViewBook">查看书籍</a></li>
        <li><a href="IssueBookForm">申请借阅</a></li>
        <li><a href="ViewIssuedBook">查看已申请书籍</a></li>
        <li><a href="ReturnBookForm">归还书籍</a></li>
        <li><a href="LogoutLibrarian">登出</a></li>
       </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>