<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="controller"
		class="com.web.controller.ContactUsController" />

	<jsp:useBean id="mail" class="com.web.entity.MailDetail" />
	<jsp:setProperty property="*" name="mail" />

	<%
		controller.sendEmail(mail);
	%>
	<jsp:forward page="../view/index.html" />

</body>
</html>