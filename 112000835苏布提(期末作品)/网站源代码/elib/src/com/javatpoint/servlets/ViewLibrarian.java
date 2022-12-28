package com.javatpoint.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatpoint.beans.LibrarianBean;
import com.javatpoint.dao.LibrarianDao;
@WebServlet("/ViewLibrarian")
public class ViewLibrarian extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>查看会员</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body style=\"background-color:green;\">");
		
		request.getRequestDispatcher("navadmin.jsp").include(request, response);
		out.println("<div class='container'>");
		
		List<LibrarianBean> list=LibrarianDao.view();
		
		out.println("<table class='table table-bordered table-striped'>");
		out.println("<tr><th>Id</th><th>姓名</th><th>邮箱</th><th>密码</th><th>电话</th><th>编辑</th><th>删除</th></tr>");
		for(LibrarianBean bean:list){
			out.println("<tr><td>"+bean.getId()+"</td><td>"+bean.getName()+"</td><td>"+bean.getEmail()+"</td><td>"+bean.getPassword()+"</td><td>"+bean.getMobile()+"</td><td><a href='EditLibrarianForm?id="+bean.getId()+"'>编辑</a></td><td><a href='DeleteLibrarian?id="+bean.getId()+"'>删除</a></td></tr>");
		}
		out.println("</table>");
		
		out.println("</div>");
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
		
	}
}
