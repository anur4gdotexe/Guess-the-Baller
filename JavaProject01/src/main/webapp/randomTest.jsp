<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
table {
	margin: auto;
}

table, th, td {
	border: 10px solid white;
	border-collapse: collapse;
}

td {
	height: 50px;
	width: 50px;
	padding: 5px;
	margin: 50px
}

td.na {
	background-color: #D5D8DC;
}

td.matches {
	background-color: #2ECC71;
}

td.notmatches {
	background-color: #E74C3C;
}
img{
	height: 50px;
	horizontal-align: center;
	margin: auto;
}
.pImg{
	height: 400px;
}
</style>
</head>

<body>

<%!	
	ArrayList<List<String>> setOfgSets = new ArrayList<List<String>>();
	int[] finalArray = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
			-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };
	int index = 0;
	Boolean win = false;
	
	String[] pClubLogos = {"","","","","",""};
	String[] pLeagueLogos = {"","","","","",""};
	String[] pCountryLogos = {"","","","","",""};
	String pImg = "";
%>

<form action="testServlet" method="post">
	Enter your guess<br>
	<input type="text" name="guess"></input>
	<input type="submit" style="visibility: hidden"><br>
</form>

<%	
	int[] tempArray = (int[])request.getAttribute("COMPARISON ARRAY");
	if (tempArray != null){
		int count = 0;
		for (int i=0; i<tempArray.length; i++){
			finalArray[index++] = tempArray[i];
			count += tempArray[i];
		}
		
		if (count == 5){
			//WIN
			win = true;
		}
		if (index == 25 || win){
			String final_res;
			if(win){
				final_res = "<p style='font-size: 100px; color: green;background-color:black;" 
					+"width:100%; position: absolute; top:0px; text-align: center'>YOU WINNNNNN</p>";
			}
			else{
				final_res = "<p style='font-size: 100px; color: red;background-color:black; " 
					+"width:100%position: absolute; top:0px; text-align: center'>LOSER!</p>";
			}
			out.println(final_res);
		}
	}
%>

<%
	List<String> gSet = (List<String>)request.getAttribute("GUESS SET");
	int pClubLogoIndex = 0, pLeagueLogoIndex = 0, pCountryLogoIndex = 0;
	
	if (gSet != null){
		setOfgSets.add(gSet);
	}
	if (setOfgSets != null){
		Iterator it = setOfgSets.iterator();
		while (it.hasNext()){
			List<String> tempSet = (List<String>)it.next();
			
			String pClubLogo = tempSet.get(1).toLowerCase().replaceAll(" ", "");
			String pClub = "<img src='Logos/pClubLogos/"+pClubLogo+".png'>";
			pClubLogos[pClubLogoIndex] = pClub;
			pClubLogoIndex++;
			
			String pLeagueLogo = tempSet.get(2).toLowerCase().replaceAll(" ", "");
			String pLeague = "<img src='Logos/pLeagueLogos/"+pLeagueLogo+".png'>";
			pLeagueLogos[pLeagueLogoIndex] = pLeague;
			pLeagueLogoIndex++;
			
			String pCountryLogo = tempSet.get(4).toLowerCase().replaceAll(" ", "");
			String pCountry = "<img src='Logos/pCountryLogos/"+pCountryLogo+".png'>";
			pCountryLogos[pCountryLogoIndex] = pCountry;
			pCountryLogoIndex++;
			
			pImg = tempSet.get(6);
		}
	} 
%>
<%
	String isNull = (String)request.getAttribute("IS NULL");
	if (isNull != null){	
		if (isNull.compareTo("YES")==0){
			%><%="OOPS! NO RECORD FOUND"%><%
		}
	}

%>
LET'S SEE IF IT WORKS<br>

<table>
	<tr>
		<td id="cell0" class="na"><%= pClubLogos[0] %></td>
		<td id="cell1" class="na"><%= pLeagueLogos[0] %></td>
		<td id="cell2" class="na"></td>
		<td id="cell3" class="na"><%= pCountryLogos[0] %></td>
		<td id="cell4" class="na"></td>
	</tr>
	<tr>
		<td id="cell5" class="na"><%= pClubLogos[1] %></td>
		<td id="cell6" class="na"><%= pLeagueLogos[1] %></td>
		<td id="cell7" class="na"></td>
		<td id="cell8" class="na"><%= pCountryLogos[1] %></td>
		<td id="cell9" class="na"></td>
	</tr>
	<tr>
		<td id="cell10" class="na"><%= pClubLogos[2] %></td>
		<td id="cell11" class="na"><%= pLeagueLogos[2] %></td>
		<td id="cell12" class="na"></td>
		<td id="cell13" class="na"><%= pCountryLogos[2] %></td>
		<td id="cell14" class="na"></td>
	</tr>
	<tr>
		<td id="cell15" class="na"><%= pClubLogos[3] %></td>
		<td id="cell16" class="na"><%= pLeagueLogos[3] %></td>
		<td id="cell17" class="na"></td>
		<td id="cell18" class="na"><%= pCountryLogos[3] %></td>
		<td id="cell19" class="na"></td>
	</tr>
	<tr>
		<td id="cell20" class="na"><%= pClubLogos[4] %></td>
		<td id="cell21" class="na"><%= pLeagueLogos[4] %></td>
		<td id="cell22" class="na"></td>
		<td id="cell23" class="na"><%= pCountryLogos[4] %></td>
		<td id="cell24" class="na"></td>
	</tr>
</table>
<%
	for (int i=0; i<index; i++){
		int value = finalArray[i];

		%>  
		
		<script>
			var i = "<%=i%>";
			
			var id = "cell".concat(i);
			var cell = document.getElementById(id);
			
			if (<%=value%>==1){
				cell.setAttribute("Class", "matches");
			}
			else if (<%=value%>==0){
				cell.setAttribute("Class", "notmatches");
			}
			else if (<%=value%>==-1){
				cell.setAttribute("Class", "na");	
			}
		</script>  
		<%
	}
%>
<%=pImg %>
</body>
</html>