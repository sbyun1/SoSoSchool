<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<html>
<head>
<meta charset="UTF-8">
<title>소모임-지역별모임</title>
<style type="text/css">
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
        width: 980px;     /*메인 구역 전체 width값*/
        display: flex;
        flex-wrap: wrap;
        -ms-user-select: none;      /*드래그 금지*/
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    
    section .mainform #mainlist{
        min-width: 980px;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 980px;
        min-height: 150px;
        font-size: 20px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
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
	li{
	list-style-type : none;
	font-weight: bold;
	font-size: 20px;
	font-style: normal;
	margin-bottom: 30px;
	}
	article{
	width: 400px;
	margin:5px 215px 5px 215px;
	}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75b254744116d7bd060af664edcc1974"></script>
</head>
<body>
<header style="border:1px black; height: 120px; width: 1200px;">
<h1><img src="../img/logo.png"></h1>
</header>
<nav style="border: 1px solid rgb(173,175,255); background-color: rgb(173,175,255);">
    <%@ include file="../form/navi.jsp" %>
</nav>
	<section>
		<div class="menuform">
	        <ul>
	            <li style="margin-bottom:60px; font-size:30px">소모임</li>
	            <li><a>지역별 모임</a></li>
	            <li><a>소모임별 랭킹</a></li>
	            <li><a>채팅하기</a></li>
	        </ul>
	    </div>
	    
	    <div class="mainform">
        <div id="mainlist">
            <div class="title">
                내 주변 도서관을 지정하세요
            </div>
          
				<article id="map" style="width:500px;height:400px;">
					<script>
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};
				
					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
					</script>
				</article>
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