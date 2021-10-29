<%@ page import="java.util.List" %>
<%@ page import="group.groupDto" %>
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
    /*    본문구역                                            */
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
    /*게시판 목록*/
    section .borderform{
        width: 980px;
        display: flex;
        -ms-user-select: none;      /*드래그 금지*/
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
    groupDto dto = (groupDto) request.getAttribute("dto");
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
    <div class="borderform">
        <div id="board_detail" style="display: flex; flex-wrap: wrap; align-items:center; width: 980px;">
            <div id="titleform" style="width: 980px; height: 120px; display: flex; flex-wrap: wrap; justify-content: center; align-items: center; margin-bottom: 0px">
                <div style="width: 300px; font-size: 25px; font-weight: bold; display: flex; justify-content: center; align-items: center">제목</div>
                <div style="width: 680px; font-size: 15px; display: flex; align-items: center">${dto.gboard_title}</div>
            </div>
            <div id="subtitleform" style="width: 980px; height: 50px; display: flex; flex-wrap: wrap; justify-content: center; align-items: center">
                <div style="width: 300px; font-size: 25px; font-weight: bold; display: flex; justify-content: center; align-items: center">부제목</div>
                <div style="width: 680px; font-size: 15px; display: flex; align-items: center">${dto.gboard_subtitle}</div>
            </div>
            <div id="contentform" style="width: 980px; height: 230px; display: flex; flex-wrap: wrap; align-items: center">
                <div style="width: 300px; font-size: 25px; font-weight: bold; display: flex; justify-content: center; ">내용</div>
                <div style="width: 680px; font-size: 15px; display: flex; align-items: center">
                	<textarea style="width: 680px; min-height: 180px; resize: none;" readonly>${dto.gboard_content}</textarea>
                </div>
            </div>
            <div id="buttonform" style="width: 980px; height: 100px; display: flex; flex-wrap: wrap; justify-content: center; align-items: center">
                <button style="width: 200px; height: 50px; font-size: 20px; font-weight: bold; background-color: rgb(173,175,255); border: 0; outline: 0; color: white; border-radius: 10px" onclick="javascript:history.back(-1)">목록으로</button>
            </div>
        </div>
    </div>
</section>
<footer>
    <%@ include file="../form/footer.jsp"%>
</footer>
</body>
</html>