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
		height:300px;
		text-align:center;
		background-color:lightgray;"
	
	}
	
	section .pay{
		justify-content: center;
	}
	
	/*결제종류 버튼*/
	.pay_opt input[type="radio"] {
        display: none;
    }
 
    .pay_opt input[type="radio"] + span {
        display: inline-block;
        padding: 15px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
    }
 
    .pay_opt input[type="radio"]:checked + span {
        background-color: #113a6b;
        color: #ffffff;
    }
    
    #kakaopay_btn{
    	border:none;
    	background-color:none;
    	cursor: pointer;
    	
    }
    
    #kakaopay_btn:hover{
    	border:none;
    	background-color:blue;
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
		console.log()
    	// getter
    	var IMP = window.IMP;
    	IMP.init('imp70079286');
    	var money = $('input[name="subs_time"]:checked').val();
    	console.log(money);
    	
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

            		var msg = '결제가 완료되었습니다.';
                    msg += '고유ID : ' + rsp.imp_uid;
                    msg += '상점 거래ID : ' + rsp.merchant_uid;
                    msg += '결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    alert(msg);
                    var user_no = ${userdto.user_no}
                    location.href = "../mypage_controller.do?command=userSub&user_no="+user_no;
                    
            

            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            
            	alert(msg);
            	location.href="../pay_controller.do?command=pay_main"; //실패 : alert창 확인 후 이동할 url 설정
            
            }
        });
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
			<p>결제 내용 적기 블라블라</p>
		</div>
		
		<div class = "pay">
		
			<p style="font-weight: bold">카카오페이 현재 사용가능</p>
                <label class="pay_opt"><input type="radio" name="subs_time" value="100"><span>1개월<br>19,900원</span></label>
                <label class="pay_opt"><input type="radio" name="subs_time" value="53700"><span>3개월(10% 할인)<br>53,700원</span></label>
                <label class="pay_opt"><input type="radio" name="subs_time" value="95500"><span>6개월(20% 할인)<br>95,500원</span></label>
                <label class="pay_opt"><input type="radio" name="subs_time" value="167000"><span>12개월(30%)<br>167,100원</span></label>
              
                <p  style="color: #ac2925; margin-top: 30px">카카오페이로 결제가능</p>
                <button type="button" id="kakaopay_btn" onclick ="kakaopay();" >결제하기</button>
             
 		</div>
		

	
	
	
	
	
	
	
	</section>
	
	<footer>
	<%@ include file="../form/footer.jsp"%>
	</footer>

</body>
</html>