<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>고객문의</title>
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
    /*성적표*/
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

    .qna_table{
	
		text-align:center;
		width: 600px;
		border-collapse: collapse;
		border-top: 1px solid #444444;
		border:none;
	}
    td{
    border:none;
    border-bottom: 1px solid #FAF0F4;
    padding: 2px;
 
    }
    th{
    background-color:rgb(173,175,255);
    border:none;
    padding: 10px;
    }
    
    tr:nth-child(2n){
    background-color:#FBF4F5;;
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
     <%@ include file="/form/mypage_menubar.jsp"%>
</div>
<div class="mainform">
	<div id="mainlist" style="height:150px">
		<div class="title" style="width: 750px; height:200px">
			<img src = "../img/qna.png"
			style="width: 700px; height:170px; padding: 10px">
		</div>
		<div id = "container">  
			<table class = "qna_table" border = "1">
				<col width = "50px"><col width = "400px"><col width = "150px"><col width = "100px">
				<tr>
				    <th style = "border-top-left-radius:20px">No.</th>
				    <th>제목</th>
				    <th>작성자</th>
				    <th style = "border-top-right-radius:20px">작성일</th>
				</tr>
				<c:choose>
					<c:when test = "${empty list }">
						<tr>
							<td colspan = "4">======== 등록된 글이 없습니다. =========</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items = "${list }" var = "dto">
							<tr>
								<td>${dto.qna_no }</td>
								<td>
									<c:forEach begin = "1" end = "${dto.qna_tab }">
										&nbsp;&nbsp;
									</c:forEach>
									<a href = "mypage_controller.do?command=qna_detail&qna_no=${dto.qna_no }">${dto.qna_title }</a>
								</td>											
								<td>${dto.qna_writer }</td>
								<td>${dto.qna_regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td colspan = "4" style = "border:none">
					<input type = "button" value = "문의하기" onclick = "location.href='mypage_controller.do?command=qna_writeform'">
				</td>
				</tr>
			</table>
			
			
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