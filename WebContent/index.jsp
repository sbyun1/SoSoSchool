<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
</head>
<body>
	<jsp:forward page = "main_controller.do?command=main"></jsp:forward> <!-- 추후 메인페이지로 이동해야함 -->
</body>




</html>

