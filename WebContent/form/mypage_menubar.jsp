<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
    #menu{
        list-style: none;
        margin: 0px 0px auto auto;
        padding-left: 0px;
        font-size: 35px;
        font-weight: bold;
    }
    #menu li{
        text-align: center;
        margin: 50px auto 50px auto;
    }
    #menu .li_selec{
        font-size: 20px;
    }
</style>
<body>
<ul id="menu">
    <li style="margin-left: 10px">마이페이지1</li>
    <li class="li_selec"><a onclick="location.href='../mypage_controller.do?command=mypage_checkscore&user_id=${userdto.user_id}'">나의 학습 현황</a></li>
    <li class="li_selec"><a onclick="location.href='../mypage_controller.do?command=mypage_changestar'">상품교환</a></li>
    <li class="li_selec"><a onclick="location.href='../mypage_controller.do?command=mypage_notice'">공지사항</a></li>
    <li class="li_selec"><a onclick="location.href='../mypage_controller.do?command=mypage_qna'">고객문의(Q&A)<a/></li>
    <li class="li_selec"><a onclick="location.href='../mypage_controller.do?command=mypage_userinfo'">회원 정보 수정/탈퇴</a></li>
    <li class="li_selec">결제 관리</li>
</ul>
</body>
</html>