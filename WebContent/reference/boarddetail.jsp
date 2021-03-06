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
	
	.ref_table{
	
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
    input{
     font-family: 'GowunDodum-Regular';
    }
    textarea{
       font-family: 'GowunDodum-Regular';
       background-color:#FBF4F5;
       padding: 50px;
       border:none;
       font-size: 10pt;
       resize:none;
       width:600px;
       height: 400px;
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
<div Class="menuform">
	<%@ include file="../form/reference_menubar.jsp"%>
</div>
    <div class="mainform">
        <div id="mainlist">
			<div class="title">
            	게시글 보기
            </div>
			<div style="width: 750px; min-height: 500px; display: flex; flex-wrap: wrap">
				<div style="width: 85px"></div>
				<form action="../reference_controller.do" method="post">
					<input type="hidden" name="command" value="boardinsert">
					<table class = "ref_table" border="1" style="width: 580px">
						<col width="70px">
						<col width="500px">
						<tr>
							<th>NO</th>
							<td>${referencedto.rboard_no }</td>
						</tr>
						<tr>
							<th>DATE</th>
							<td>${referencedto.rboard_regdate }</td>
						</tr>
						<tr>
							<th>TITLE</th>
							<td>${referencedto.rboard_title }</td>
						</tr>
						<tr>
							<td colspan="2"><div style="width: 100%; min-height: 300px">${referencedto.rboard_content}<div></div></td>
						</tr>
						<%--					<tr>--%>
						<%--						<td colspan="2">--%>
						<%--							<input type="button" value="수정" --%>
						<%--									onclick="location.href='mycontroller.jsp?command=boardupdateform&rboard_no=${referencedto.rboard_no }'">--%>
						<%--							<input type="button" value="삭제" --%>
						<%--									onclick="location.href='mycontroller.jsp?command=boarddelete&rboard_no=${referencedto.rboard_no }'">--%>
						<%--							<input type="button" value="목록" onclick="">--%>
						<%--						</td>--%>
						<%--			 		</tr>--%>
					</table>
				</form>
				<div style="width: 85px"></div>
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