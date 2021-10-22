<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer_form</title>

<style type="text/css">
	#footer_1{
		min-width: 100%;
		height: 50px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	#footer_2{
		min-width: 100%;
		min-height: 100px;
		display: flex;
		justify-content: center;
	}

	

</style>

</head>
<body>
     <div id = "footer_1">
        이용약관 | 저작권 | 개인정보 | 이용문의
    </div>
    <div id="footer_2">
        Copyright (C) 2021 soso school Corporation all rights reserved.<br><br>
        회사명: sosoSchool | 대표:테스트1234 | 주소: 서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
        T: 1544-9970 / F: 02-562-2378
    </div>
	
</body>
</html>