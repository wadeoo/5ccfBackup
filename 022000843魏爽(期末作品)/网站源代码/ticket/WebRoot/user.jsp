<%@ page import="com.mysql.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title >光华电影院</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<nav class="navbar navbar-inverse" style="margin-bottom:0px;" >
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="user.jsp" style="font-size: 20px;"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp光华电影院</b></a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-user"></span><b> 管理员</b></a></li>
    </ul>
  </div>
</nav>

<body style="background-color:rgb(229, 229, 229);">


  <div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">管理员登录</h4>
          </div>
          <div class="modal-body">
            
            <form action="login" method="POST">
        <input type="text" name="Username" placeholder="用户名">
        &nbsp
        <input type="password" name="Password" placeholder="密码">
        <input type="submit" class="btn btn-danger">
    </form>



          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>
    </div>
  </div>
<center>

<div id="carousel-example-generic" class="carousel slide container-fluid" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/mo3.jpg" alt="..." style="width:1920px; height:625px;">
      <div class="carousel-caption">
        <b>电影 1</b>
      </div>
    </div>
    <div class="item">
      <img src="images/mo2.jpg" alt="..." style="width:1920px;height:625px;">
      <div class="carousel-caption">
       <b>电影 2</b>
      </div>
    </div>
    <div class="item">
      <img src="images/mo1.jpg" alt="..." style="width:1920px;height:625px;">
      <div class="carousel-caption">
      <b>电影 3</b>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">上一页</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">下一页</span>
  </a>
</div>
<br>
<br>
<br>
<form action="book" method="post">
<div>

  <div class="container" style="float:left; margin-left:150px;">
    <table class="table table-hover">
        <thead>
            <tr>
            <th>选择</th>
                <th>电影</th>
                <th>放映时段</th>
                <th>时长</th>
                <th>荧屏号</th>
                <th>剩余席数</th>
            </tr>
        </thead>
        <tbody>


            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ticket", "root", "haosql");
                Statement stmt = null;
                Statement stmt2 = null;
                stmt = conn.createStatement();
                stmt2 = conn.createStatement();
                String query = "select * from shows";
                ResultSet rs = null;
                rs = stmt.executeQuery(query);
                while(rs.next()){
            %>
            
                <%
                    
                    int id = rs.getInt("id");
                  int Mid = rs.getInt("Mid");
                  int screen = rs.getInt("screen");
                  int slot = rs.getInt("slot");
                  int avail = rs.getInt("booked");
                  String query2 = "select title, duration from moviedatabase where id="+Mid;
                  ResultSet rs2 = null;
                    rs2 = stmt2.executeQuery(query2);
                    String moviename=null;
                    int duration=0;
                    boolean a=true;
                    while(a && rs2.next()){
                      moviename = rs2.getString("title");
                      duration= rs2.getInt("duration");
                      a=false;
                    }
                    int start=0, end=0;
                    if(slot==1){
                      start=9;
                      end=1;
                    }
                    else if(slot==2){
                      start=1;
                      end=5;
                    }
                    else if(slot==3){
                      start=5;
                      end=9;
                    }
                    if(screen==1){
                    	avail=100-avail;
                    }
                    if(screen==2){
                    	avail=150-avail;
                    }
                    if(screen==3){
                    	avail=200-avail;
                    }
                
                %>
                
                <tr>
                <td><input type="radio" value=<%=id %> name="id"></td>
                <td><%=moviename %></td>
                <td><%=start %> 至 <%=end %></td>
                <td><%=duration %> 分钟</td>
                <td><%=screen %></td>
                <td><%=avail %></td>
            </tr>               

            <%      
                }
            %>

        </tbody>
    </table>
  </div>
</div>

<div class="testbox3"  style="float:left; margin-left:600px;">
        <h1>买票</h1>
       

          <input type="number" name="num" placeholder="数量">
          <br />
          <select name="class"">
              <option value="silver">银座 - 人民币100</option>
              <option value="gold">金座 - 人民币150</option>
              <option value="platinum">白金 - 人民币200</option>
        </select>
          <br /><br />
          <input class="btn btn-danger" type="submit" value="购买">
      
</div>
</form>
</center>



</body>

<style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td { 
  padding:0;
  margin:0;}

body,
input,
textarea,
select {
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  color: #4c4c4c;
}

h1 {
  font-size: 32px;
  font-weight: 300;
  color: #4c4c4c;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}

.testbox3 {
  /*margin: 20px auto;*/
  width: 300px; 
  /*height: 330px;*/ 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #ebebeb; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  border: solid 1px #cbc9c9;
}

.testbox3{
  height: 185px; 
}
form{
  margin: 0 30px;
}

input[type=text],input[type=password]{
  width: 200px; 
  height: 39px; 
  -webkit-border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  -moz-border-radius: 0px 4px 4px 0px/0px 0px 4px 4px; 
  border-radius: 0px 4px 4px 0px/5px 5px 4px 4px; 
  background-color: #fff; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.09); 
  border: solid 1px #cbc9c9;
  margin-left: -5px;
  margin-top: 13px; 
  padding-left: 10px;
}

input[type=password]{
  margin-bottom: 25px;
}

</style>
</html>