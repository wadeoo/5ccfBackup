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

@WebServlet("/EditAccountantForm")
public class EditAccountantForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		AccountantBean bean=AccountantDao.getRecordById(id);
		
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>编辑财务人员</title>");
		out.println("<link rel='stylesheet' href='resources/bootstrap.min.css'/>");
		out.println("<link rel='stylesheet' href='style.css'/>");
		out.println("</head>");
		out.println("<body>");
		request.getRequestDispatcher("navadmin.jsp").include(request, response);
		out.println("<div class='container'>");
		
		out.print("<h1>编辑财务人员界面</h1>");
		out.print("<form action='EditAccountant' method='post'>");
		out.print("<table>");
		out.print("<tr><td><input type='hidden' name='id' value='"+bean.getId()+"' /></td></tr>");
		out.print("<tr><td>姓名:</td><td><input type='text' name='name' value='"+bean.getName()+"'/></td></tr>");
		out.print("<tr><td>邮箱:</td><td><input type='email' name='email' value='"+bean.getEmail()+"'/></td></tr>");
		out.print("<tr><td>密码:</td><td><input type='text' name='password' value='"+bean.getPassword()+"'/></td></tr>");
		out.print("<tr><td>地址:</td><td><textarea name='address' style='width:300px;height:100px;'>"+bean.getAddress()+"</textarea></td></tr>");
		out.print("<tr><td>联系方式:</td><td><input type='text' name='contact' value='"+bean.getContact()+"'/></td></tr>");
		out.print("<tr><td colspan='2' align='center'><input type='submit' value='更新财务人员' class='btn btn-default'/></td></tr>");
		out.print("</table>");
		out.print("</form>");
		out.println("</div>");
		request.getRequestDispatcher("footer.jsp").include(request, response);
		out.println("</body>");
		out.println("</html>");
		
		
		out.close();
	}

}
