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
<script>
window.addEventListener("click", init, false);
function init () {
    document.forms[0].elements[8].addEventListener("click", quizCheck, false);
}
function quizCheck(){
    var examineeName = document.forms[0].name.value; // 응시자 이름
    var answer = ['13','25','74','50','57','170']; //시험 문제의 정답
    var correct =  <%= request.getAttribute("correct")%>; //정답 개수 카운트
    var questionElement = new Array; // 5개의 문제가 차례로 들어가는 변수
    var today = new Date(); // 날짜 작성을 위한 변수
    var year = today.getFullYear()
    var month = today.getMonth()+1
    var date = today.getDate()
    var dayLabel = today.getDay()
    var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
    var weekToday = week[dayLabel];
    var outputString =""; //최정 출력될 HTML 문자열을 위한 변수
    
    console.log(year);
    console.log(month);
    console.log(date);
    console.log(dayLabel);
    console.log(weekToday);
    
    for(var i=0;i < 7; i++){
        questionElement.push(document.forms[0].elements[i+2].value);
        if(answer[i] == questionElement[i] ){
                correct += 1;
                document.forms[0].elements[i+2].classList.remove("fail");
           }else{
               document.forms[0].elements[i+2].classList.add("fail");
           }
        }
    var sum = 5 * correct;
    outputString = "<p>"+examineeName+" 님의</p>";
    outputString += "<p>"+year+"년 "+month+"월 "+date+"일 "+weekToday+" 계산 퀴즈 결과</p>";
    outputString += "<p>총 "+correct+"문제를 맞추셨습니다.</p>";
    outputString += "<p>틀린 답은 빨간색으로 표시 하였습니다.</p>";
    outputString += "<hr><p>구구단 정답<br><br>1번 정답:4x6=24 <br>2번 정답:3x9=27 <br>3번 정답:6x8=48 <br>4번 정답:7x4=28 <br>5번 정답:5x5=25 <br>6번 정답:4x9=36<br>7번 정답:3x6=18 </p><hr>"; 
    outputString += "<hr><p>길이재기 정답<br><br>1번 정답:2m = 200cm <br>2번 정답:35m+800cm = 45m <br>3번 정답:2m+80cm =280cm <br>4번 정답:5m = 500cm <br>5번 정답:25cm+75cm = 1m <br>6번 정답:1m+20cm = 120cm<br>7번 정답: 2m40cm-1m70cm = 70cm </p><hr>"; 
    outputString += "<hr><p>시각과 시간 정답<br><br>1번 정답:1주일6일 = 13일 <br>2번 정답:2년1개월 = 25개월 <br>3번 정답:3일2시간 = 74시간 <br>4번 정답:2일2시간 = 50시간 <br>5번 정답: 2일9시간 = 57시간 <br>6번 정답:2시간50분 = 170분 </p><hr>"; 
    outputString += "<p>최종 점수는 <strong>"+sum+"점</strong> 입니다.</p>";
    outputString += "<input type='button' value='성적 제출하기' onclick="+"location.href='../munjae_controller.do?command=math_final&user_no=${userdto.user_no}&correct="+correct+"&sum="+sum+"&month="+month+"&date="+date+"'"+">";
    document.getElementById('resultarea').innerHTML = outputString;
    document.getElementById('resultarea').style.visibility = 'visible';
}
 

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
                <button class="buttonss">구구단</button>  <%--//onclick 추가해서 페이지 넘기는 기능 구현 할 것--%>
            </div>
            <div id="button_2" style="width: 320px; display: flex; align-items: center; justify-content: center">
                <button class="buttonss">길이재기</button>
            </div>
            <div id="button_3" style="width: 320px; display: flex; align-items: center; justify-content: center">
                <button class="buttonss">시각과 시간</button>
            </div>
        </div>
        <div id="munjaeform" style="width:960px; display: flex; justify-content: center; align-items: center;"> <%--//문제 구역 해당 div태그 안에서 문제 구현할것--%>
            <div style="width: 280px"></div>    <%--//페이지 정렬를 위해 추가한 것 건들지 말것--%>
            <form style="width: 700px"> <%--//해당 div태그 아래에 문제 추가할것--%>
                <fieldset style="border: 0">
                    <div class="name">
                        <label for="name">2학년 이름 : </label>
                        <input type="text" id="name" name="name" value="${userdto.user_name}"/><br><hr>
                        
                        빈 칸에 들어갈 숫자를 네모 칸 안에 적어주세요.
                    </div>
                    <ol>
                      <li>
                            <label for="add"></label>
                            <h4>1주일 6일 = ____일</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        <li>
                            <label for="add"></label>
                            <h4>2년 1개월 = ___개월</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        <li>
                            <label for="sub"></label>
                            <h4>3일 2시간 = ___시간</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        <li>
                            <label for="sub"></label>
                            <h4>2일 2시간 = ___시간</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        <li>
                            <label for="sub"></label>
                            <h4>2일 9시간 = ___시간</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        <li>
                            <label for="sub"></label>
                            <h4>2시간 50분 = ___분</h4>
                            <input placeholder=""  type="text"/>
                        </li>
                        
                        
                        
                        
                    </ol>
                    <div>
                       <%-- //문제 완료 버튼--%>
                        <input type="button" name="button" value="완료"  style="width: 60px; height: 30px; font-size: 10px; font-weight: bold; background-color: rgb(173,175,255); border: 0; outline: 0; color: white; border-radius: 10px">
                    </div>
                </fieldset>
            </form><%--// 문제 구현 form 끝--%>
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