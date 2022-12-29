package com.java.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.beans.StudentBean;
import com.java.dao.StudentDao;
@WebServlet("/SearchStudent")
public class SearchStudent extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String srollno=request.getParameter("rollno");
		int rollno=Integer.parseInt(srollno);
		StudentBean bean=StudentDao.getRecordByRollno(rollno);
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>学生查找</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navaccountant.jsp").include(request, response);
		out.println("<div class='container'>");
		
	
		out.println("<h1>学生查找</h1>");
		
		if(bean.getRollno()>0){
		out.println("<table class='table table-bordered table-striped'>");
		out.print("<tr><td>流水号:</td><td>"+bean.getRollno()+"</td></tr>");
		out.print("<tr><td>姓名:</td><td>"+bean.getName()+"</td></tr>");
		out.print("<tr><td>邮箱:</td><td>"+bean.getEmail()+"</td></tr>");
		out.print("<tr><td>性别:</td><td>"+bean.getSex()+"</td></tr>");
		out.print("<tr><td>科目:</td><td>"+bean.getCourse()+"</td></tr>");
		out.print("<tr><td>应缴费用:</td><td>"+bean.getFee()+"</td></tr>");
		out.print("</table>");
		}else{
			out.println("<p>无结果符合 "+rollno+"</p>");
		}
		
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
