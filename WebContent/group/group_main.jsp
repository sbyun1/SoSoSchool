<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>소모임</title>
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
        width: 100%;
        height: 50px;
        display: flex;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    /*본문 X구역*/
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
    /*본문 구역*/
    section .mainform{
        min-width: 750px;
        min-height: 700px;
        display: flex;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    #leftform{
        width: 375px;
        min-height: 500px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    #leftform #infoform{
        width: 375px;
        min-height: 200px;
        font-size: 20px;
        font-weight: bold;
        display: flex;
        align-items: center;
        margin-left: 50px;
        margin-top: 20px;
    }
    #leftform #regionform{
        width: 375px;
        min-height: 100px;
        font-size: 20px;
        margin-bottom: 20px;
        margin-left: 20px;
    }
    #leftform #mapform{
        width: 375px;
        min-height: 350px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #rightform{
        width: 375px;
        min-height: 500px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    #rightform #imgform{
        width: 320px;
        height: 300px;
        margin-right: 60px;
        background-color: deeppink;
    }
    #rightform #rankingform{
        width: 375px;
        height: 200px;
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
</style>
<%
    UserDto userdto = (UserDto) request.getAttribute("userdto");
%>
<script type="text/javascript">
	window.onload = function (){
		if(${userdto.user_id eq null}){
			alert("세션 만료");
			location.href='../main_controller.do?command=start';
		}
	}
</script>
<body>
<header>
    <%@ include file="../form/header.jsp"%>
</header>
<nav>
    <%@ include file="../form/navi.jsp"%>
</nav>
<section>
    <div class="menuform">
        <%@ include file="../form/group_menubar.jsp"%>
    </div>
    <div class="mainform">      <%--메인 구역--%>
        <div id="leftform">     <%--왼쪽 구역(설명하는 공간, 지역 알림창, 지도)--%>
            <div id="infoform">
                학교에서 함께 공부할 수 없는<br>
                아이들에게 함께 모여 공부하고<br>
                친구들을 만날 수 있는 기회를<br>
                줍니다
            </div>
            <div id="regionform">
                <div style="font-weight: bold; font-size: 30px; margin-left: 20px">나의 소속 지역</div>
                <div style="margin-top: 10px; margin-left: 40px">
                    <c:choose>
                        <c:when test="${userdto.region eq 'SEOUL'}">
                            서울
                        </c:when>
                        <c:when test="${userdto.region eq 'GYEONGGI'}">
                            경기도
                        </c:when>
                        <c:when test="${userdto.region eq 'INCHEON'}">
                            인천
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <div id="mapform">
                <c:choose>
                    <c:when test="${userdto.region eq 'SEOUL'}">
                        <%@ include file="../form/map_seoul.jsp"%>
                    </c:when>
                    <c:when test="${userdto.region eq 'GYEONGGI'}">
                        <%@ include file="../form/map_gyeonggi.jsp"%>
                    </c:when>
                    <c:when test="${userdto.region eq 'INCHEON'}">
                        <%@ include file="../form/map_incheon.jsp"%>
                    </c:when>
                </c:choose>
            </div>

        </div>
        <div id="rightform">      <%--오른쪽 구역(이미지, 랭킹)--%>
            <div id="imgform">
				<img src = "../img/group2.png" 
				style = " width: 320px;height: 300px;margin-right: 60px;">
            </div>
            <div id="rankingform">
                <div id="ranking_name" style="font-weight: bold;">
                    <c:choose>
                        <c:when test="${userdto.region eq 'SEOUL'}">
                            서울 랭킹
                        </c:when>
                        <c:when test="${userdto.region eq 'GYEONGGI'}">
                            경기도 랭킹
                        </c:when>
                        <c:when test="${userdto.region eq 'INCHEON'}">
                            인천 랭킹
                        </c:when>
                    </c:choose>
                </div>
                <div id="ranking_table">
                    <style>
                        #rank-table{
                            border-collapse: collapse;
                        }
                        th{
                            border: 1px solid black;
                        }
                        td{
                            border: 1px solid black;
                            height: 20px;
                        }
                    </style>
                    <table id="rank-table">
                        <col width="100px"><col width="100px"><col width="100px">
                        <tr>
                            <th>순위</th>
                            <th>이름</th>
                            <th>포인트</th>
                            <th width="40px">지역</th>
                        </tr>
                        <c:choose>
                            <c:when test="${empty rank_list}">
                                <tr>
                                    <td colspan="4">로그인 후에 확인 할 수 있습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${rank_list}" var="rank" varStatus="i" end="4" >
                                    <%-- <c:forEach var="i" begin="1" end="10" step="1"> --%>
                                    <tr>
                                        <td>${i.count }</td>
                                        <td>${rank.user_name }</td>
                                        <td>${rank.user_point }</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${rank.region eq 'SEOUL'}">
                                                    서울
                                                </c:when>
                                                <c:when test="${rank.region eq 'GYEONGGI'}">
                                                    경기도
                                                </c:when>
                                                <c:when test="${rank.region eq 'INCHEON'}">
                                                    인천
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <%-- </c:forEach> --%>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <tr id="myrank" style="font-weight: bold">
                            <td>${no}</td>
                            <td>${name}</td>
                            <td>${point}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${region eq 'SEOUL'}">
                                        서울
                                    </c:when>
                                    <c:when test="${region eq 'GYEONGGI'}">
                                        경기도
                                    </c:when>
                                    <c:when test="${region eq 'INCHEON'}">
                                        인천
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
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
