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
.btn-link2{
            display: flex;
            justify-content: center;
            width: 100%;
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
            text-align: center;
            width:750px;
        }

        .inner{
            display: inline-block;
            width:750px;
        }

        form fieldset {
            margin: 10px 0px;
        }

        legend {
            font-size: 18px;
            color: black;
            font-weight: 600;
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
		    margin: 15px
        }

        form label em {
            font-size: 15px;
            color: red;
            font-weight: 800;
        }

        form fieldset.sendform{
            text-align: center;
        }

        .regisform{
            text-align: right;
            width:540px;
            display: flex;
  			justify-content: center;
        }
	/* 	#li_parent_id{
		width:auto;
		} */
	/*  #parent_id{
             width: 248px 
            flex-wrap: nowrap;    
        }  */

    
        #chkid-btn{
        	display: inline;
        	position: absolute;
            background: rgb(173,175,255);
            cursor: pointer;
            font-size: 10px;
            color: white;
            border-radius: 2px;
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
  		
	    #new_email{        	
        	width: 123px;
        }
		#textEmail{        
			width: auto;
			display: inline;
        	position: inherit;
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

<script type="text/javascript">
    window.onload = function (){
        if(${userdto.user_id eq null}){
            alert("세션 만료");
            location.href='../main_controller.do?command=start';
        }
    }
</script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
    function idChk(){
    	var id = document.getElementById('parent_id').value;
    	var id2 = document.getElementsByName("parent_id")[0];
    	
	    var pattern1 = /[0-9]/;
	    var pattern2 = /[a-zA-Z]/;
	    
     	if(id2.value.trim()==""||id2.value==null){
    		alert("아이디를 입력하세요.");
  	    }
     	if(!pattern1.test(id)||!pattern2.test(id)||id.length<6 || id.length>10){
    		 alert("6자리 이상의 영문 소문자, 숫자로 구성하여야 합니다.");
         	 document.getElementsByName("parent_id")[0].focus();
 		}
     	else{
    		var target = "../login_controller.do?command=idchk&id="+id2.value.trim();
    		open(target,"","width=300,height=200");
    	}
	}
    
    function idChkConfirm(){
    	var chk = document.getElementsByName("parent_id")[0].title;
    	if(chk =="n"){
    		alert("아이디 중복체크를 확인해주세요.");
    		document.getElementsByName("parent_id")[0].focus();
    	}
    }
    
    function pwChk(){
        var pw = document.getElementById('new_password').value;
        var pw2 =  document.getElementById('chk_password').value;
       
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
                document.getElementsByName("chk_tel")[0].focus();
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            	document.getElementsByName("new_password")[0].focus();
            }
        }
    }
    
    function telChk(){
    	var tel = document.getElementById('chk_tel').value;
    	
    	var pattern1 = /[0-9]/;
    	
    	if(!pattern1.test(tel)||tel.length<11){
            alert("11자리 이상의 숫자로 구성하여야 합니다.");
            document.getElementsByName("chk_tel")[0].focus();
            return false;
        }else{
        	document.getElementsByName("garde")[0].focus();
        }return true;      
    }
    
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
    
  	 $(function() {
 		        $('#mailslc').change(function() {
    	            if ($('#mailslc').val() == 'directly') {
    	                $('#textEmail').attr("disabled", false);
    	                $('#textEmail').val("");
    	                $('#textEmail').focus();
    	                $('#textEmail').attr('readonly',false);
    	            } else {
    	                $('#textEmail').val($('#mailslc').val());
    	                $('#textEmail').attr('readonly',true);
    	            }
    	        })
	});
  	 
  	 //주소 다음 API
     function execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                 var extraRoadAddr = ''; // 참고 항목 변수

                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraRoadAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('postcode').value = data.zonecode;
                 document.getElementById("roadAddress").value = roadAddr;
                 document.getElementById("jibunAddress").value = data.jibunAddress;
          
                 document.getElementById("engAddress").value = data.addressEnglish;
                        
                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                 if(roadAddr !== ''){
                     document.getElementById("extraAddress").value = extraRoadAddr;
                 } else {
                     document.getElementById("extraAddress").value = '';
                 }

                 var guideTextBox = document.getElementById("guide");
                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                 if(data.autoRoadAddress) {
                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                     guideTextBox.style.display = 'block';

                 } else if(data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                     guideTextBox.style.display = 'block';
                 } else {
                     guideTextBox.innerHTML = '';
                     guideTextBox.style.display = 'none';
                 }
             }
         }).open();
     }
    </script>

>>>>>>> afd0bc9 (my_pg_controller_merged)
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
            <div class="outer">
        <form method="post" action="../mypage_controller.do?command=mypage_userUpdate">
        <div class="inner">
        <fieldset class="regisform">
            <ul>
                <li><label class="reg" for="parent_name">학부모 이름</label>
                    <input type="text" id="parent_name" name="parent_name"value = "박미영" readonly = "true"></li>

                <li id="li_parent_id"><label class="reg" for="parent_id">학부모 아이디<em>*</em></label>
                        <input type="text" id="parent_id" name="parent_id" title="n" maxlength="10"  placeholder="6자리 이상의 영문 소문자,숫자 조합" required>
                        <button type="button" id="chkid-btn" onclick="idChk();">중복확인</button></li>

                <li><label class="reg" for="student_name">자녀 이름<em>*</em></label>
                    <input type="text" id="student_name" name="student_name" maxlength="10" onclick="idChkConfirm();" required ></li>
                    
                <li><label class="reg" for="nick_name">닉네임<em>*</em></label>
                    <input type="text" id="nick_name" name="nick_name" maxlength="10" onclick="idChkConfirm();"  required></li>
                
                <li><label class="reg" for="new_password">비밀번호<em>*</em></label>
                    <input type="password" id="new_password" name="new_password" maxlength="15" placeholder="8자리 이상의 영문 소문자, 숫자 조합" onchange="pwChk()" required></li>
                    
                <li><label class="reg" for="chk_password">비밀번호 확인<em>*</em></label>
                    <input type="password" id="chk_password" name="chk_password" maxlength="15" placeholder="비밀번호 재입력" onchange="pwChk()" required>
                    	&nbsp;<span id="check">비밀번호를 입력해주세요.</span></li>
                
                <li><label class="reg" for="chk_tel">휴대폰 번호<em>*</em></label>
                    <input type="tel" id="chk_tel" name="chk_tel" maxlength="11" placeholder="-없이 숫자만 입력해주세요." onclick="idChkConfirm();" onchange="telChk()" required></li>
                
                <li><label class="reg" for="garde">학년<em>*</em></label>
                    <input type="number" id="garde" name="garde" min="1" max="3" placeholder="숫자만 입력해주세요." maxlength="1" onclick="idChkConfirm();" oninput="numberMaxLength(this);" required></li>
                
                <li><label class="reg" for="new_email">이메일</label>
                    <input type="text" id="new_email" name="new_email" maxlength="15" onclick="idChkConfirm();" ><span>@</span>
                    <input name="textEmail" id="textEmail" placeholder="이메일을 선택하세요." readonly>  
                    <select id="mailslc">
                        <option value="self" disabled selected>선택</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.com">daum.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                        <option value="directly" id="textEmail">직접 입력</option>
                    </select>
                </li>
<!--                 
                <li><label class="reg" for="new_address">주소</label>
                    <input type="text" id="new_address" name="new_address" maxlength="30" onclick="idChkConfirm();" ><br>

                    <label class="reg" for="new_address2">상세주소</label>
                    <input type="text" id="new_address2" name="new_address2" maxlength="30" onclick="idChkConfirm();" >
                    <p>경품 배송을 위한 정확한 주소를 기입해주세요.</p>
                </li> -->
                
	              <li><label class="reg" for="new_address">주소</label>
	              	<input type="text" name="postcode" id="postcode" placeholder="우편번호">
	              	<input type="button" id="findAdd" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" size="60" ><br>
					<input type="hidden" id="jibunAddress" placeholder="지번주소"  size="60">
					<span id="guide" style="color:#999;display:none"></span>
	              <label class="reg" for="new_address2">상세주소</label>
	              	<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"  size="60"><br>
					<input type="hidden" id="extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="engAddress" placeholder="영문주소"  size="60" ><br>
	              <p>경품 배송을 위한 정확한 주소를 기입해주세요.</p>
                </li>
            </ul>
        </fieldset>
        <fieldset class="sendform">
            <input type="submit" class="btn" value="가입하기">
            <input type="reset" class="btn" value="취소">
        </fieldset>
   		</div>
  	  </form>
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