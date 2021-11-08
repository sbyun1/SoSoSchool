<%@ page import="java.util.List" %>
<%@ page import="group.groupDto" %>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    @font-face {
        font-family: 'GowunDodum-Regular';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body{
        margin: 0;
        padding: 0;
        min-width: 1190px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
        min-height: 650px;
        font-family: 'GowunDodum-Regular';
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*헤더*/
    header{
        min-width: 100%;
        height: 120px;
        display: flex;
        align-items: center;        /*가운데 정렬*/
        justify-content: center;    /*가운데 정렬*/
        -ms-user-select: none;      /*드래그 금지*/
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    section{
        min-width: 1190px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    #title_form{
        width: 1190px;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #board_form{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    button{
        width: 100px;
        height: 50px;
        font-size: 20px;
        font-weight: bold;
        background-color: rgb(173,175,255);
        border: 0;
        outline: 0;
        color: white;
        border-radius: 10px;
    }
    .title{
        width : 200px;
        height : 100%;
    }
    input{
     font-family: 'GowunDodum-Regular';
    }
    .noti_table{
	
		text-align:center;
		width: 1100px;
		border-collapse: collapse;
		border-top: 1px solid #444444;
		border:none;
	}
    td{
    border:none;
    border-bottom: 1px solid #FAF0F4;
 
    }
    th{
    background-color:rgb(173,175,255);
    border:none;
    padding: 10px;
    }
    
    tr:nth-child(2n){
    background-color:#FBF4F5;
    }
     #write_btn{
    	width: 200px;
    	height:50px;
    	background-color:rgb(173,175,255);
    	border:none;
    	border-radius: 20px;
    	font-size: 15pt;
    	margin-top: 20px;
    	margin-left: 10px;
    	color:white;
    	cursor:pointer;
    }
 	#write_btn:hover{
 		background-color: #FBF4F5;
 		color: rgb(173,175,255);
 	
 	}
</style>
<title>공지사항 관리</title>
</head>
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin/admin_main.jsp'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">공지사항 관리</h1>
    </div>
    <div id="board_form">
        <div id="board_list">
			<table class = "noti_table" border = "1">
				<col width = "100px"><col width = "350px"><col width = "100px"><col width = "100px">
				<tr>
				    <th style = "border-top-left-radius:20px">No.</th>
				    <th>제목</th>
				    <th>작성자</th>
				    <th style = "border-top-right-radius:20px">작성일</th>
				</tr>
				<c:choose>
					<c:when test = "${empty list }">
						<tr>
							<td colspan = "4">======== 공지사항이 없습니다. =========</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items = "${list }" var = "dto">
							<tr>
								<td>${dto.noti_no }</td>											
								<td><a href = "admin_controller.do?command=notice_detail&noti_no=${dto.noti_no }">${dto.noti_title }</a></td>
								<td>${dto.noti_writer }</td>
								<td>${dto.noti_regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test = "${userdto.user_type == 'ADMIN' }">
				<tr>
					<td colspan = "4"
					style = "border:none; background-color:#ffffff">
						<input type = "button" id = "write_btn" value = "공지사항 작성" onclick = "location.href='admin_controller.do?command=notice_writeform'">
					</td>
				</tr>
				</c:when>
				</c:choose>
			</table>


        </div>

    </div>
</section>
</body>
</html>