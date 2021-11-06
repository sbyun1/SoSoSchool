<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sosoSchool</title>
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

    /*로그인 구역*/
    section .loginboard_form{
        width: 230px;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
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
    
    
     #k{
            margin-left:80px;
            background-color:skyblue;
            border-radius: 10px;
        }
        #o{
            margin-left:50px;
            background-color:gray;
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
        
         #a{
          padding:2px;
            font-size : 15px;
            background-color:skyblue;
            text-align: center;
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
<!---->
  .buttonss{
      width: 200px;
      height: 50px;
      font-size: 20px;
      font-weight: bold;
      background-color: rgb(173,175,255);
      border: 0;
      outline: 0;
      color: white;
      border-radius: 10px
  }

#score {
    color: red;
    font-size: 1.2em;
    font-weight: bold;
}
   .name{text-align: right;}
            ol{padding:0;}
            ol > li{color:#888;padding:5px;}
            ol > li::after{clear: both;content:"";display: block;}
            label{padding-left:15px;color:#333;}
            .fail{background-color:red;color:#fff;}
            strong{color:red;}
            #resultarea p{text-align: left !important;color: #888;font-size: 0.8em;margin-top: 0;}

</style>
 
<script type="text/javascript">
var delay=60; //시간설정
var correctAnswers=new Array("a","a","b" );  //정답

var q_num=1;
var timer;
var layer;
var clock=delay;
var sum=0;

function show_question(){
	if (layer=eval("document.all.question"+q_num)){
		layer.style.display="inline";
		document.all.timeLeft.innerHTML=clock;
		hide_question();
	} else {
		document.all.timeLeft.innerHTML=0;
		document.all.quizScore.innerHTML="<h3>총 문제: "+(q_num-1)+"개 정답: "+sum+"개 점수: "+(sum*10)+"점 입니다.</h3>";
		document.all.quizScore.style.display="inline";
	}
}

function hide_question(){
	if (clock>0) {
		document.all.timeLeft.innerHTML=clock;
		clock--;
		timer=setTimeout("hide_question()",1000);
	} else {
		clearTimeout(timer);
		document.all.answerBoard.innerHTML=" ";
		clock=delay;
		layer.style.display="none";
		q_num++;
		show_question();
	}
}

function check_answer(answer){
	if (correctAnswers[q_num-1]==answer){
		sum++;
		document.all.answerBoard.innerHTML="<font color=blue><b><h1>정답입니다.</h1></b></font>";
	} else {
		document.all.answerBoard.innerHTML="<font color=red><b><h1>땡! 틀렸습니다.</h1></b></font>";
	}
	clock=0;
	clearTimeout(timer);
	timer=setTimeout("hide_question()",300);
}

window.onload=show_question;
     

</script>
</head>
<body>
<header>
    <%@ include file="../form/header.jsp"%>
</header>
<nav>
    <%@ include file="../form/navi.jsp"%>
</nav>
<section>
    <div class="mainform">      <%--메인 구역 건들지 말것--%>
        <div id="buttonfrom" style="width: 960px; min-height: 100px; display: flex; flex-wrap: wrap">    <%--각 문제 페이지로 이동할 수 있는 버튼 구역 건들지 말것--%>
            <div id="button_1" style="width: 320px; display: flex; align-items: center; justify-content: center">    <%--버튼을 감싸는 div태그--%>
                <button class="buttonss">알파벳</button>  <%--//onclick 추가해서 페이지 넘기는 기능 구현 할 것--%>
            </div>
            <div id="button_2" style="width: 320px; display: flex; align-items: center; justify-content: center">
                <button class="buttonss">기초 단어</button>
            </div>
            <div id="button_3" style="width: 320px; display: flex; align-items: center; justify-content: center">
                <button class="buttonss">그림 맞추기</button>
            </div>
        </div>
        <div id="munjaeform" style="width:960px; display: flex; justify-content: center; align-items: center;"> <%--//문제 구역 해당 div태그 안에서 문제 구현할것--%>
            <div style="width: 280px"></div>    <%--//페이지 정렬를 위해 추가한 것 건들지 말것--%>
            <div style="width: 400px"> <%--//해당 div태그 아래에 문제 추가할것--%>
                <div style="border: 0">
                <div id="content"><br>
           <h1>  제한시간 : <B><span id="timeLeft"></span></B> 초 </h1>
                   
                    <div id="answerBoard"> </div>
<br>
		빈 칸에 들어갈 알파벳이 서로 같은 것을 선택하세요.		
             <div id="question1" style="display:none">
	<h3>_mile</h3>
	<a href="javascript:void(0)" onclick="check_answer('a')"><button class="buttonss">_even</button></a><h2>VS</h2>
	<a href="javascript:void(0)" onclick="check_answer('b')"><button class="buttonss">_iary</button></a><br>
	 
</div>

<div id="question2" style="display:none">
<h3>_lay</h3><br>
	<a href="javascript:void(0)" onclick="check_answer('a')"><button class="buttonss">stam_</button></a><h2>VS</h2>
	<a href="javascript:void(0)" onclick="check_answer('b')"><button class="buttonss">_lass</button></a><br>
</div>

<div id="question3" style="display:none">
<h3>_en</h3><br>
	<a href="javascript:void(0)" onclick="check_answer('a')"><button class="buttonss">musi_</button></a><h2>VS</h2>
	<a href="javascript:void(0)" onclick="check_answer('b')"><button class="buttonss">_wo</button></a><br>
</div>

  

<div id="quizScore" style="display:none">
</div>
             
                        
                   
                   
                      </div>
                      
                 
                </div>
                
            </div><%--// 문제 구현 form 끝--%>
            
            <div style="width: 280px"></div> <%--//페이지 정렬를 위해 추가한것 건들지 말것--%>
        </div>
        <div id="resultform" style="display: flex; flex-wrap: wrap">    <%--//결과 표 나오는 구역 건들지 말것--%>
            <div style="width: 280px"></div>    <%--//페이지 정렬를 위해 추가한것 건들지 말것--%>
            <form>
                <fieldset id="resultarea" style="max-width: 380px; border: 0">  <%--//결과 표 나오는 필드셋 구역--%>

                </fieldset>
            </form>
            <div style="width: 280px"></div>    <%--//페이지 정렬를 위해 추가한 것 건들지 말것--%>
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