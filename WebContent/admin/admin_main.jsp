<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
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
    section{
        min-width: 1190px;
        display: flex;
		flex-wrap: wrap;
        justify-content: center;
		align-items: center;
    }
	#title_form{
		min-width: 100%;
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	#top_form{
		width: 1180px;
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	#bottom_form{
		width: 1170px;
		height: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.button_form{
		width: 390px;
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	
	}
	button{
		width: 200px;
		height: 50px;
		font-size: 20px;
		font-weight: bold;
		background-color: rgb(173,175,255);
		border: 0;
		outline: 0;
		color: white;
		border-radius: 10px;
		cursor:pointer;
	}
 </style>   
<body>
<header>
	 <img src = "../img/logo.png">
</header>
<section>
	<div id="title_form">
		<h1>관리자 페이지</h1>
	</div>
	<div id="top_form">
		<div class="button_form">
			<button onclick = "location.href='../admin_controller.do?command=admin_notice'">공지사항 관리</button>
		</div>
		<div class="button_form">
			<button onclick = "location.href='../admin_controller.do?command=admin_qna'">QNA 관리</button>
		</div>
		<div class="button_form">
			<button>자료실 추가</button>
		</div>
	</div>
	<div id="bottom_form">
		<div class="button_form">
			<button onclick="location.href='../admin_controller.do?command=group'">소모임 추가</button>
		</div>
		<div class="button_form">
			<button onclick="location.href='../admin_controller.do?command=changestar'">상품 추가</button>
		</div>
		<div class="button_form">
			<button>회원관리 추가</button>
		</div>
	</div>
	<div style="width: 1190px; height: 100%; display: flex; flex-wrap: wrap; justify-content: center; align-items: center">
		<button onclick="location.href='../login_controller.do?command=logout'">로그아웃</button>
	</div>
</section>
</body>
</html>