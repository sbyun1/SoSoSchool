<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>답글달기</title>
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
    section .loginboard_form #loginboard{
        background-color: lightgrey;
        width: 230px;
        height: 190px;
        display: inline-flex;
        margin-top: 30px;
        border-radius: 5%;
       
    }
    section .loginboard_form #loginboard #imgform{
        display: flex;
        align-items: center;
        justify-content: center;
        min-width: 80px;
        height: 190px;
    }
    section .loginboard_form #loginboard #imgform #image img{
        width: 65px;
        height: 65px;
        border-radius: 33px;
        margin-left: 15px;
    }
    section .loginboard_form #loginboard #imgform #setting img{
        border-radius: 10px;
        margin-top: 20px;
    }
    section .loginboard_form #loginboard #right #textform{
        min-width: 150px;
        height: 120px;
        text-align: center;
        line-height: 30px;
        font-size: 15px;
        font-weight: bold;
    }
    section .loginboard_form #loginboard #right #textform #name{
        line-height: 40px;
        margin-top: 10px;
    }
    section .loginboard_form #loginboard #right #textform #location{
        line-height: 20px;
        margin-bottom: 15px;
    }
    section .loginboard_form #loginboard #right #textform #star{
        line-height: 15px;
    }
    section .loginboard_form #loginboard #right #logoutbuttonform{
        min-width: 150px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .loginboard_form #loginboard #right #logoutbuttonform button{
        background-color: gray;
        font-weight: bold;
        color: white;
        width: 100px;
        height: 30px;
        border-radius: 5%;
        border: 0;
        outline: 0;
    }
    #container{
    	width: 750px;
    	display: flex;
    	justify-content: center;
    }
	.noti_table{
		
		
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
<body>
<header>
     <img src = "../img/logo.png">
</header>
<nav>
    <%@ include file="../form/navi.jsp"%>
</nav>
<section>
<div class="menuform">
    <%@ include file="../form/mypage_menubar.jsp"%>
</div>
<div class="mainform">
	<div id="mainlist" style="height:150px">
		<div class="title" style="width: 750px; height:150px">
			답글달기	
		</div>
		<div id = "container">  
		<form action = "../mypage_controller.do" method = "post">
			<input type = "hidden" name = "command" value = "qna_reply">
			<input type = "hidden" name = "parentqna_no" value = "${parentqna.qna_no }">
			<table class = "qna_table" border = "1">
				
				<tr>
				    <th>제목</th>
				    <td><input type = "text" name = "qna_title" value = "RE:${parentqna.qna_title }"
				    readonly = "true"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type = "text" name = "qna_writer" value = "${dto.user_id }"
					readonly = "true"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols = "60" rows = "10" name = "qna_content"></textarea> </td>
				</tr>
		
				<tr>
					<td colspan = "2">
					<input type = "submit" value = "작성">
					<input type = "button" value = "취소" onclick = "location.href='mypage_controller.do?command=qna_detail+qna_no=${parentqna.qna_no}'">
					</td>
				</tr>														
			</table>
		</form>
		</div>			
	</div>
</div>
<div class="loginboard_form">
   <%@ include file="../form/logout.jsp"%>
</div>
</section>
<footer>
	<%@ include file="../form/footer.jsp"%>
</footer>
</body>
</html>