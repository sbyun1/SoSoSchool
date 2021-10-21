<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원정보수정</title>
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
        min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
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
        min-width: 100%;
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
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 750px;
        min-height: 150px;
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
    
    fieldset{
        border:none;
        min-width: 300px;    
    }
    

    ul{list-style: none;  }
    
    #user_update{
    	min-width: 490px;
    	padding-left:60px;
    	padding-right:40px;
    	padding-top:20px;
    	padding-bottom:20px;
    	justify-content:center;
    	margin-left:20px;
    	margin-top:0px;
    	border:1px solid black;
    	border-radius:45px;
    }
    label{
        width: 120px;
        display:inline-block;
    }
  	
    #user_new_nn, #user_pw, #phone, #email, #addr{
        width:300px;
        height:30px;
        min-width: 300px;
        border:1px solid rgb(227,227,227)
    }
    #user_pr, #user_id, #user_name, #user_nn{
        width:300px;
        height:30px;
        
        border-right:0px; 
        border-top:0px; 
        border-left:0px; 
        border-bottom:0px;
        


    }
    .sendform{
        margin:0px;
    } 
    .btn{
    	width:100px;
    	height:50px;
    	background-color:rgb(173,175,255);
    	cursor: pointer;
        font-size: 15px;
      	border-radius: 4px;
       	transition: .3s;
        margin:0 15px;
        padding: 10px;
        border: none;
        outline: none;
    	
    	
    	
    }
    #duplicate_btn{
    	height:30px;
    	min-width:10px;
    	background-color:rgb(173,175,255);
    	cursor: pointer;
      	border-radius: 3px;
       	transition: .3s;
        border: none;
        outline: none;
       	opacity: 0.6
    }
    #container{
    	padding-left:50px;
    	padding-right:100px;
    	
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
        <div id="mainlist">
            <div class="title">
                회원정보 수정
            </div>
        <div id = "container">  
		<form action = "" method = "post"> 
			<input type = "hidden" name = "command" value = "mypage_userUpdate">
            <fieldset>
         
            <ul id = "user_update">
                <li>
                    <label for = "user_pr"><strong>학부모 이름</strong></label>
                    <input type = "text" id = "user_pr"  value = "김미영" readonly = "true"><p></p>
                </li>
                <li>
                    <label for = "user_id"><strong>학부모 아이디</strong></label>
                    <input type = "text" id = "user_id"  value = "my1007" readyonly = "true"><p></p>
                </li>
                <li>
                    <label for = "user_name"><strong>자녀 이름</strong></label>
                    <input type = "text" id = "user_name"  value = "최재윤" readonly = "true"><p></p>
                </li>
                <li>
                    <label for = "user_nm"><strong>닉네임</strong></label>
                    <input type = "text" id = "user_nn" value = "테스트용 닉네임" readonly = "true"><p></p>
                </li>
                <li>
                    <label for = "user_new_nm"><strong>변경 할 닉네임</strong></label>
                    <input type = "text" id = "user_new_nn" name = "user_nn">
                    <input type = "button" id = "duplicate_btn" value = "중복확인" onclick = "" ><p></p>
                </li>
                <li>
                    <label for = "user_pw"><strong>비밀번호 변경</strong></label>
                    <input type = "password" id = "user_pw" name = "user_pw" placeholder="8자리 이상의 영문 소문자, 숫자조합"><p></p>
                </li>
                <li>
                    <label for = "user_pw"><strong>비밀번호 확인</strong></label>
                    <input type = "password" id = "user_pw" name = "user_pw_check" placeholder="비밀번호 재입력"><p></p>
                </li>
                <li>
                    <label for = "phone"><strong>휴대폰 번호</strong></label>
                    <input type = "tel" id = "phone" name = "phone" value = "010-1111-2222"><p></p>
                </li>
                <li>
                    <label for = "email"><strong>이메일</strong></label>
                    <input type = "email" id = "email" name = "email" value = "test@ssschool.com"><p></p>
                </li>
                <li>
                    <label for = "text"><strong>주소</strong></label>
                    <input type = "text" id = "addr" name = "addr" value = "서울시 ㅇㅇ구 ㅇㅇ동">
                    <p style = "color:red;">*경품 배송을 위한 정확한 주소를 기입해주세요.</p>
                </li>
                <li>
               		<input type="submit" class = "btn" value="수정하기"
                		style = "margin-left:120px;">
                	<input type="reset" class="btn" value="취소" 
                		style = "margin-left:0;">
                </li>
                
            </ul>
        </fieldset>
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