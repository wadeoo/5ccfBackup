package com.javatpoint.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javatpoint.dao.LibrarianDao;
@WebServlet("/LibrarianLogin")
public class LibrarianLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>会员部分</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body style=\"background-color:green;\">");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		if(LibrarianDao.authenticate(email, password)){
			HttpSession session=request.getSession();
			session.setAttribute("email",email);
			
			request.getRequestDispatcher("navlibrarian.jsp").include(request, response);
			request.getRequestDispatcher("librariancarousel.jsp").include(request, response);
			
		}else{
			request.getRequestDispatcher("navhome.jsp").include(request, response);
			out.println("<div class='container'>");
			out.println("<h3>用户名或密码错误</h3>");
			request.getRequestDispatcher("librarianloginform.jsp").include(request, response);
			out.println("</div>");
		}
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
