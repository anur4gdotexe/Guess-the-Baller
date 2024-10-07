package JavaProject01;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

public class loginServlet extends HttpServlet{
	public void service (HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		String[] paramValues = request.getParameterValues("login");
		regsDB rd = new regsDB();
		
		try {
			if(!rd.checkEntry(paramValues[0], paramValues[1])) {
				String res = "Credentials didn't match. Try again.";
				request.setAttribute("VALIDITY", res);
				
				RequestDispatcher view = request.getRequestDispatcher("login.jsp");
				view.forward(request, response);
			}
			else {
				RequestDispatcher view = request.getRequestDispatcher("theGame.jsp");
				view.forward(request, response);
			}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			RequestDispatcher view = request.getRequestDispatcher("errorPage.html");
			view.forward(request, response);
		}
	}
}
