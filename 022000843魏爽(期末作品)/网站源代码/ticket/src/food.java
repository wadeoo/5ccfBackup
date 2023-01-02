import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/food")
public class food extends HttpServlet {
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	response.setCharacterEncoding("UTF-8");
         
    	int foodcost=0;
        String foodId = request.getParameter("id");
        if(foodId.equals("food1")){
        	foodcost=100;
        }
        else if(foodId.equals("food2")){
        	foodcost=150;
        }
        else if(foodId.equals("food3")){
        	foodcost=200;
        }
        try
        {
        	int total= foodcost+book.cost;
        	PrintWriter writer = response.getWriter();
            String htmlRespone = "<html>"+"\n<head>\n"
              		+ "  <meta charset=\"UTF-8\">\n"
              		+ "</head>"; ;   
            htmlRespone += "<center><div style='border:1px solid black; border-radius:3px; width:400px;'><h2>账单</h2><hr><br/><h3>票: " + book.cost + "</h3><h3>套餐: " + foodcost + "</h3><hr><h3>总计: " + total + "</h3><br></div></center>"; 

            htmlRespone+="</html>";
            writer.println(htmlRespone);
            htmlRespone="<br><center><br><a href='user.jsp'><button>返回</button></a></center>";
            writer.println(htmlRespone);
         }
        catch (Exception e)
        {
          System.err.println("出错!");
          System.err.println(e.getMessage());
        }
      
    }
 
}