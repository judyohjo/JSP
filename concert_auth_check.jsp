<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Authentication code the user inserted
	String code = request.getParameter("code");
	//Randomly selected authentication code
	String aCode = (String)session.getAttribute("auth_code");

	if(code.equals(aCode)) {
		session.setAttribute("auth_pass", true);
		response.sendRedirect("concert_reserve.jsp");
	} else {
%>
	<script type="text/javascript">
		alert("The authentication code doesn't match. Please try again.");
		history.back();
	</script>
<% } %>




