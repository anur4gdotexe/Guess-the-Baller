package JavaProject01;

import java.io.*;
import java.sql.*;
import java.util.*;

public class getKeySet {
	
	List<String> getResultSet(int kId) throws IOException, ClassNotFoundException, SQLException {
		
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\eclipse-workspace EE\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);		
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select PName, PClub, PLeague, PPosition, PCountry, "
				+ "PAge from main where PId='"+kId+"'");
		rs.next();
		
		List<String> result = new ArrayList<String>();
	    for (int i=1; i<=6; i++) {
			result.add(rs.getString(i));
		}
	    
	    ResultSet rs1 = st.executeQuery("Select PPicture from images where PId='"+kId+"'");
	    rs1.next();
	    result.add(rs1.getString(1));
		
		st.close();
		con.close();
		br.close();
		
		return result;
	}

}
