<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>更新信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.js">
    <link rel="stylesheet" href="newser.css">
</head>
<body >
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Name = (String)session.getAttribute("Name");
String userID=null;
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "hospital_database";
String userId = "root";
String password = "haosql";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
  <!--new user register page-->
<div class="new">
        <form class="ui form" method="post" action="successupdate.jsp?Name=<%=Name%>">
        <br><br>
        <h1>用户 | 更新信息</h1><br>
                <h3 class="ui dividing header">填入信息</h3>
                <div class="field">
                  <div class="two fields">
                    <div class="field">
                    <%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName+"?serverTimezone=UTC", userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM patients_info where name='"+Name+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
                    
                  <label>姓名</label>
                      <input type="text" name="name" placeholder="姓名" value="<%=resultSet.getString("name") %>">
                    </div>
                    <div class="field">
                    
                  <label>密码</label>
                      <input type="text" name="pwd" placeholder="密码" value="<%=resultSet.getString("password") %>">
                    </div>
                   
                  </div>
                </div>
                <div class="two fields">
                  <div class="field">
                    <label>电话</label>
                    <input type="number" name="pno" placeholder="电话" value="<%=resultSet.getString("contact_no") %>">
                    
                  </div>
                  <div class="field">
                    <label for="">邮箱</label>
                    <input type="text" name="pemail" placeholder="邮箱" value="<%=resultSet.getString("email") %>">
                  </div>
                </div>
                <div class= "three fields">
                    <div class="field">
                  <label>地址</label>
                    <input type="text" name="street" placeholder="街道" value="<%=resultSet.getString("street") %>">
                    </div>
                    <div class=" field">
                      <label for="">地区</label>
                      <input type="text" name="area" placeholder="地区" value="<%=resultSet.getString("locality") %>">
                    </div>
                    <div class="field">
                      <label for="">社保卡号</label>
                      <input type="number" name="aadhar" placeholder="社保卡号" value="<%=resultSet.getString("aadhar") %>">
                    </div>
                 
                </div>
                <div class="two fields">
                  <div class="field">
                    <label>省份</label>
                    <select class="ui fluid dropdown" name="state">
                      <option value="<%=resultSet.getString("state") %>" >省份</option>
                  <option value="福建">福建</option>
                  <option value="广东">广东</option>
                  <option value="浙江">浙江</option>
                  <option value="江西">江西</option>
                  <option value="新疆">新疆</option>
                    </select>
                  </div>
                  <div class="field">
                    <label>国家</label>
                   <div class="field">
                    
                    <select class="ui fluid dropdown" name="country">
                      <option value="<%=resultSet.getString("country") %>">国家</option>
                  <option value="中国">中国</option>
                    </select>
                  </div>
                     </div>
                  </div>
                  <%
}

} catch (Exception e){
e.printStackTrace();
}
%>
               <center><a href="successupdate.jsp">
                   <button  class="ui green button">提交</button></a>
                  
                   </center>
                    
       
              </form>
            </div>  
</body>
</html>