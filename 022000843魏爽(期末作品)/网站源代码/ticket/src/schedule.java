import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/schedule")
public class schedule extends HttpServlet {
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
         
        String movieId = request.getParameter("movieId");
        String screen = request.getParameter("screen");
        String slot = request.getParameter("slot");
         
        System.out.println("movie: " + movieId);
        System.out.println("genere: " + screen+" "+slot);
 
        try
        {
          String myDriver = "com.mysql.jdbc.Driver";
          String myUrl = "jdbc:mysql://localhost:3306/ticket";
          Class.forName(myDriver);
          Connection conn = DriverManager.getConnection(myUrl, "root", "haosql");
          String query = " insert into shows (MId, screen, slot, booked)"
            + " values (?, ?, ?, ?);";

          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setInt(1, Integer.parseInt(movieId));
          preparedStmt.setInt(2, Integer.parseInt(screen));
          preparedStmt.setInt(3, Integer.parseInt(slot));
          preparedStmt.setInt(4, 0);

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