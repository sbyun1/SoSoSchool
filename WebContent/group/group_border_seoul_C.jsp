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
    section .borderform #borderlist{
        list-style: none;
        width: 100%;
        height: 100%;
        display: flex;
        flex-wrap: wrap;
    }
    section .borderform #borderlist .one_border{
        min-width: 300px;
        height: 300px;
        margin: 60px 0px 30px 100px;
    }
    section .borderform #borderlist .one_border #border_content{
        width: 100%;
        height: 100%;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
    section .borderform #borderlist .one_border #border_content #img{
        border: 1px solid black;
        background-color: white;
        width: 350px;
        height: 210px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .borderform #borderlist .one_border #border_content #img img{
		width: 50px;
		height: 70px;
	}
    section .borderform #borderlist .one_border #border_content .titleform{
        width: 100%;
        height: 30%;

    }
    section .borderform #borderlist .one_border #border_content .titleform #title{
        width: 100%;
        height: 50%;
        font-size: 30px;
        font-weight: bold;
        text-align: left;
    }
    section .borderform #borderlist .one_border #border_content .titleform #subtitle{
        width: 100%;
        height: 50%;
        font-size: 25px;
        font-weight: bold;
        text-align: left;
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
        <div id="borderlist">
            <c:forEach var="list" begin="1" end="9">
                <div class="one_border">
                    <div id="border_content">
                        <div id="img">
                            <img src="../img/img01.png">
                        </div>
                        <div class="titleform">
                            <div id="title">
                                제목
                            </div>
                            <div id="subtitle">
                                부제목
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<footer>
    <%@ include file="../form/footer.jsp"%>
</footer>
</body>
</html>