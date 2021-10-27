<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.soso.login.Dto.UserDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
     		UserDto userdto = (UserDto)session.getAttribute("userdto");
			UserDto ps = (UserDto)request.getAttribute("ps");
			
			
%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>


<style type="text/css">
		@font-face {
			font-family: 'GowunDodum-Regular';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}
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
		
        header h1 a{
            color: black;
            text-decoration: none;
        }
        
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
		
		body{
		    margin: 0;
		    padding: 0;
		    min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
		    min-height: 650px;
		    font-family: 'GowunDodum-Regular';
		}
		
		section{
		    min-width: 1190px;
	        display: flex;
	        justify-content: center;
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
		li{
		    list-style: none;
		}
        
		#left { 
			color: #333;
			border: 1px solid #ccc;
			background:white;
			margin: 0px 5px 5px 0px;
			padding: 10px;
			height: auto;
			width: 952px;
			float: left;1190
		}
		#m-right{
			width:238px;
		    display: flex;
 		   	flex-wrap: wrap;
    		flex-direction: column;
    		align-items: center;
		}	 
		
		#login{
		     width: 230px;
	        -ms-user-select: none;
	        -moz-user-select: none;
	        -khtml-user-select: none;
	        -webkit-user-select: none;
	        user-select: none;
		}
		#rank{
			display:flex;
			flex-wrap: wrap;
			align-content: center;
			justify-content: center;
			font-size:16px;
			text-align: center;
		}
		
		#rank h3{
			margin:10px 0;
			padding:10px 0;
			font-size:15px;
			text-align: center;
		}
		
		#myrank{
			border: 2px solid black;
		}
		#kakao-link-btn{
			margin:20px;
		}
		
		#btn3 > button{
			padding: 0;
			border: none;
			background: none;
			margin:5px 10px;
		}
		#naver_img{
			cursor:pointer;
		    width: 112px;
   			height: 101px;
		}
</style>


<body style="overflow-x:auto; overflow-y:scroll;">

    <header><h1><a onClick="top.location='javascript:location.reload()'"><img src="/img/logo.png"></a></h1></header>
    <nav><%@ include file="/form/navi.jsp"%></nav>
    
  <section>
  

  
  <div id="left">
    <!-- 동영상 -->
    <div id="video">
      <h3>가장 많이 조회된 동영상</h3>
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
    </div>
    
    <!-- 소모임 -->
    <div>
      <h3>내 주변 소모임</h3>
      <div id="group">
      
      </div>
    </div>
    
    <!-- 공지사항 -->
    <div>
   		   <h3><a onClick="top.location='javascript:location.reload()'">공지사항</a></h3>
      <div id="notic">
        <table border="1">
        	<col width="900px"> <col width="200px">
        	<tr>
          	<th>제목</th>
          	<th>날짜</th>
          	</tr>
          	<c:choose>
					<c:when test = "${empty noti_list}">
						<tr>
							<td colspan = "4">======== 로그인 후에 확인 할 수 있습니다. =========</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items = "${noti_list}" var = "dto">
							<tr>
								<td><a href = "mypage_controller.do?command=notice_detail&noti_no=${dto.noti_no }">${dto.noti_title }</a></td>
								<td>${dto.noti_regdate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
			</c:choose>
        </table>
      </div>
    </div>
  </div>

  <div id="m-right">
  
    <!-- 회원 정보 -->
    <div id="login">
        <div class="loginboard_form">
        	<%@ include file="../form/logout.jsp"%>
    	</div>
    </div>

    <!-- 회원 랭킹 -->
    <div id="rank">
      <h3>우리 학년에서 나는 몇위 ?</h3>
      <table id="rank-table" border="1">
          <col width="100px"><col width="100px"><col width="100px">
          <tr>
          <th>순위</th>
          <th>이름</th>
          <th>포인트</th>
          </tr>
         
          <c:choose>
          	<c:when test="${empty rank_list }">
          		<tr>
					<td colspan="4">로그인 후에 확인 할 수 있습니다.</td>
				</tr>
          	</c:when>
          	<c:otherwise>
          		<c:forEach items="${rank_list }" var="rank" varStatus="i" end="4" >
          			<%-- <c:forEach var="i" begin="1" end="10" step="1"> --%>
		          		<tr>
		          			<td>${i.count }</td>
		          			<td>${rank.user_name }</td>
		          			<td>${rank.user_point }</td>
		       			</tr>
	       			<%-- </c:forEach> --%>
          		</c:forEach>
          	</c:otherwise>
          </c:choose>
       
          	<tr id="myrank">
          		<td>${no }</td>
          		<td>${name }</td>
          		<td>${point }</td>
          	</tr> 
  
	  
      </table>
  		
		<!-- 메인페이지 , 랭크 공유x 링크 공유o -->
		<!-- 카카오 공유 -->		
		<a id="kakao-link-btn" href="javascript:;">
		<img src="//dev.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
		</a>
		
  		<div id="btn3">
		<!-- 네이버 공유 -->
		<button type='button' id='naver_share' >
		<img  id="naver_img" src="img/img_naver_share_07.png" width="68px" height="69px">
		</button>
		</div>
		
    </div>
  </div>
</section>


<footer><%@ include file="/form/footer.jsp"%></footer>
</body>

<!--  네이버 공유 -->
<script>
/*  로컬 url 공유 안됨*/
$("#naver_share").click(function(e) {     
	var share_url = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=soso+school';
	var title = 'sosoSchool';
 	var url = 'http://share.naver.com/web/shareView.nhn?url='+encodeURIComponent(share_url)+'&title='+encodeURIComponent(title);
 	window.open( url, 'share', 'width=500, height=500' );
   });
</script>

<!--  카카오 공유 -->
<!--  개인 URL 주소 또는 포트번호만 공유 구현포트번호)http://localhost:8082 다르면 안나옴-->
<script>
  try {
	  /*  카카오 개인 API */
    Kakao.init('f2f261c1d73372ce68cafe92884b78e0')
   
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
        content: {
          title: 'SoSo School',
          description: '초등 학습 강의',
        imageUrl:'../img/logo',
        link: {
            mobileWebUrl: 'https://developers.kakao.com',
            androidExecParams: 'test',
        },
      },
   
      buttons: [
        {
          title: '웹으로 이동',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 이동',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
          },
        },
      ]
    });
  ; window.kakaoDemoCallback && window.kakaoDemoCallback() }
  catch(e) {
	  window.kakaoDemoException && window.kakaoDemoException(e) 
  }
</script>