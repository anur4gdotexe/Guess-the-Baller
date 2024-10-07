package JavaProject01;

import java.io.*;
import java.sql.*;
import java.util.*;

public class compareKeyAndGuess {
	
	int[] getCompArray(String gName, int kId) throws IOException, ClassNotFoundException, SQLException {
		
		//creating instance of getKeySet & getGuessSet class
		getKeySet get_ks = new getKeySet();
		getGuessSet get_gs = new getGuessSet();
		
		//getting key and guess sets
		List<String> kSet = get_ks.getResultSet(kId);
		List<String> gSet = get_gs.getResultSet(gName);
		
		//comparing the two results
		int[] compArray = new int[5];
		for (int i=1; i<=4; i++) {
			if (gSet.get(i).equals(kSet.get(i))) {
				compArray[i-1] = 1;  //--assigning 1 to matching fields
			}
			else {
				compArray[i-1] = 0;  //--assigning 0 to not matching fields
			}
		}
		
		//-- check if ages of both players are within same range of fives or not
		int kAge = Integer.parseInt(((String) kSet.get(5)).strip());
		int gAge = Integer.parseInt(((String) gSet.get(5)).strip());
		
		if (Math.floorDiv(kAge, 5) == Math.floorDiv(gAge, 5)) {
			compArray[4] = 1;
		}
		else {
			compArray[4] = 0;
		}
		return compArray;
	}
}
