<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	//List to save reserved seat information.
	List<String> list = new ArrayList<>();

	if(application.getAttribute("complete_list") != null) {
		list = (List<String>)application.getAttribute("complete_list");
	}

	//List with seating information the user wishes to reserve.
	String[] seat = request.getParameterValues("seat");
	
	//A List to temporarily save the seating information before reservation is complete.
	List<String> temp = new ArrayList<>();
	
	//Checking how many seats people can reserve. 
	int count = 0;
	for(String s : seat) {
		if(list.contains(s)) {
			break;
		} else {
			temp.add(s);
			count++;
		}
	}
	
	if(count == seat.length) {
		list.addAll(temp);
	}
	
	application.setAttribute("complete_list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h2>Concert Ticket Reservation Result</h2>
		<p>
			Your seat <br>
			<%
				for(String s : seat) {
					out.println("<b>[" + s + "]</b>");
				}
			%>
			<br>has been reserved.
		</p>
		<p>
			Reservation result: <%= (count == seat.length) ? "Success" : "Fail" %>
			<br>
			<% if(count != seat.length) { %>
				The seat you want to reserve has been booked already.
			<% } %>
			<br>
			<a href="concert_reserve.jsp">Make another reservation</a>
		</p>
		
	</div>
</body>
</html>
