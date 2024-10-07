package JavaProject01;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class randomTestServlet extends HttpServlet{
	
	Random ran = new Random();
	int kId = ran.nextInt(1,62);
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, 
	ServletException {
		
		PrintWriter out = response.getWriter();
		String PName = request.getParameter("guess");
		
		getGuessSet get_gs = new getGuessSet();
		compareKeyAndGuess crag = new compareKeyAndGuess();

		try {
			if(!get_gs.isNull(PName)) 
			{
				request.setAttribute("IS NULL", "NO");
				
				List<String> gSet = get_gs.getResultSet(PName);
				request.setAttribute("GUESS SET", gSet);
			
				int[] compArray = crag.getCompArray(PName, kId);
				request.setAttribute("COMPARISON ARRAY", compArray);
			
				RequestDispatcher view = request.getRequestDispatcher("randomTest.jsp");
				view.forward(request, response);
			}
			
			else {
				request.setAttribute("IS NULL", "YES");
				
				request.setAttribute("GUESS SET", null);
				request.setAttribute("COMPARISON ARRAY", null);
				
				RequestDispatcher view = request.getRequestDispatcher("randomTest.jsp");
				view.forward(request, response);
			}
			
		} catch (ClassNotFoundException | IOException | SQLException e) {
			RequestDispatcher view = request.getRequestDispatcher("errorPage.html");
			view.forward(request, response);
		}
		
	}
}