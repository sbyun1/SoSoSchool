<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>공지사항 내용</title>
</head>

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
    /*네비바*/
    nav{
        background-color: rgb(173,175,255);
        min-width: 100%;
        height: 50px;
        display: flex;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*본문 구역*/
    section{
        min-width: 1190px;
        display: flex;
        justify-content: center;
    }
    /*메뉴 리스트*/
    section .menuform{
        background-color: aliceblue;
        width: 210px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    section .menuform #menu{
        list-style: none;
        margin: 0px 0px auto auto;
        padding-left: 0px;
        font-size: 35px;
        font-weight: bold;
    }
    section .menuform #menu li{
        text-align: center;
        margin: 50px auto 50px auto;
    }
    section .menuform #menu .li_selec{
        font-size: 20px;
        border-radius: 45px;
        background-color:(173,175,255);
        width:180px;
    }
    /*메인 구역*/
    section .mainform{
        width: 750px;     /*메인 구역 전체 width값*/
        display: flex;
        flex-wrap: wrap;
        -ms-user-select: none;      /*드래그 금지*/
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
   
    section .mainform #mainlist{
        min-width: 750px;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
    }
    section .mainform #mainlist .title{
        width: 750px;
        height:150px;
        font-size: 50px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /*로그인 구역*/
    section .loginboard_form{
        width: 230px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    #container{
    	width: 750px;
    	display: flex;
    	justify-content: center;
    }
	.noti_table{
	
		text-align:center;
		width: 600px;
		border-collapse: collapse;
		border-top: 1px solid #444444;
		border:1px;
	}
    td{
   
    border-bottom: 1px solid #FAF0F4;
 
    }
    th{
    background-color:rgb(173,175,255);
   
    padding: 10px;
    }
    
    tr:nth-child(2n){
    background-color:#FBF4F5;
    }
    /*푸터*/
    footer{
        background-color:rgb(233,233,236);
        min-width: 100%;
        min-height: 150px;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
</style>
<script type="text/javascript">
	window.onload = function (){
		if(${userdto.user_id eq null}){
			alert("세션 만료");
			location.href='../main_controller.do?command=start';
		}
	}
</script>
<body>

<section>

<div class="mainform">
	<div id="mainlist" style="height:150px">
		<div class="title" style="width: 750px; height:200px">
			<img src = "../img/noti.png"
			style="width: 600px; height:150px; padding: 30px">	
		</div>
		<div id = "container">  
			<table class = "noti_table" border = "1">
				<tr>
				    <th>No.</th>
				    <td>${dto.noti_no }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.noti_regdate }</td>
				</tr>
				<tr>
				    <th>제목1</th>
				    <td>${dto.noti_title }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.noti_writer }</td>
				</tr>
				<tr>
					<th colspan = "2"> 공지사항</th>
					
				</tr>
				<tr>
					<td colspan = "2"
					style = "width: 300px; height:200px;">
					${dto.noti_content }
					</td>
				</tr>
		
				<tr>
					<td colspan = "2">
					<input type = "button" value = "목록" onclick = "location.href='../admin_controller.do?command=admin_notice'">
					<input type = "button" value = "수정" onclick = "location.href='../admin_controller.do?command=notice_updateform&noti_no=${dto.noti_no}'">
					<input type = "button" value = "삭제" onclick = "location.href='../admin_controller.do?command=notice_delete&noti_no=${dto.noti_no}'">
					
					</td>
		
		
		</tr>													
						
			</table>
		</div>			
	</div>
</div>

</section>

</body>
</html>