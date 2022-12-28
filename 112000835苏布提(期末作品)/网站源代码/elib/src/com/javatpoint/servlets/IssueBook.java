package com.javatpoint.servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatpoint.beans.BookBean;
import com.javatpoint.beans.IssueBookBean;
import com.javatpoint.dao.BookDao;
@WebServlet("/IssueBook")
public class IssueBook extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.println("<head>");
		out.println("<title>添加书籍</title>");
		out.println("<link rel='stylesheet' href='bootstrap.min.css'/>");
		out.println("</head>");
		out.println("<body style=\"background-color:green;\">");
		request.getRequestDispatcher("navlibrarian.jsp").include(request, response);
		
		out.println("<div class='container'>");
		String callno=request.getParameter("callno");
		String studentid=request.getParameter("studentid");
		String studentname=request.getParameter("studentname");
		String sstudentmobile=request.getParameter("studentmobile");
		long studentmobile=Long.parseLong(sstudentmobile);
		
		IssueBookBean bean=new IssueBookBean(callno,studentid,studentname,studentmobile);
		int i=BookDao.issueBook(bean);
		if(i>0){
			out.println("<h3>申请成功</h3>");
		}else{
			out.println("<h3>对不起,暂时无法申请	</h3><p>请过一会重试</p>");
		}
		out.println("</div>");
		
		
		request.getRequestDispatcher("footer.html").include(request, response);
		out.close();
	}

}
