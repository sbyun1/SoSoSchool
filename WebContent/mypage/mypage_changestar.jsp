<%@ page import="java.util.List" %>
<%@ page import="mypageDto.changeStarDto" %>
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
    /*상품 교환*/
    section .mainform #mainlist{
        min-width: 100%;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
    }
    section .mainform #mainlist .title{
        min-width: 100%;
        min-height: 150px;
        font-size: 50px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .star_info{
        background-color: lightgrey;
        width: 500px;
        height: 150px;
        font-size: 30px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    /*버튼*/
    section .mainform #buttonform{
        min-width: 100%;
        height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #buttonform .button{
        width: 200px;
        height: 50px;
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
<script type="text/javascript">
    function checkOnlyOne(element) {
        const checkboxes = document.getElementsByName("item");

        checkboxes.forEach((cb) => {
            cb.checked = false;
        })
        element.checked = true;
    }
    function changeitem(){
        // 선택된 목록 가져오기
        const query = 'input[name="item"]:checked';
        const selectedEls = document.querySelectorAll(query);

        // 선택된 목록에서 value 찾기
        let result = '';
        selectedEls.forEach((el) => {
            result += el.value + '';
        });

        location.href='../mypage_controller.do?command=changegift&gi_no='+result+'&user_star=${userdto.user_star}&user_no=${userdto.user_no}';
    }
</script>
<%
    List<changeStarDto> list = (List<changeStarDto>) request.getAttribute("list");
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
        <%@ include file="../form/mypage_menubar.jsp"%>
    </div>
    <div class="mainform">
        <div id="mainlist">
            <div class="title">
                상품 교환
            </div>
            <div style="width: 750px; height: 150px; display: flex; flex-wrap: wrap; margin-bottom: 50px">
                <div style="width: 125px; height: 150px; display: block"></div>
                <div class="star_info">
                    ★ 나의 스티커 ${userdto.user_star}개
                </div>
                <div style="width: 125px; height: 150px;"></div>
            </div>
            <div style="width: 750px; min-height: 150px; display: flex; flex-wrap: wrap">
                <div style="width: 125px; min-height: 150px"></div>
                <div class="prize_info" style="width: 500px; min-height: 150px; display: flex; flex-wrap: wrap">
                    <ul style="list-style: none; display: flex; flex-wrap: wrap; margin-left: 8%">
                        <c:forEach var="list" items="${list}">
                            <li style=" margin: auto 40px 10px 0px">
                                <div id="one_board" style="width: 150px; height: 150px;">
                                    <div id="board_img" style="width: 150px; height: 100px; border: 1px solid black"><img src="../img/${list.gi_img}.png"></div>
                                    <div id="board_title" style="width: 150px; height: 50px; display: flex; flex-wrap: wrap; align-items: center; font-weight: bold"><input type="checkbox" name="item" value="${list.gi_no}" onclick="checkOnlyOne(this)" style="width: 25px; height: 25px">${list.gi_title}/★${list.gi_prize}</div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div style="width: 125px; min-height: 150px"></div>
            </div>
        </div>
        <div id="buttonform">
            <button class="button" onclick="changeitem();">교환하기</button>
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