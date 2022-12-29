package com.java.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.beans.StudentBean;
import com.java.dao.StudentDao;
@WebServlet("/DueFee")
public class DueFee extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>查看学生</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navaccountant.jsp").include(request, response);
		out.println("<div class='container'>");
		
		out.print("<h1>应缴费用</h1>");
	
	
		List<StudentBean> list=StudentDao.getDues();
		out.println("<table class='table table-bordered table-striped'>");
		out.print("<tr><th>流水号</th><th>姓名</th><th>邮箱</th><th>性别</th><th>科目</th><th>应缴费用</th><th>已缴金额</th><th>额外罚款</th><th>地址</th><th>联系方式</th><th>编辑</th><th>删除</th>");
		for(StudentBean bean:list){
			out.print("<tr><td>"+bean.getRollno()+"</td><td>"+bean.getName()+"</td><td>"+bean.getEmail()+"</td><td>"+bean.getSex()+"</td><td>"+bean.getCourse()+"</td><td>"+bean.getFee()+"</td><td>"+bean.getPaid()+"</td><td>"+bean.getDue()+"</td><td>"+bean.getAddress()+"</td><td>"+bean.getContact()+"</td><td><a href='EditStudentForm?rollno="+bean.getRollno()+"'>编辑</a></td><td><a href='DeleteStudent?rollno="+bean.getRollno()+"'>删除</a></td></tr>");
		}
		out.println("</table>");
		
		out.println("</table>");
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	
	}

}
