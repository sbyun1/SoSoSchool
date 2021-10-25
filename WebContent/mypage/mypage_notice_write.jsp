<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>



<body>
	<form action = "../mypage_controller.do"method = "post">
		<input type = "hidden" name = "command" value = "notice_write">
		<table class = "noti_write_table" border = "1">
				
				<tr>
				    <th>제목</th>
				    <td><input type = "text" name = "notice_title"></td>
				</tr>

				<tr>
					<th>공지사항</th>
					<td><textarea cols = "60" rows = "10" name = "notice_content"></textarea> </td>
				</tr>
		
				<tr>
					<td colspan = "2">
					<input type = "submit" value = "작성">
					<input type = "button" value = "취소" onclick = "location.href='/mypage_controller.do?command=mypage_notice'">
				</td>
	
		</tr>													
				 


			</table>
	
	
	</form>
	
	
	
	
	
	
</body>
</html>