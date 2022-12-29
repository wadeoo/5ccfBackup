package com.java.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.beans.AccountantBean;
import com.java.beans.StudentBean;
import com.java.dao.AccountantDao;
import com.java.dao.StudentDao;

@WebServlet("/AddAccountant")
public class AddAccountant extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>财务人员添加成功</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navadmin.jsp").include(request, response);
		out.println("<div class='container'>");
		
		String name=request.getParameter("name");
	 	String email=request.getParameter("email");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String contact=request.getParameter("contact");
		
		AccountantBean bean=new AccountantBean(name, email, password, address, contact);
		int status=AccountantDao.save(bean);
		
		out.print("<h1>财务人员添加界面</h1>");
		out.println("<p>财务人员添加成功</p>");
		request.getRequestDispatcher("AddAccountantForm.jsp").include(request, response);
		
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

}
