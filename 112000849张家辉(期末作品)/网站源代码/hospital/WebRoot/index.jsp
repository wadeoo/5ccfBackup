<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>医院管理系统</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/responsiveslides.min.js"></script>
		  <script>
		 
			    $(function () {
			
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 1600,
			        speed: 600
			      });
			});
		  </script>
		  <style>
		  
p.sansserif {
    font-family: Arial, Helvetica, sans-serif;
}
.Box-body:last-of-type {
 border-style:solid;
 border-color:black;
    border-bottom-left-radius: 2px;
    border-bottom-right-radius: 2px;
    margin-bottom: -1px;
     border-width:1px;
}
.markdown-body {
    font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol;
    font-size: 16px;
    line-height: 1.5;
    word-wrap: break-word;
}
		  .div1 {
		  width:940px;
		  height:130px;
		 border-radius:10px;
		 border-style:outset;
		  Background-color: white;
		border-color:black;
		  border-width:5px;
		  
		  }
		  .p-6 {
    padding: 40px!important;
}
	 footer {
        position: relative;
        height: 90px;
        width: 100%;
        background-color: rgb(0, 128, 64);
    }

    p.copyright {
        position: absolute;
        width: 100%;
        color: #fff;
        line-height: 60px;
        font-size: 1em;
        text-align: center;
        bottom:0;
    }	  </style>
</head>
<body >
<div class="ui container first">
    <div class="ui center aligned white inverted segment">
        <font color="black"><h1 class="header" id="nam" style="height:300px;">医院管理系统</h1></font>
    </div>
  <div class="clear"> </div>
			<!--start-image-slider---->
					<div class="image-slider">
						<!-- Slideshow 1 -->
<!-- 					    <ul class="rslides" id="slider1">
					      <li><img src="images/slider-image1.jpg" alt=""></li>
					      <li><img src="images/slider-image2.jpg" alt=""></li>
					    </ul> -->
				
					</div>
					<!--End-image-slider---->
		    <div class="clear"> </div>
   <div class="ui  horizontal segments">
    <div class="ui  white inverted segment">
        <div class="admin">
            <div class="ui icon">
                    <i class=" large user  icon" style="color:black;"></i><div style="color:black;">管理员登录</div>
                    <a href="admin-login.jsp">
                   <button  class="ui yellow button">登录</button>
                    </a>
            </div>
        </div>
    </div> 
    <div class="doctor">
        <div class="ui white inverted segment">
            <div class="ui icon">
                <i class="ui large user md icon"></i><div style="color:rgb(255, 255, 255);">医生登录</div>
                <a href="Doclogin.jsp">
                    <button class="ui yellow button"> 登录</button>
                </a>
            </div>
        </div>
    </div>   
    <div class="ui  right aligned white inverted segment">   
        <div class="user">
            <div class="ui icon">
                <i class="ui  large users icon" style="color:black;"></i><div style="color:black;">病人登录</div>
                <a href="plogin.jsp">
                    <button class="ui yellow button">登录</button>
                </a>
            </div>
        </div>
   


    </div>  
  </div>   

  <div class="Box-body p-6">
        <article class="markdown-body entry-content" itemprop="text"><h1>医院管理系统</h1>
<p>
这是一个医院管理用户界面，用于管理、监控和控制医院的系统。
     本应用使用java开发，主要针对医院的基本操作，如添加新患者信息，
     并更新新信息，为患者分配医生。 它具有熟悉且经过深思熟虑的吸引人的在线用户界面，
     结合强大的管理能力。 项目后端采用MySQL设计，
     使用 HTML、CSS 和 Bootstrap 的 Java 和前端。<br>
</p>
</article>
</div>
  <br><br><footer>
    <p class="copyright">© 医院 | 版权所有.</p>
</footer>
</div>   

</body>
</html>