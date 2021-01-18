<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	UUID uuid = UUID.randomUUID();
	System.out.println(uuid.toString());
	
	String[] uuids = uuid.toString().split("-");
	System.out.println(Arrays.toString(uuids));
	System.out.println(uuids[1]);
	
	session.setAttribute("auth_code", uuids[1]);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Member Verification page</h2>
	<h1>Authentication code: <del><%= uuids[1] %></del></h1>
	<form action="concert_auth_check.jsp">
		<small>Please insert the authentication code.</small>
		<input type="text" name="code" size="5">
		<input type="submit" value="Submit">
	</form>
</body>
</html>
