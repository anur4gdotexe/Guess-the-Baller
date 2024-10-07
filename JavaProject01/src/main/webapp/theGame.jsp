<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="theGame.css" />

</head>

<body>

	<%!ArrayList<List<String>> setOfgSets = new ArrayList<List<String>>();
	int[] finalArray = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
			-1};
	int index = 0;
	Boolean win = false;

	String[] pClubLogos = {"", "", "", "", "", ""};
	String[] pLeagueLogos = {"", "", "", "", "", ""};
	String[] pCountryLogos = {"", "", "", "", "", ""};
	String[] pPositions = {"", "", "", "", "", ""};
	String[] pAges = {"", "", "", "", "", ""};
	String pImg = "<img src='Logos/icons/playersilhouette(2).png' id='img' style='opacity: 0.9'>";
	String key, pName = "<xyz style='opacity: 0.8'>[PLAYER'S NAME]</xyz>", 
			pClub = "<img src='Logos/icons/clubicon.png' id='icon' style='opacity:0.8'/>", 
			pLeague = "<img src='Logos/icons/leagueicon.png' id='icon' style='opacity:0.8'/>", 
			pPosition = "<xyz style='opacity: 0.8'>[POS]</xyz>", 
			pCountry = "<img src='Logos/icons/countryicon.png' id='icon' style='opacity:0.8'/>", 
			pAge = "<xyz style='opacity: 0.8'>[AGE]</xyz>";%>
	
	<%
	try{
		%>
	<%
	int[] tempArray = (int[]) request.getAttribute("COMPARISON ARRAY");
	if (tempArray != null) {
		int count = 0;
		for (int i = 0; i < tempArray.length; i++) {
			finalArray[index++] = tempArray[i];
			count += tempArray[i];
		}

		if (count == 5) {
			//WIN
			win = true;
		} else {
			key = (String) request.getAttribute("KEY");
		}
	}
	%>

	<%
	List<String> gSet = (List<String>) request.getAttribute("GUESS SET");
	int pClubLogoIndex = 0, pLeagueLogoIndex = 0, pCountryLogoIndex = 0, pPositionIndex = 0, pAgeIndex = 0;

	if (gSet != null) {
		setOfgSets.add(gSet);
	}
	if (setOfgSets != null) {
		Iterator it = setOfgSets.iterator();
		while (it.hasNext()) {
			List<String> tempSet = (List<String>) it.next();

			String pClubLogo = tempSet.get(1).toLowerCase().replaceAll(" ", "");
			pClub = "<img src='Logos/pClubLogos/" + pClubLogo + ".png'>";
			pClubLogos[pClubLogoIndex] = pClub;
			pClubLogoIndex++;

			String pLeagueLogo = tempSet.get(2).toLowerCase().replaceAll(" ", "");
			pLeague = "<img src='Logos/pLeagueLogos/" + pLeagueLogo + ".png'>";
			pLeagueLogos[pLeagueLogoIndex] = pLeague;
			pLeagueLogoIndex++;
			
			pPositions[pPositionIndex] = tempSet.get(3).replaceAll(" ", "");
			pPositionIndex++;

			String pCountryLogo = tempSet.get(4).toLowerCase().replaceAll(" ", "");
			pCountry = "<img src='Logos/pCountryLogos(1)/" + pCountryLogo + ".png'>";
			pCountryLogos[pCountryLogoIndex] = pCountry;
			pCountryLogoIndex++;
			
			pAges[pAgeIndex] = tempSet.get(5).replaceAll(" ", "");;
			pAgeIndex++;

			pImg = tempSet.get(6);
			pName = tempSet.get(0);
			pPosition = tempSet.get(3);
			pAge = tempSet.get(5);
		}
	}
	%>
	<script src="https://kit.fontawesome.com/73b4dfce18.js" crossorigin="anonymous"></script>
	<div class="left">
		<br> <br> <br>
		<table>
			<tr>
				<th id="club"><img src="Logos/icons/clubicon.png" id="icon" /></th>
				<th id="league"><img src="Logos/icons/leagueicon.png" id="icon" /></th>
				<th id="pos"><img src="Logos/icons/posicon.png" id="icon" /></th>
				<th id="country"><img src="Logos/icons/countryicon.png" id="icon" /></th>
				<th id="age"><img src="Logos/icons/ageicon.png" id="icon" /></th>
			</tr>
			<tr>
				<td id="cell0" class="na"><%=pClubLogos[0]%></td>
				<td id="cell1" class="na"><%=pLeagueLogos[0]%></td>
				<td id="cell2" class="na"><ttext><%=pPositions[0]%></ttext></td>
				<td id="cell3" class="na"><%=pCountryLogos[0]%></td>
				<td id="cell4" class="na"><ttext><%=pAges[0]%></ttext></td>
			</tr>
			<tr>
				<td id="cell5" class="na"><%=pClubLogos[1]%></td>
				<td id="cell6" class="na"><%=pLeagueLogos[1]%></td>
				<td id="cell7" class="na"><ttext><%=pPositions[1]%></ttext></td>
				<td id="cell8" class="na"><%=pCountryLogos[1]%></td>
				<td id="cell9" class="na"><ttext><%=pAges[1]%></ttext></td>
			</tr>
			<tr>
				<td id="cell10" class="na"><%=pClubLogos[2]%></td>
				<td id="cell11" class="na"><%=pLeagueLogos[2]%></td>
				<td id="cell12" class="na"><ttext><%=pPositions[2]%></ttext></td>
				<td id="cell13" class="na"><%=pCountryLogos[2]%></td>
				<td id="cell14" class="na"><ttext><%=pAges[2]%></ttext></td>
			</tr>
			<tr>
				<td id="cell15" class="na"><%=pClubLogos[3]%></td>
				<td id="cell16" class="na"><%=pLeagueLogos[3]%></td>
				<td id="cell17" class="na"><ttext><%=pPositions[3]%></ttext></td>
				<td id="cell18" class="na"><%=pCountryLogos[3]%></td>
				<td id="cell19" class="na"><ttext><%=pAges[3]%></ttext></td>
			</tr>
			<tr>
				<td id="cell20" class="na"><%=pClubLogos[4]%></td>
				<td id="cell21" class="na"><%=pLeagueLogos[4]%></td>
				<td id="cell22" class="na"><ttext><%=pPositions[4]%></ttext></td>
				<td id="cell23" class="na"><%=pCountryLogos[4]%></td>
				<td id="cell24" class="na"><ttext><%=pAges[4]%></ttext></td>
			</tr>
		</table>
		<form method="get" action="theGameServlet">
			<input type="text" name="guess" id="guessInp" placeholder="type here" 
			onfocus="this.placeholder=''" autocomplete="off"></input>
			<input type="submit" id="submit">
			<p id="invalid">
				<%
				String isNull = (String) request.getAttribute("IS NULL");
				if (isNull != null) {
					if (isNull.compareTo("YES") == 0) {
				%><%="No record found!"%>
				<%
				}
				}
				%>
			</p>
		</form>
		<br>
	</div>

	<div class="right">
		<br> <br> <br>
		<div class="profile">
			<img src="Logos/icons/bg03.jpg" id="bg" />
			<%
			if (pImg != null) {
			%><%=pImg%>
			<%
			}
			%>
			<table>
				<tr>
					<td colspan=5 id="head"><name> <b><%=pName%></b></name></td>
				</tr>
				<tr>
					<td id="lb"><%	if (pClub != null) {%><%=pClub%><%}%></td>
					<td><%	if (pLeague != null) {%><%=pLeague%><%}%></td>
					<td><%	if (pCountry != null) {%><%=pCountry%><%}%></td>
					<td type="text"><b> <%  if (pPosition != null) {%><%=pPosition%><%}%></b></td>
					<td id="rb" type="text"><b> <%  if (pAge != null) {%><%=pAge%><%}%></b></td>		
				</tr>	
			</table>
		</div>
		<br> <br> <br> <br>
	</div>

	<div class="make-up"></div>
	<div class="footer">
		<p class="footer-menu">
			<b> <a href="errorPage.html">About</a> 
			<a href="errorPage.html">Help</a> 
			<a href="errorPage.html">Terms</a> 
			<a href="errorPage.html">Contact</a> 
			<a href="errorPage.html"><i class="fa-brands fa-x-twitter"></i></a>
			<a href="errorPage.html"><i class="fa-brands fa-threads"></i></a>
			<a href="errorPage.html"><i class="fa-brands fa-facebook"></i></a>
			<a href="errorPage.html"><i	class="fa-brands fa-instagram"></i></a>
			</b>
		</p>
		<p class="final">
			© XYZ Limited. Data from <a href="https://www.fifaindex.com">FIFAIndex</a>.
			Icons by <a href="https://fontawesome.com">fontawesome</a>, 
					 <a href="https://flaticon.com">flaticon</a>, 
					 <a href="https://cdn.countryflags.com">countryflags</a>.
		</p>
	</div>
	<%
	for (int i = 0; i < index; i++) {
		int value = finalArray[i];
	%>

	<script>
			var i = "<%=i%>";

		var id = "cell".concat(i);
		var cell = document.getElementById(id);

		if (
	<%=value%>
		== 1) {
			cell.setAttribute("Class", "matches");
		} else if (
	<%=value%>
		== 0) {
			cell.setAttribute("Class", "notmatches");
		} else if (
	<%=value%>
		== -1) {
			cell.setAttribute("Class", "na");
		}
	</script>
	<%}%>
	<%
	}
	catch(Exception e){
		response.sendRedirect("errorPage.html");
	}
	
	%>
	<!-- winscreen -->
	<div class="winscreenbg" id="winscreen">
		<img
							src="https://wallpapers.com/images/hd/plain-black-background-02fh7564l8qq4m6d.jpg"
							id="bg">
		<div class="winscreen">
		<br>
			<img src="https://acegif.com/wp-content/gif/confetti-49.gif" id="gif"
								id="bg"> <i class="fa-solid fa-trophy" id="trophy"></i>
			<p>
				Congratulations! <br>You Win!<br>
			
							<p id="small">
				+3 <i class="fa-regular fa-face-smile-wink"></i>
				<button type="button" class="btn cancel" onclick="closeWinScreen()">
					<i class="fa-solid fa-arrow-left-long"></i>
				</button>
			</p>
			</p>
		</div>
	</div>

	<!-- defscreen -->
	<div class="defscreenbg" id="defscreen">
		<img src="https://wallpapers.com/images/hd/plain-black-background-02fh7564l8qq4m6d.jpg" id="bg">
		<div class="defscreen">
			<br>
			<p>
				So close, yet so far... <br>Better luck next time!<br>
			
			<p id="small">
				<br> <br> <br>
				<key>[Key: </key><%=key%><key>]</key>
			</p>
			</p>
			<button type="button" class="btn cancel" onclick="closeDefScreen()">
				<i class="fa-solid fa-arrow-left-long"></i>
			</button>
		</div>
	</div>
	
	<script>
		function closeWinScreen() {
			document.getElementById("winscreen").style.display = "none";
			document.getElementsByTagName("body")[0].style.overflow = "visible";
		}

		function closeDefScreen() {
			document.getElementById("defscreen").style.display = "none";
			document.getElementsByTagName("body")[0].style.overflow = "visible";
		}
	</script>
	
	<%
		if (index == 25 || win) {
			index -= 5;
			if (win) {
		%><script>
				document.getElementById("winscreen").style.display = "block";
				document.getElementsByTagName("body")[0].style.overflow = "hidden";
				document.getElementById("guessInp").style.display = "none";
				document.getElementById("submit").disabled = true;
			</script>
					<%
					} else {
					%>
			<script>
				document.getElementById("defscreen").style.display = "block";
				document.getElementsByTagName("body")[0].style.overflow = "hidden";
				document.getElementById("guessInp").style.display = "none";
				document.getElementById("submit").disabled = true;
			</script>
					<%
			}
		}
	%>
</body>
</html>