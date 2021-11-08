<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습하기-영어-그림맞추기</title>
</head>
<style type="text/css">
	body{
        margin: 0;
        padding: 0;
        min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
        min-height: 650px;
        font-family: 'GowunDodum-Regular';
    }
    /*헤더*/
    header{
        background-color: aliceblue;
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
    
    /*메인 구역*/
    section .mainform{
        width: 960px;     /*메인 구역 전체 width값*/
        display: flex;
        flex-wrap: wrap;
        -ms-user-select: none;      /*드래그 금지*/
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    
    section .mainform #mainlist{
        min-width: 960px;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 960px;
        min-height: 150px;
        font-size: 20px;
        font-weight: bold;
        align-items: center;
        justify-content: center;
    }

    /*로그인 구역*/
    section .loginboard_form{
        width: 230px;
        user-select: none;
        margin-left:50px;
       
        
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
	#btn{
		border:0;
		padding:5px;
		font-size:20px;
		font-weight:bold;
	}
	span{
		align:center;
	}
	ul{
	text-align: center;
	list-style: none;
	}
	@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff%27) format('woff');
    font-weight: normal;
    font-style: normal;
	}
</style>
<body>
<header style="border:1px black; height: 120px; width: 1200px;">
	<h1><img src="../img/logo.png"></h1>
</header>
<nav style="border: 1px solid rgb(173,175,255); background-color: rgb(173,175,255);">
    <%@ include file="../form/navi.jsp" %>
</nav>
<section>

	<div class="mainform">
        <div id="mainlist">
	        <div style="text-align:center; margin:30px;">
			   <button type="button" id="btn" style="margin-right:120px;"><img src="https://img.icons8.com/color/48/000000/abc.png"/><br>알파벳</button>
			   <button type="button" id="btn" style="margin-left:120px; margin-right: 120px;"><img src="https://img.icons8.com/doodle/48/000000/help.png"/><br>영어단어</button>
			   <button type="button" id="btn" style="margin-left:120px; background-color:rgb(173,175,255);"><img src="https://img.icons8.com/doodle/48/000000/picture.png"/><br>그림맞추기</button>
			</div>
            
            
                  	<div class="title">
                  	<div>
	                그림을 보고 단어를 입력해주세요
	        		</div>
	        		<hr>
	        	<div>
	        	<ul>
	        		<li>
					    <div style="text-align:center;">
					        <img src="https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-apple-fruit-vitaliy-gorbachev-flat-vitaly-gorbachev-1.png"
					        	style="width:120px; height:120px;"/>
				   		</div>
				   	</li>
				   	<li>
		   				<label><b>AP</b></label>
    					<input style="width:30px;" type="text" id="answer" value="">
    					<label><b>E</b></label>
    				</li>
    				<li>
    					<input type="submit" value="정답확인">
    				</li>
    			</ul>
    			</div>
            </div>
          
		
        </div>
    </div>
    <div class="loginboard_form">
        <div id="loginboard">
            <div id="imgform">
                <div id="image">
                    <img src="img/img01.png">
                </div>
                <div id="setting">
                    <img src="img/setting.jpg">
                </div>
            </div>
            <div id="right">
                <div id="textform">
                    <div id="name">
                        김이름님 환영합니다
                    </div>
                    <div id="location">
                        나의 소속 소모임<br>
                        소속 도서관
                    </div>
                    <div id="star">
                        ★ 별 개수
                    </div>
                </div>
                <div id="logoutbuttonform">
                    <button>로그아웃</button>
                </div>
            </div>
        </div>
    </div>
</section>
    <div>
		<footer>
			<%@ include file="../form/footer.jsp" %>
		</footer>
	</div>
	</body>
</html>