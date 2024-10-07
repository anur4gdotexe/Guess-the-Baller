package JavaProject01;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.*;

public class regsFormServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		PrintWriter out = response.getWriter();
		String[] rDetails = request.getParameterValues("regs");
		
		checkRegsValidity crv = new checkRegsValidity();
		regsDB rd = new regsDB();
		
		try {
			String invalidDetail = crv.checkValidity(rDetails);
			if (invalidDetail != null) {
				request.setAttribute("INVALID DETAIL", invalidDetail);
				RequestDispatcher view = request.getRequestDispatcher("regsForm.jsp");
				view.forward(request, response);
			}
			else {
				rd.addUser(rDetails);
				
				RequestDispatcher view = request.getRequestDispatcher("theGame.jsp");
				view.forward(request, response);
			}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			RequestDispatcher view = request.getRequestDispatcher("errorPage.html");
			view.forward(request, response);
		}
	}
}
