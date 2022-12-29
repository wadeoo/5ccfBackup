<%@page import="dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品详情</title>
<link rel="stylesheet" href="css/detail.css" />
<link rel="stylesheet" href="css/menu.css" />
<style type="text/css">
#main {
	width: 1060px;
	padding: 0;
	margin-left: auto;
	margin-right: auto;
}

#head {
	height: 200px;
	background-color: #F5F5F5;
	border: 1px solid #CDCDCD;
	margin-bottom: 5px;
	margin-top: 5px;
}

#head-link {
	height: 50px;
	line-height: 30px;
	border: 1px solid #CDCDCD;
	background-color: #F5F5F5;
	margin-bottom: 5px;
	clear: both;
}

#content {
	width: 1060px;
	min-height: 430px;
	border: 1px solid #CDCDCD;
	float: left;
	margin-bottom: 5px;
	clear: both;
}

#footer {
	height: 50px;
	clear: both;
	border: 1px solid #CDCDCD;
	background-color: #F8F8FF;
	margin-bottom: 5px;
}
</style>
</head>
<body>

	<%
		String ma_san_pham = "";
		if (request.getParameter("ma_san_pham") != null) {
			ma_san_pham = request.getParameter("ma_san_pham");
		}

		ProductDAOImpl productDAO = new ProductDAOImpl();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumFractionDigits(0);
	%>
	<div id="main">
		<div id="head">
			<img src="images/banner.jpg" width="1057px" height="200px" />
		</div>
		<%
		
			String username = null;
				Cookie[] cookies = request.getCookies();
				if(cookies !=null)
				{
				for(Cookie cookie : cookies)
				{
				    if(cookie.getName().equals("username")) 
				    	username = cookie.getValue();
				}
				}
				
				
			if (username != null) {
		%>
		<div id="head-link">
			<div id='menungang'>
				<ul>
					<li class='last'><a href="index.jsp"><span>主页</span></a></li>
					<li class='last'><a href="#"><span>产品</span></a></li>
					<li class='last'><a href="cart.jsp"><span>购物车</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>查找</span></a></li>
					<li class='last' style="float: right;"><a href="LogoutServlet"><span>登出</span></a></li>
					<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username %></span></a></li>
					
				</ul>
			</div>
		</div>
		<%
			} else {
		%>
		<div id="head-link">
			<div id='menungang'>
				<ul>
					<li class='last'><a href="index.jsp"><span>主页</span></a></li>
					<li class='last'><a href="#"><span>产品</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>查找</span></a></li>
					<li class='last' style="float: right;"><a href="register.jsp"><span>注册</span></a></li>
					<li class='last' style="float: right;"><a href="login.jsp"><span>登录</span></a></li>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		<div id="content">

			<div class="left-1">
				<img
					src="sanpham/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getHinh_anh()%>"
					width="200px" height="200px" />
			</div>
			<div class="left-2">
				<table>
					<tr class="row1">
						<td class="col2" colspan="2"
							style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getTen_san_pham()%></td>
					</tr>
					<tr class="row2">
						<td class="col1">生产标识</td>
						<td class="col2"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getHang_san_xuat()%></td>
					</tr>

					<tr class="row2">
						<td class="col1">售价:</td>
						<td class="col2"><%=nf.format(productDAO.getProduct(Integer.parseInt(ma_san_pham))
					.getGia_ban()) %> RMB</td>
					</tr>

				</table>
			</div>
			<% if(username != null) { %>
			<div
				style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
				<a
					href="#"><img
					src="images/giohang.png" /></a>
				<form action="GioHangServlet" method="post">
					<input type="number" min="1" value="1" name="soluong"/>
					<input type="hidden" value="setCart" name="command"/>
					<input type="hidden" value="<%=ma_san_pham %>" name="ma_san_pham"/>
					<input type="submit" value="添加到购物车">
				</form>	
			</div>
			<%} else { %>
			<div
				style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
				<a
					href="login.jsp"><img
					src="images/giohang.png" /></a>
			</div>
			<%} %>
			<div class="left-3">
				<article> <input type="checkbox" id="read_more"
					role="button"> <label for="read_more" onclick=""
					style="width: 770px; margin-left: 150px; margin-right: auto;"><span>详情信息</span> <span>关闭</span></label> <section>
				<table>

					<!-- thong tin chung -->
					<tr rowspan="2">
						<td class="detail-1">细节</td>
						<td class="detail-2">热销</td>
					</tr>


				</table>
				</section> </article>
			</div>

		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>
