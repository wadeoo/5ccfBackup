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
String pswd=request.getParameter("pwd");
String country=new String(request.getParameter("country").getBytes("iso-8859-1"), "utf-8"); 
	String aadhar=request.getParameter("aadhar");
String locality=new String(request.getParameter("area").getBytes("iso-8859-1"), "utf-8"); 
String street=new String(request.getParameter("street").getBytes("iso-8859-1"), "utf-8"); 
	String pemail=request.getParameter("pemail");
	String pno=request.getParameter("pno");
String state=new String(request.getParameter("state").getBytes("iso-8859-1"), "utf-8"); 
String name=new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8"); 
	Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database?serverTimezone=UTC","root","haosql"); 
Statement st= con.createStatement(); 
st.executeUpdate("insert into patients_info values ('"+name+"','"+pemail+"',"+pno+",'"+street+"','"+locality+"', '"+aadhar+"','"+state+"','"+country+"','"+pswd+"')"); 
%>
<br><br>
<b><center>成功</center></b><br>
<center><a href="plogin.jsp">返回登录界面</a></center><br>
<center><a href="/hospital">主页</a></center>

</body>
</html>