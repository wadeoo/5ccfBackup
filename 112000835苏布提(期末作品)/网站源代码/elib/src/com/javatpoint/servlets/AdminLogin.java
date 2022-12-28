package com.javatpoint.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>管理员部分</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body style=\"background-color:green;\">");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		if(email.equals("admin@admin.com")&&password.equals("admin")){
			HttpSession session=request.getSession();
			session.setAttribute("admin","true");
			
			request.getRequestDispatcher("navadmin.jsp").include(request, response);
			request.getRequestDispatcher("admincarousel.jsp").include(request, response);
			
		}else{
			request.getRequestDispatcher("navhome.jsp").include(request, response);
			out.println("<div class='container'>");
			out.println("<h3>用户名或密码错误</h3>");
			request.getRequestDispatcher("adminloginform.jsp").include(request, response);
			out.println("</div>");
		}
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
