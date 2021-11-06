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
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
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
    section{
        min-width: 1190px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
    #title_form{
        width: 1190px;
        height: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #board_form{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .button{
        width: 100px;
        height: 50px;
        font-size: 20px;
        font-weight: bold;
        background-color: rgb(173,175,255);
        border: 0;
        outline: 0;
        color: white;
        border-radius: 10px;
    }
</style>
<title>소그룹 게시판</title>
</head>
<script type="text/javascript">
    function delete_board(no){
        var chk = confirm("상품을 삭제하시겠습니까?");
        var num = no;
        if(chk == true){
            alert(num);
            location.href='../mypage_controller.do?command=changestar_delete&gi_no='+num;
        }
    }
</script>
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin/admin_main.jsp'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">상품 리스트</h1>
    </div>
    <div id="board_form">
        <div id="board_list">
            <div style="display: flex; flex-wrap: wrap; justify-content: center; width: 1190px">
                <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; height: 80px">
                    <div style="width: 100px">글 번호</div>
                    <div style="width: 250px">상품명</div>
                    <div style="width: 250px">상품 가격</div>
                    <div style="width: 200px">상품 수량</div>
                    <div style="width: 200px; display: flex; justify-content: center; align-items: center">상품 이미지</div>
                    <div style="width: 190px"></div>
                </div>
                <div id="board_list_form" style="display: flex; flex-wrap: wrap; width: 1190px">
                    <c:choose>
                        <c:when test="${empty list}">
                            <div style="width: 1190px">게시글이 없습니다..</div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="list" items="${list}">
                                <form action="../mypage_controller.do" method="post" style="width: 1190px; display: flex; flex-wrap: wrap">
                                    <input type="hidden" name="gi_no" value="${list.gi_no}">
                                    <input type="hidden" name="command" value="changestar_value">
                                    <div style="width: 100px">${list.gi_no}</div>
                                    <div style="width: 250px" onclick="delete_board(${list.gi_no});">${list.gi_title}</div>
                                    <div style="width: 250px"><input type="text" name="gi_prize" style="width: 30px" value="${list.gi_prize}"></div>
                                    <div style="width: 200px"><input type="text" name="gi_stock" style="width: 30px" value="${list.gi_stock}"></div>
                                    <div style="width: 200px; display: flex; justify-content: center; align-items: center">
                                        <img src="../img/${list.gi_img}.png">
                                    </div>
                                    <div style="width: 190px; display: flex; justify-content: center; align-items: center">
                                        <input type="submit" class="button" value="상품 수정">
                                    </div>
                                </form>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <div style="width: 100%; height: 100px">
                        <button class="button" onclick="location.href='../mypage_controller.do?command=changestar_insert_form'">상품 추가</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
</body>
</html>