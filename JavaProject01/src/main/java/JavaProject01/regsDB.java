package JavaProject01;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

public class regsDB {
	
	//void addUser(String[] paramValues)
	//Boolean checkEntry(String uname, String pass);
	//Boolean alreadyAUser(String uname, String email);
	
	void addUser(String[] paramValues) throws IOException, ClassNotFoundException, SQLException {
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\eclipse-workspace EE\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		
		Statement st = con.createStatement();
		st.executeUpdate("insert into users (email, username, age, password) values ('"+paramValues[0]+"','"
						+paramValues[1]+"','"+Integer.parseInt(paramValues[2])+"','"+paramValues[3]+"')");
		
		st.close(); 
		con.close();
		br.close();
	}	
	
	Boolean checkEntry(String uname, String pass) throws IOException, ClassNotFoundException, SQLException {
		Boolean isValid = false;
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\eclipse-workspace EE\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select password from users where username='"+uname+"'");
		
		if (rs.next()) {
			if (rs.getString(1).compareTo(pass)==0) {
				isValid = true;
			}
		}
		
		st.close(); 
		con.close();
		br.close();
		return isValid;
	}
	
	Boolean alreadyAUser(String email, String uname)throws IOException, ClassNotFoundException, SQLException {
		Boolean alreadyAUser = false;
		BufferedReader br = new BufferedReader(new FileReader(
				"C:\\Users\\Hi\\eclipse-workspace EE\\JavaProject01\\src\\jdbcCon.txt"));
		String url = br.readLine();
		String username = br.readLine();
		String password = br.readLine();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("Select * from users where username='"+uname+"' OR email='"+email+"'");
		
		if (rs.next()) {
			alreadyAUser = true;
		}
		
		st.close(); 
		con.close();
		br.close();
		return alreadyAUser;
	}
}