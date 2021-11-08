<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>비밀번호 변경</title>

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
        min-height: 700px;
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
    
    #container{
    	width: 750px;
    	display: flex;
    	justify-content: center;
    }

 .btn-link2{
            display: flex;
            justify-content: center;
            width: 1000px;
            height: 100%;
            padding: 10px;
            margin-bottom: 20px;
            background-color: white;
            border-radius: 4px;
            box-shadow: 0 8px 16px reba(0,0,0,.3);
            
        }
        
 		.btn-link2 > .btn{
            background: lightgrey;
            cursor: pointer;
            font-size: 15px;
            color: black;
            border-radius: 4px;
            transition: .3s;
            margin:0 15px;
            padding: 10px;
            border: none;
            outline: none;
        }
        
        .btn-link2 > .btn:hover{
        	background-color:rgb(14, 14, 14);
        	color:white;
    		opacity: 0.6;
        }
        
        .outer {
        	display:flex;
        	width:1020px;
            text-align: center;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            align-content: center;
        }
        .inner{
            display: inline-block;
            margin-right:80px;
            height: 200px;
        }
        form fieldset {
            margin: 10px 0px;
            min-height: 900px;
            margin-left: 30px;
        }
        legend {
            font-size: 16px;
            color: #555B72;
            background-color:#F4EDB5;
            font-weight: 500;
            text-align: center;
            padding: 15px;
            border-radius:10px;
            border : 1px dashed rgb(173,175,255);
         	width: 500px;
           	margin-left:10px;
           	margin-bottom: 20px;
            justify-content:center;
        }
        legend a{
        	color: rgb(161,54,102);
            font-weight: 800;
            
        }
		
        li > input {
            width:330px;
            height:37px;
            font-size:14px;
            margin: 5px;
            border : 1px solid #80808082;
        }
		
		.inner .regisform ul {
		    margin: 0px;
   			padding: 0px 20px;
   		
		}
		
        form ul li{
            list-style: none;
            margin: 5px;
        }
        
        form label.reg{
            font-size: 14px;
		    width: auto;
		    float: inherit;
		    margin: 15px;
		   
		    
        }
        form #user_pr, #parent_id, #student_name{
            font-size: 15px;
            color: rgb(90,42,126);
            font-weight: 800;
            border:none;
        }
     
        form fieldset.sendform{
            text-align: center;
            min-height: 100px;
            justify-content:center;
        }
        .regisform{
            text-align: right;
            width:540px;
            min-width:650px;
            height: 200px;
            min-height: 200px;
            display: flex;
  			justify-content: center;
  			margin-top: 20px;
  			
        }
    
        #chkid-btn{
        	display: inline;
        	position: absolute;
            background: rgb(173,175,255);
            cursor: pointer;
            font-size: 10px;
            color: white;
            border-radius: 2px;
            width: 100px;
            height: 39px;
            margin:6px 3px;
            padding: 9px;
            transition: .3s;
            border: none;
            outline: none;
        }
        
        #chkid-btn:hover{
        	opacity: 0.6;
        }
        p{
            font-size: 16px;
            font-weight: bold;
            color: rgb(173,175,255);
            margin: 0px;
        	padding: 0px;
        }
   
  
        
       	fieldset{
  			border: 0;
  		}
  		
  		.sendform > .btn{
	        background: rgb(173,175,255);
            cursor: pointer;
            font-size: 20px;
            color: white;
            border-radius: 4px;
            margin:0 3px;
            padding: 9px;
            transition: .3s;
            border: none;
            outline: none;
  		}
  		
  		.sendform > .btn:hover{
  			opacity: 0.6;
  		}
  		
  		span {
  			font-size:16px;
  		}
 
  		select{
	       	display: inline;
	       	position: absolute;
	  		height:41px;
	  		width:129px;
	  		font-size:14px;
	  		margin:5px 0 0 0;
	  		border : 1px solid #80808082;
  		}
  		
  		input::-webkit-input-placeholder {
			padding:7px;
		} 
		
		#findAdd{
			display: inline;
        	position: absolute;
            background: rgb(173,175,255);
            cursor: pointer;
            font-size: 10px;
            color: white;
            border-radius: 2px;
            width: auto;
            height: 39px;
            margin:6px 3px;
            padding: 9px;
            transition: .3s;
            border: none;
            outline: none;
		}
		
		.btn2{
			width:100px;
	        background: gray;
            cursor: pointer;
            font-size: 20px;
            color: white;
            border-radius: 4px;
            margin:8px 3px;
            padding: 9px;
            transition: .3s;
            border: none;
            outline: none;
		}
		
		.btn2:hover{
			opacity: 0.6;
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

    window.onload = function (){
        if(${userdto.user_id eq null}){
            alert("세션 만료");
            location.href='../main_controller.do?command=start';
        }
    }
    
    function pwChk(){
        var pw = document.getElementById('new_password').value;
        var pw2 =  document.getElementById('chk_password').value;
        var chgePW = document.chgePW;
       
        var pattern1 = /[0-9]/;
        var pattern2 = /[a-zA-Z]/;
        
        if(!pattern1.test(pw)||!pattern2.test(pw)||pw.length<8||pw.length>50){
            alert("8자리 이상의 영문 소문자, 숫자로 구성하여야 합니다.");
            document.getElementsByName("new_password")[0].focus();
        }          
        
        if(document.getElementById('new_password').value !='' && document.getElementById('chk_password').value!=''){
            if(document.getElementById('new_password').value==document.getElementById('chk_password').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            	document.getElementsByName("new_password")[0].focus();
            }
        }
    }
    function check(){
    	var chgePW = document.chgePW;
    	var pattern1 = /[0-9]/;
        var pattern2 = /[a-zA-Z]/;
        var pw = document.getElementById('new_password').value;
    	var pw2 =  document.getElementById('chk_password').value;
        
    	if((!pattern1.test(pw)||!pattern2.test(pw)||pw.length<8||pw.length>50)|| (pw!==pw2)){
    			alert("비밀번호를 다시 확인해주세요.")
    			document.getElementsByName("new_password")[0].focus();
    	}
    	else{ 
    		chgePW.submit();
    	}
    };
   
    </script>
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
		<div class="title" style="width: 750px; height:200px">
			<img src = "../img/userupdate.png"
			style="width: 600px; height:180px; padding: 10px">
		</div>
			<form name = "chgePW" method="post" action="../mypage_controller.do?command=userPwChange">
			<input type = "hidden" name = "user_no" value = "${userdto.user_no }">
			
        <div class="inner">
        <fieldset class="regisform">
       			<legend>새로운 비밀번호를 입력하고 변경하기를 눌러주세요. <br>
       					
       			</legend>
            <ul>
                
             
                <li><label class="reg" for="new_password">새로운 비밀번호</label>
                    <input type="password" id="new_password" name="new_password" 
                    	maxlength="15" placeholder="8자리 이상의 영문 소문자, 숫자 조합" 
                    	onchange="pwChk()"></li>
                    
                <li><label class="reg" for="chk_password">비밀번호 확인</label>
                    <input type="password" id="chk_password" name="chk_password" maxlength="15" 
                    	placeholder="비밀번호 재입력" onchange="pwChk()">
                    		<p id="check">비밀번호를 입력해주세요.</p></li>
                
            </ul>
            
        </fieldset>
        <fieldset class="sendform">
            <input type="button" class="btn" value="변경하기" onclick = "check();">
            <input type="button" class="btn2" value="돌아가기"
            onclick="location.href='../mypage_controller.do?command=userinfo&user_no=${userdto.user_no}'"><br>
            
        </fieldset>
   		</div>
  	  </form>

				
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