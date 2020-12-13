<%@page import="com.web.bo.UserBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		long id = Long.parseLong(session.getAttribute("subx").toString());
	session.setAttribute("subx", id);
	UserBO ubx = UserBO.getSession(id);
	%>

	<jsp:useBean id="x" class="com.web.entity.User" scope="request" />
	<jsp:setProperty property="*" name="x" />
	<%
		x.setId(ubx.getId());
	x.setUsername(ubx.getUser().getUsername());
	x.setBalance(Double.parseDouble(request.getParameter("balance")));
	ubx.updateUser(x);
	%>
	<jsp:forward page="../view/dashboard.jsp" />

</body>
</html>