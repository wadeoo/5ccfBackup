<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String dname=new String(request.getParameter("dname").getBytes("iso-8859-1"), "utf-8"); 
	String date=request.getParameter("date");
	String time=request.getParameter("time");
String dspec=new String(request.getParameter("dspec").getBytes("iso-8859-1"), "utf-8"); 
String pname=new String(request.getParameter("pname").getBytes("iso-8859-1"), "utf-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database?serverTimezone=UTC","root","haosql"); 
Statement st= con.createStatement(); 
st.executeUpdate("insert into apn_info values ('"+pname+"','"+dname+"','"+dspec+"','"+date+"','"+time+"')"); 
%>
<br><br>
<b><center>成功</center></b><br>
<center><a href="patientpage.jsp">返回</a></center><br>
<center><a href="/hospital">主页</a></center><br>

</body>
</html>