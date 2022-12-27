<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>手术删除</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String name=request.getParameter("uname");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_database?serverTimezone=UTC","root","haosql"); 
Statement st= con.createStatement(); 
String sql = "delete from patients_info where name="+name;

try{

 st.executeUpdate(sql);
 
} catch (SQLException e) {
  e.printStackTrace();
}
%>
<br><br>
<b><center>成功删除</center></b><br>
<center><a href="mangptnts.jsp"><button value="Back">返回</button></a></center>
</body>
</html>