package com.hospdbms.pkg;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Doclogin
 */
@WebServlet(urlPatterns="/Doclogin")
public class Doclogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Doclogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String driverName = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "hospital_database";
		String userId = "root";
		String password = "haosql";
		String pwdd=null;
String dname=new String(request.getParameter("uname").getBytes("iso-8859-1"), "utf-8"); 
		String psswd=request.getParameter("pwd");
		try {
			Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				System.out.println("sadasd");
			e.printStackTrace();
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;
			try{ 
				connection = DriverManager.getConnection(connectionUrl+dbName+"?serverTimezone=UTC", userId, password);
				statement=connection.createStatement();
				String sql ="SELECT psswd FROM doc_info where dname='"+dname+"'";

				resultSet = statement.executeQuery(sql);
				while(resultSet.next()) {
				pwdd=resultSet.getString("psswd");
				}
		if(psswd.equalsIgnoreCase(pwdd))
		{	session.setAttribute("Name",dname);
			request.getRequestDispatcher("docpage.jsp").forward(request, response);
		}
	
		else {
			request.setAttribute("error", "用户名或密码错误.");
			request.getRequestDispatcher("Doclogin.jsp").forward(request, response);
	}
	}catch(SQLException e) { 
		System.out.println("kkrk");
		e.printStackTrace();
	}
			}}
