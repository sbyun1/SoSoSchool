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
<h1>문의글 수정</h1>
	<form action = "../mypage_controller.do" method = "post">
		<input type = "hidden" name = "command" value = "qna_update">
		<input type = "hidden" name = "qna_no" value = "${dto.qna_no }">
		
		<table border = "1">
			<tr>
				<th>제목</th>
				<td><input type = "text" name = "qna_title" value = "${dto.qna_title }"></td>
			</tr>
			
			<tr>
				<th>문의내용</th>
				<td><textarea cols = "60" rows = "10" name = "qna_content">${dto.qna_content }</textarea></td>
			</tr>
			
			<tr>
				<td colspan = "3">
					<input type = "submit" value = "수정완료">
					<input type = "button" value = "취소" onclick = "location.href='mypage_controller.do?command=qna_detail&qna_no=${dto.qna_no}'">
					
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>