<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<style type = "text/css">
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
        
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
	section .content{
		min-width:1190px;
		width:100%;
		height:390px;
		text-align:center;
		
	}
	section .pay_outer{
		min-width:1190px;
		width:100%;
		height:530px;
		text-align:center;
		display:flex;
		justify-content: center;
		margin-bottom: 50px;
		
	}
	
	section .pay{
		justify-content: center;
		border-radius: 100px;
		padding-left: 50px;
		padding-right:50px;
		background:lightgray;
	}
	section #pay_now{
		font-size: 30px;
		font-weight:bold;
	}

	
	/*결제종류 버튼*/
	.pay_opt input[type="radio"] {
        display: none;
    }
 
    .pay_opt input[type="radio"] + span {
        display: inline-block;
        padding: 15px 10px;
       
        border-radius: 10px;
        background-color: #113a6b;
        color: white;
        text-align: center;
        cursor: pointer;
    }
 
    .pay_opt input[type="radio"]:checked + span {
        background-color: #fef01b;
        color: black;
    }
    
    #kakaopay_btn{
    	border:1px solid rgb(173,175,255);
    	background-color:rgb(173,175,255);
    	border-radius: 10px;
    	width:230px;
    	height:100px;
    	cursor: pointer;
    	color: white; 
    	font-size: 15pt;
    	margin-top: 30px;
    	font-family: 'GowunDodum-Regular';
    }
    
    #kakaopay_btn:hover{
    	border:none;
    	background-color:#fef01b;
    	color:black;
    	cursor: pointer;
    	
    }
   section .pay #kakaopay_logo{
     	width: 100px;
     	height: 100px;
     	display: block;
     } 	
	
	
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type = "text/javascript">

	window.onload = function (){
    	if(${userdto.user_id eq null}){
        	alert("세션 만료");
        	location.href='../main_controller.do?command=start';
    }
}
	function kakaopay(){
		if(${userdto.user_id ne null}){
    	
    	var IMP = window.IMP;
		var user_no = ${userdto.user_no}
    	IMP.init('imp70079286');
    	//var money = $('input[name="pay_opt"]:checked').val();
    	
    	var pay_opt = document.getElementsByName("pay_opt");
    	for(var i = 0; i < pay_opt.length; i++){
    		if(pay_opt[i].checked == true){
    			var money = document.getElementsByName("pay_opt")[i].value;
    		}
    	
    	}
    	
        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '소소스쿨 구독 결제',
            amount: money,
            buyer_email: "${userdto.email}",
            buyer_name: "${userdto.user_name}",
            buyer_tel: "${userdto.phone}",
            buyer_addr: "${userdto.roadAddr}" + "${userdto.detailAddr}",
            buyer_postcode: "${userdto.postcode}"
        }, function (rsp) {
            if (rsp.success) {
            	console.log("successful response returned");
            	
            	jQuery.ajax({
            		url: "/payments/complete",
                    type: "POST",
                    dataType: 'json', 
                    data: {
                        imp_uid : rsp.imp_uid
                    }
            	
            	})
            		/*var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    */
                    
                    Swal.fire({
              		  title: '결제성공',
              		  text: "소소스쿨의 입학을 환영합니다!.",
              		  icon: 'success',
              		  buttons: "확인",
              		}).then((value) => {
              			if(value){
                            location.href = "../mypage_controller.do?command=userSub&user_no="+user_no;
              			}	
              		});

            } else {
                Swal.fire({
            		  title: '결제실패',
            		  text: "에러내용 : " + rsp.error_msg,
            		  icon: 'error',
            		  buttons: "확인",
            		}).then((value) => {
            			if(value){
            				location.href="../pay_controller.do?command=pay_main";
            			}	
            		});
              /*  var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            
            	alert(msg);
            	location.href="../pay_controller.do?command=pay_main"; //실패 : alert창 확인 후 이동할 url 설정
            */
            }
        });
		}else{
			Swal.fire({
      		  title: '로그인 해주세요',
      		  text: "세션 만료",
      		  icon: 'warning',
      		  buttons: "확인",
      		}).then((value) => {
      			if(value){
      				location.href='../login_controller.do?command=login';
      			}	
      		});
		} 
    };        



</script>



    
<body>
	<header>
     	<img src = "../img/logo.png">
	</header>
	<nav>
   		<%@ include file="../form/navi.jsp"%>
	</nav>
	
	<section>
		<div class = "content">
			<img src = "../img/pay_1.png"
			style = "min-width:1190px;width:100%;height:390px;">
		</div>
			<div class = "content">
			<img src = "../img/pay_2.png"
			style = "min-width:1190px;width:100%;height:390px;">
		</div>
		
		<div class = "pay_outer">
		<div class = "pay">
		
			<p id = "pay_now">지금 구독하기</p>
			<p>결제 옵션을 선택하세요</p>
                <label class="pay_opt"><input type="radio" name="pay_opt" value="19900"><span>1개월<br>19,900원</span></label>
                <label class="pay_opt"><input type="radio" name="pay_opt" value="53700"><span>3개월(10% 할인)<br>53,700원</span></label>
                <label class="pay_opt"><input type="radio" name="pay_opt" value="95500"><span>6개월(20% 할인)<br>95,500원</span></label>
                <label class="pay_opt"><input type="radio" name="pay_opt" value="167000"><span>12개월(30%)<br>167,100원</span></label>
            
                <p><button type="button" id="kakaopay_btn" onclick ="kakaopay();">카카오페이로 결제하기</button></p>
               
                <img src = "../img/pay_3.png"
 				style = "width:200px; height:150px;">
             
 		</div>
 
		</div>

	
	
	
	
	
	
	
	</section>
	
	<footer>
	<%@ include file="../form/footer.jsp"%>
	</footer>

</body>
</html>