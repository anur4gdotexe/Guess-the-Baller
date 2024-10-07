package JavaProject01;

import java.io.IOException;
import java.sql.SQLException;

public class checkRegsValidity {

		//String username, email, phone, password, invalid;

		String checkValidity(String[] paramValues) throws ClassNotFoundException, IOException, SQLException {
			
			String invalid = null;
			
			String email = paramValues[0];
			String username = paramValues[1];
			String age = paramValues[2];
			String password = paramValues[3];
			
			//check if already a user present
			regsDB rd = new regsDB();
			if(rd.alreadyAUser(email, username)) {
				return ("Username/Email has been already used!");
			}
			
			//constraints for email
			if (!email.contains("@") || !email.contains(".com")) {
				return("email does not contain @ or .com");
			}
			
			if(email.indexOf(".com") - email.indexOf('@') < 2) {
				return("invalid format for an email (should be abc@xyz.com)");
			}
			
			//constraint for username
			if (username.length() < 6) {
				return("username cannot be shorter than 6 characters");
			}

			//constraint for password
			if (password.length() < 6) {
				return("password cannot be shorter than 6 characters");
			}
			
			//age constraints
			for(int i=0; i<age.length(); i++) {
				if (age.charAt(i) < '0' || age.charAt(i) >'9') {
					return("invalid format for age");
				}
			}
			if(Integer.parseInt(age) < 13) {
				return("age must be at least 13");
			}
			if(Integer.parseInt(age) > 110) {
				return("the tech guy isn't dumb");
			}
			
			return invalid;
		}
}
