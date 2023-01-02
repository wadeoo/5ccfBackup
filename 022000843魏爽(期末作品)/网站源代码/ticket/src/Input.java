
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/userinput")
public class Input extends HttpServlet {
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
         
        String movieName=new String(request.getParameter("movieName").getBytes("ISO-8859-1"),"UTF-8");
        String genere=new String(request.getParameter("genere").getBytes("ISO-8859-1"),"UTF-8");
        String duration=new String(request.getParameter("duration").getBytes("ISO-8859-1"),"UTF-8");
        String director=new String(request.getParameter("director").getBytes("ISO-8859-1"),"UTF-8");
         
        System.out.println("movie: " + movieName);
        System.out.println("genere: " + genere);
 
        try
        {
          String myDriver = "com.mysql.jdbc.Driver";
          String myUrl = "jdbc:mysql://localhost:3306/ticket";
          Class.forName(myDriver);
          Connection conn = DriverManager.getConnection(myUrl, "root", "haosql");
          String query = " insert into moviedatabase (title, genere, duration, director)"
            + " values (?, ?, ?, ?);";

          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString (1, movieName);
          preparedStmt.setString (2, genere);
          preparedStmt.setInt(3, Integer.parseInt(duration));
          preparedStmt.setString(4, director);

          preparedStmt.execute();
          
          conn.close();
          response.sendRedirect("options.jsp");
        }
        catch (Exception e)
        {
          System.err.println("³ö´í!");
          System.err.println(e.getMessage());
        }
			

         
    }
 
}