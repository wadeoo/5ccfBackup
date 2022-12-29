<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/taglib139.tld" prefix="pg"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品</title>
<link rel="stylesheet" href="css/product.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
</head>
<body>
	<pg:paging pageSize="4">
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
					<li class='last'><a href="product.jsp"><span>产品</span></a></li>
					<li class='last'><a href="cart.jsp"><span>购物车</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>查找</span></a></li>
					<li class='last' style="float: right;"><a href="LogoutServlet"><span>登出</span></a></li>
					<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%=username%></span></a></li>
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
					<li class='last'><a href="product.jsp"><span>产品</span></a></li>
					<li class='last'><a href="search_page.jsp"><span>查找</span></a></li>
					<li class='last' style="float: right;"><a href="register.jsp"><span>登录</span></a></li>
					<li class='last' style="float: right;"><a href="login.jsp"><span>登录</span></a></li>
				</ul>
			</div>
		</div>
		<%
			}
		%>
			
			<div id="content_center" >

<%
					ProductDAOImpl productDAO = new ProductDAOImpl();
	
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
				%>

				<div id="site-wrapper-p" style="float: left; margin-left: 120px">
					<ul class="products homepage">
					
								<%	for (Product p : productDAO.getList()) {
						%>
						<pg:item>
							<li class="preorder"><span class="tagimg "></span> <a
								href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
									src="sanpham/<%=p.getHinh_anh()%>" width=" 250px"
									height="250px" />
									<h3><%=p.getTen_san_pham()%></h3>
									<h4>
										价格:
										<%=nf.format(p.getGia_ban())%>
										RMB
									</h4> <span class="textkm">限时优惠! <strong>500.000rmb</strong>
								</span>
									<p class="info">
										<span>生产标识: <%=p.getHang_san_xuat()%></span> <span>价格:
											<%=nf.format(p.getGia_ban())%> RMB</span> <span>状态 <%=p.getThong_tin()%>
									</p>
							</a></li>
						</pg:item>
						<%
							}
								
						%>
					</ul>
				</div>

			<div id="footer" align= "center">
				<pg:index>
					<pg:page></pg:page>
				</pg:index>
			</div>
		</div>
	</pg:paging>

</body>
</html>