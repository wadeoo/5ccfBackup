<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>光华电影院</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="user.jsp" style="font-size: 20px;"><b>光华电影院</b></a>
    </div>
  </div>
</nav>

<body style="background-color:rgb(229, 229, 229);">
<form action="food" method="post">
<div>
  <div class="container">
    <table class="table table-hover">
        <thead>
            <tr>
            <th>选择</th>
                <th>商品</th>
                <th></th>
                <th>价格</th>
            </tr>
        </thead>
        <tbody>
        
            <tr>
                <td><input type="radio" value="food1" name="id"></td>
                <td><img src="images/5.jpg" style="width: 150px; height: 150px;"></td>
                <td style="margin-top: 100px;">1 百事可乐 + 1 中份 爆米花</td>
                <td>100</td>
            </tr> 
           <tr>
                <td><input type="radio" value="food2" name="id"></td>
                <td><img src="images/4.jpg" style="width: 150px; height: 150px;"></td>
                <td style="margin-top: 100px;">1 百事可乐 + 1 小份薯条 + 1 骨肉相连</td>
                <td>150</td>
            </tr>
           <tr>
                <td><input type="radio" value="food3" name="id"></td>
                <td><img src="images/6.jpg" style="width: 150px; height: 150px;"></td>
                <td style="margin-top: 100px;">1 百事可乐 + 2 中份薯条 + 2 骨肉相连</td>
                <td>200</td>
            </tr>
        </tbody>
    </table>
    <input type="submit" value="订单" class="btn btn-danger">
  </div>
  </div>
  </form>
</div>
</body>
</html>