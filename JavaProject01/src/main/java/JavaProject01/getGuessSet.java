package JavaProject01;

import java.io.*;
import java.sql.*;
import java.util.*;

public class getGuessSet {
	
	Boolean isNull(String gName) throws IOException, ClassNotFoundException, SQLException {
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\git\\guess-the-Baller\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);		
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select PId from main where PName like'%"+gName+"%'");
		
		Boolean result;
		if(!rs.next()) {
			result = true;
		}
		else {
			result = false;
		}
		
		br.close(); st.close(); con.close();
		return result;
	}
	
	List<String> getResultSet(String gName) throws IOException, ClassNotFoundException, SQLException {
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\git\\guess-the-Baller\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);		
		
		Statement st = con.createStatement();
		
		ResultSet rs = st.executeQuery("Select PName, PClub, PLeague, PPosition, PCountry, "
				+ "PAge from main where PName like'%"+gName+"%'");
		rs.next();
		
		List<String> result = new ArrayList<String>();
	    for (int i=1; i<=6; i++) {
			result.add(rs.getString(i));
		}
	    
	    ResultSet rs1 = st.executeQuery("Select PPicture from images where PName like '%"+gName+"%'");
		rs1.next();
		result.add(rs1.getString(1));
		
		st.close();
		con.close();
		br.close();
		
		return result;
	}

}
