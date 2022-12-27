<!DOCTYPE html>
<html lang="en">
	<head>
		<title>手术</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
	</head>
	<body style="background-image:url(images/slider-image2.jpg)">
	<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "haosql";

String sql=null;

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
int id=Integer.parseInt(request.getParameter("id"));
String a=null;
if(id==1)
{ 
sql ="SELECT * FROM apn_info";
}
else if(id==2){
	String name=(String)session.getAttribute("Name");
	sql ="SELECT * FROM apn_info where dname='"+name+"'";
}
else {
	String name=(String)session.getAttribute("Name");
	a=" where pname='"+name+"'";
	sql ="SELECT * FROM apn_info"+a;
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
		<div id="app">		
			<div class="app-content">
				
						
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">管理手术</h1>
																	</div>
						</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white">
						
							<div class="row">
								<div class="col-md-12">
									<h5 class="over-title margin-bottom-15">手术<span class="text-bold">历史</span></h5>
									<p style="color:red;">
									<table class="table table-hover" id="sample-table-1">
										<thead>
											<tr>
											
											
	<th><b>病人名称</b></th>				
	<th><b>医生名称</b></th>
	<th><b>类别</b></th>	
	<th><b>日期</b></th>	
	<th><b>具体时间</b></th>	
											</tr>
<%
try{ 
	
connection = DriverManager.getConnection(connectionUrl+dbName+"?serverTimezone=UTC", userId, password);
statement=connection.createStatement();

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
</thead>
<tbody>
<tr>

<td><%=resultSet.getString("pname") %></td>
<td><%=resultSet.getString("dname") %></td>
<td><%=resultSet.getString("spec") %></td>
<td><%=resultSet.getString("apdate") %></td>
<td><%=resultSet.getString("aptime")%></td>

							
</tr>
<% 
}

} catch (Exception e) {
e.printStackTrace();
System.out.println("asasdf");
}
%>
											
										</tbody>
									</table>
								</div>
							</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		
	</body>
</html>
