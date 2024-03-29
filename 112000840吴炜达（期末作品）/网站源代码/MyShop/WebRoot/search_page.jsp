<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
<link rel="stylesheet" href="css/product.css" />
</head>
<body>

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
					<li class='last' style="float: right;"><a href="register.jsp"><span>注册</span></a></li>
					<li class='last' style="float: right;"><a href="login.jsp"><span>登录</span></a></li>
				</ul>
			</div>
		</div>
		<%
			}
		%>
		<div id="content">
			<div id="left"><jsp:include page="search_menu.jsp"></jsp:include></div>
			<div id="right">
				<%
				
					ProductDAOImpl productDAO = new ProductDAOImpl();
						List<Product> list = new ArrayList<Product>();
						list = productDAO.getList();
						String ten_san_pham = "";
						String ten_the_loai = "";
						if (request.getParameter("ten_the_loai") != null && request.getParameter("ten_san_pham")!= null) {
					ten_the_loai = request.getParameter("ten_the_loai");
					ten_san_pham = request.getParameter("ten_san_pham");
						}
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
				%>
				<% String err = "";
				if (request.getAttribute("err") != null) {
					err = (String) request.getAttribute("err");%>
					<h3><%=err %></h3>
				<% } %>
				
				<%if(productDAO.searchList(ten_san_pham, ten_the_loai).size()==0 && err=="") {%>
					<h3>无结果</h3>
					<%} %>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">
					
						<%
							if (ten_the_loai != null || ten_san_pham != null) {
									for (Product p : productDAO.searchList(ten_san_pham, ten_the_loai)) {
						%>

						<li class="preorder"><span class="tagimg "> </span> <a
							href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img
								src="sanpham/<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
								<h3><%=p.getTen_san_pham()%></h3>
								<h4>
									价格:
									<%=nf.format(p.getGia_ban())%>
									RMB
								</h4> <span class="textkm">限时优惠! <strong>500.000rmb</strong>
							</span>
								<p class="info">
									<span>生产标识: <%=p.getHang_san_xuat()%>
									</span> <span>价格: <%=nf.format(p.getGia_ban())%> RMB
									</span> <span>状态 <%=p.getThong_tin()%>
								</p>
						</a></li>

						<%
							}
								} else {%>
									<h3> 输入关键字 </h3>
								<%}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>

</body>
</html>