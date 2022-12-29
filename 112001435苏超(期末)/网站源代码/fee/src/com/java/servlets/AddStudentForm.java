package com.java.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AddStudentForm")
public class AddStudentForm extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>添加学生</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navaccountant.jsp").include(request, response);
		out.println("<div class='container'>");
		
		
		HttpSession session=request.getSession(false);
		
		if(session==null||session.getAttribute("accountant")==null){
			out.println("<h1>你不是财务人员</h1>");
			request.getRequestDispatcher("AccountantLoginForm.jsp").include(request, response);
		}else{
			request.getRequestDispatcher("AddStudentForm.jsp").include(request, response);
		}
		
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

}
