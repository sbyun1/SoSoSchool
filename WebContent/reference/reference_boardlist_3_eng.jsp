<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자료실</title>
<style type="text/css">
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
        width: 100%;
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
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 750px;
        min-height: 150px;
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
    /*푸터*/
    footer{
        background-color: rgb(233 233 236);
        min-width: 100%;
        min-height: 150px;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        font-size: 15px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
	li{
	list-style-type : none;
	font-weight: bold;
	font-size: 20px;
	font-style: normal;
	margin-bottom: 30px;
	}
	.sidebar{
	     width: 15%;
	     float: left;
	     height: 50%;
	   }
	.reference_borad{
	     display: flex;
	     float:right;
	     margin:30px;
	     flex-direction: column;       
	   }

</style>
</head>
<body>
<header>
	<h1><img src="../img/logo.png"></h1>
</header>
<nav>
    <%@ include file="../form/navi.jsp" %>
</nav>
<section>
	<div class="menuform">
        <ul>
            <li style="margin-bottom:60px; font-size:30px">자료실</li>
            <li><a href="#">1학년</a></li>
            <li><a href="#">2학년</a></li>
            <li><a href="#">3학년</a></li>
        </ul>
    </div>    
    <div class="mainform">
        <div id="mainlist">
            <div class="title">
            	3학년
            </div>
		<div id="right" class="reference_borad">
			<h2>국어자료</h2>
			<table border="1">
				<col width="100px">
				<col width="650px">
				<col width="100px">
				<tr>
					<th>NO.</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:choose>
					<c:when test="${empty eng_list }">
						<tr>
							<td colspan="4">----작성된 글이 존재하지 않습니다-----</td>
						</tr>
					</c:when>
					<c:otherwise>
		                  <c:forEach items="${eng_list }" var="referenceDto">
		                     <tr>
		                        <td>${referenceDto.rboard_no }</td>
								<td>${referenceDto.rboard_title }</td>
								<td>${referenceDto.rboard_regdate }</td>
		                     </tr>
		                  </c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		</div>
	</div>
	<div class="loginboard_form">
		<%@ include file="../form/logout.jsp"%>
	</div>  
</section>
<div>
	<footer>
		<%@ include file="../form/footer.jsp" %>
	</footer>
</div>
</body>
</html>