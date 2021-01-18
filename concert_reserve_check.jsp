<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
	//List to save reserved seat information.
	List<String> list = new ArrayList<>();

	if(application.getAttribute("complete_list") != null) {
		list = (List<String>)application.getAttribute("complete_list");
	}

	//사용자가 예매를 희망하는 좌석정보가 들어있는 배열.
	String[] seat = request.getParameterValues("seat");
	
	//예약 선점여부를 확인할 로직
	//예약 확정 전에 임시로 좌석정보를 저장할 리스트.
	List<String> temp = new ArrayList<>();
	
	//몇자리를 예약할 수 있는지의 여부를 체크할 변수.
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
		<h2>콘서트 예매 처리 결과</h2>
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
