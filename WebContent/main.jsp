<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
 
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>5</title>
</head>
<style>
    body{
        margin: 0;
        padding: 0;
        min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
        min-height: 650px;
    }
    /*헤더*/
    header{
        background-color: aliceblue;
        min-width: 100%;
        height: 80px;
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
        width: 280px;
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
        width: 930px;     /*메인 구역 전체 width값*/
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
        min-width: 930px;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 930px;
        min-height: 150px;
        font-size: 50px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .month_graph{
        background-color: red;
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        margin-left: 150px;
        margin-right: 130px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .month_info{
        background-color: orange;
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
    }
    section .mainform #mainlist .sub_graph{
        background-color: yellow;
        min-width: 250px;
        height: 270px;
        margin: 50px 130px 70px 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .sub_info{
        background-color: green;
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        margin-bottom: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
    }
    #th{
        font-size: 30px; font-weight: bold;
    }
    #td{
        font-size: 20px;
        font-weight: bold;
        height: 60px;
        text-align: center;
    }
    /*버튼*/
    section .mainform #buttonform{
        min-width: 930px;
        height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #buttonform .button{
        width: 200px;
        font-size: 20px;
        font-weight: bold;
        background-color: rgb(173,175,255);
        border: 0;
        outline: 0;
        color: white;
        border-radius: 10px;
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
        background-color: aliceblue;
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
    .navi{
        list-style-type: none;
        height: 100px;
        padding: 0;
        margin: 0;
    }
    .navi li{
        float: left;
        position: relative;
        padding: 0;
        line-height: 50px;
        background-color: rgb(173,175,255);
        min-width: 180px;
        text-align: center;
    }
    .navi li a{
        color: white;
        font-weight: bold;
        padding: 5px 25px;
        text-decoration: none;
    }
    .navi li ul{
        list-style: none;
        position: absolute;
        left: 0;
        width: 180px;
        background-color: gray;
        padding: 0;
        margin: 0;
        opacity: 0;
    }
    .navi li:hover ul{
        opacity: 1;
    }
    .navi li ul li{
        float: none;
        position: static;
        height: 0;
        line-height: 0;
        background-color: gray;
    }
    .navi li:hover ul li{
        height: 30px;
        line-height: 30px;
        padding: 5px 0;
    }
    .navi li{
        transition: all 0.2s;
    }
    .navi li a{
        transition: all 0.2s;
    }
    .navi li ul li{
        transition: height 0.5s;
    }
    
     #k{
            margin-left:200px;
            background-color:gray;
            border-radius: 10px;
        }
        #o{
            margin-left:50px;
            background-color:skyblue;
            border-radius: 10px;
        }
        #r{
            margin-left:50px;
            background-color:gray;
            border-radius: 10px;
        }
         #e{
          padding:4px;
            font-size : 25px;
            background-color:gray;
            text-align: center;
             border-radius: 10px;
        }
         #j{
            margin-left:35px;
            background-color:gray;
            border-radius: 10px;
        }
        
        
            #btn_group button{
            border:0;
            
            padding:5px;
            font-size : 25px;
        }
          #content{
            margin-left : 200px;
            text-align: center;
        }
        		
			.jb-wrap {
	width: 40%;
	margin: 10px auto;
 
	position: relative;
}
.jb-wrap img {
	width: 70%;
	vertical-align: middle;
	text-align: center;
}
.jb-text {
	padding: 5px 10px;
	 
	text-align: center;
	position: absolute;
	top: 35%;
	left: 50%;
	transform: translate( -50%, -50% );
}
            
</style>
<body>
<header>
    	<img src = "./img/logo.png">
</header>
<nav>
<%@ include file="./form/navi.jsp" %>
</nav>
<section>
<!-- 동영상 -->
<div id="video">
    <h3>가장 많이 조회된 동영상</h3>
    <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <!-- 소모임 -->
    <div>
        <h3>내 주변 소모임</h3>
        <div id="group"></div>
    </div>
<!-- 공지사항 -->
<div>
	
	<h3><a href= "mypage_controller.do?command=notice">공지사항</a></h3>
	
	
	<div id="notic">
		<table border="1">
			<th width="900px">제목</th>
			<th width="200px">날짜</th>
			<tr>
				<td><a>공지사항</a></td>
				<td>2021-10-10</td>
			</tr>
		</table>
	</div>
</div>
</div>
    <div id="buttonform">

    </div>
    	
<div class="loginboard_form">
  
    <!-- 회원 랭킹 -->
    <div id="rank">
        <h3><button id="j">우리 학년에서 나는 몇위 ?</button></h3>
        <table id="rank-table" border="1">
            <col width="100px"><col width="100px"><col width="100px">
            <tr>
	            <td>1</td>
	            <td>이름</td>
	            <td>별</td>
            </tr>
            <tr>
	            <td>1</td>
	            <td>이름</td>
	            <td>별</td>
            </tr>
            <tr>
	            <td>1</td>
	            <td>이름</td>
	            <td>별</td>
            </tr>
            <tr>
	            <td>1</td>
	            <td>이름</td>
	            <td>별</td>
            </tr>
            <tr>
	            <td>1</td>
	            <td>이름</td>
	            <td>별</td>
            </tr>
            <table border="2">
                <col width="100px"><col width="100px"><col width="100px">
                <td>1</td>
                <td>이름</td>
                <td>별</td>
            </table>
        </table>
    </div>
</div><br>
</section>
<footer>
<%@ include file="./form/footer.jsp"%>
</footer>
</body>
</html>
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete