<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel='stylesheet' type='text/css' />
<title>账号注册</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
	<!--/start-login-two-->
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>注册</h2>
				<lable></lable>
			</div>
			<form action="RegisterServlet" method="post">
				<li style="color: red"><%=err%></li>
				用户名
				<li><input type="text" class="text" value=""
					name="username"><a href="#" class=" icon2 user2"></a></li>
				密码	
				<li><input type="password" value=""
					name="password"><a href="#" class=" icon2 lock2"></a></li>
				生日
				<li><input type="date" value=""
					name="ngaysinh"><a href="#" class=" icon2 lock2"></a></li>
				性别
				<li><input type="text" value="" list="exampleList"
					name="gioitinh"> 
					<datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				邮箱
				<li><input type="text" value=""
					name="email"><a href="#" class=" icon2 lock2"></a></li>
				电话号码
				<li><input type="text" value=""				
					name="sdt"><a href="#" class=" icon2 lock2"></a></li>
				地址
				<li><input type="text" value=""
					name="diachi"><a href="#" class=" icon2 lock2"></a></li>
					
				<div class="p-container">
					<label class="checkbox two"><input type="checkbox"
						name="checkbox" checked><i></i>我同意 <a href="#">服务条款</a></label>
				</div>
				<div class="submit two">
					<input type="submit" value="注册">
				</div>
				<h5>
					<a href="login.jsp">登录</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>