package com.java.dao;
import java.sql.*;
public class DB {
public static Connection getCon(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fee","root","haosql");
	}catch(Exception ex){System.out.println(ex);}
	return con;
}
}
