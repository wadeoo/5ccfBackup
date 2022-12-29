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
@WebServlet("/EditStudentForm")
public class EditStudentForm extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String srollno=request.getParameter("rollno");
		int rollno=Integer.parseInt(srollno);
		StudentBean bean=StudentDao.getRecordByRollno(rollno);
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>学生编辑界面</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navaccountant.jsp").include(request, response);
		out.println("<div class='container'>");
		
		out.print("<h1>学生编辑界面</h1>");
		out.print("<form action='EditStudent' method='post'>");
		out.print("<table>");
		out.print("<tr><td><input type='hidden' name='rollno' value='"+bean.getRollno()+"'/></td></tr>");
		out.print("<tr><td>姓名:</td><td><input type='text' name='name' value='"+bean.getName()+"'/></td></tr>");
		out.print("<tr><td>邮箱:</td><td><input type='email' name='email' value='"+bean.getEmail()+"'/></td></tr>");
		out.print("<tr><td>性别:</td><td><input type='text' name='sex' value='"+bean.getSex()+"'/></td></tr>");
		out.print("<tr><td>科目:</td><td><input type='text' name='course' value='"+bean.getCourse()+"'/></td></tr>");
		out.print("<tr><td>应缴费用:</td><td><input type='number' name='fee' value='"+bean.getFee()+"'/></td></tr>");
		out.print("<tr><td>已缴金额:</td><td><input type='number' name='paid'  value='"+bean.getPaid()+"'/></td></tr>");
		out.print("<tr><td>额外罚款:</td><td><input type='number' name='due'  value='"+bean.getDue()+"'/></td></tr>");
		out.print("<tr><td>地址:</td><td><textarea name='address' style='width:300px;height:100px;'>"+bean.getAddress()+"</textarea></td></tr>");
		out.print("<tr><td>联系方式:</td><td><input type='text' name='contact' value='"+bean.getContact()+"'/></td></tr>");
		out.print("<tr><td colspan='2' align='center'><input type='submit' value='更新学生信息'/></td></tr>");
		out.print("</table>");
		out.print("</form>");
		
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
				
		out.close();
	}

}
