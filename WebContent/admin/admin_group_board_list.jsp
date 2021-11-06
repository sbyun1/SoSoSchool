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
    button{
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
    .title{
        width : 200px;
        height : 100%;
    }
</style>
<title>소그룹 게시판</title>
</head>
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin/admin_main.jsp'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">소그룹 페이지 추가</h1>
    </div>
    <div id="board_form">
        <div id="board_list">
            <div id="select_form">
                <select id="select_region" onchange="change_region();">
                    <option value="none">선택</option>
                    <option value="seoul">서울</option>
                    <option value="gyeonggi">경기</option>
                    <option value="incheon">인천</option>
                </select>
                <script type="text/javascript">
                    var selectoption = document.getElementById("select_region");
                    selectoption = selectoption.options[selectoption.selectedIndex].value;

                    window.onload = function (){
                        if(selectoption == 'none'){
                            var tr_all = document.getElementById("board_list_form");
                            var gg =
                        "<c:forEach var="list_all" items="${list_all}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 80px; height : 100%'>${list_all.gboard_no}</div>"+
                            "<div onclick=" + "location.href='group_controller.do?command=group_board_detail&gboard_no=${list_all.gboard_no}'" + " class='title'>${list_all.gboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.gboard_subtitle}</div>"+
                            "<div style='width : 150px; height : 100%'>${list_all.gboard_region}</div>"+
                            "<div style='width : 150px; height : 100%'>${list_all.gboard_library}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.regdate}</div>"+
                            "<div style='width : 210px; height : 100%'><img src='../img/${list_all.gboard_img}.png'></div>"+
                            "</div>"+
                        "</c:forEach>";
                            tr_all.innerHTML = gg;
                        }
                    }
                </script>
                <script type="text/javascript">
                    function change_region(){
                        var selectoption = document.getElementById("select_region");
                        selectoption = selectoption.options[selectoption.selectedIndex].value;

                        if(selectoption == 'none'){
                            var tr_all = document.getElementById("board_list_form");
                            tr_all.innerHTML="";
                            var gg =
                                "<c:forEach var="list_all" items="${list_all}">"+
                                "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                                "<div style='width : 80px; height : 100%'>${list_all.gboard_no}</div>"+
                                "<div onclick=" + "location.href='group_controller.do?command=group_board_detail&gboard_no=${list_all.gboard_no}'" + " class='title'>${list_all.gboard_title}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_all.gboard_subtitle}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_all.gboard_region}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_all.gboard_library}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_all.regdate}</div>"+
                                "<div style='width : 210px; height : 100%'><img src='../img/${list_all.gboard_img}.png'></div>"+
                                "</div>"+
                                "</c:forEach>";
                            tr_all.innerHTML = gg;
                        }
                        else if(selectoption == 'seoul'){
                            var tr_all = document.getElementById("board_list_form");
                            tr_all.innerHTML="";
                            var gg =
                                "<c:forEach var="list_seoul" items="${list_seoul}">"+
                                "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                                "<div style='width : 80px; height : 100%'>${list_seoul.gboard_no}</div>"+
                                "<div onclick=" + "location.href='group_controller.do?command=group_board_detail&gboard_no=${list_seoul.gboard_no}'" + " class='title'>${list_seoul.gboard_title}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_seoul.gboard_subtitle}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_seoul.gboard_region}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_seoul.gboard_library}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_seoul.regdate}</div>"+
                                "<div style='width : 210px; height : 100%'><img src='../img/${list_seoul.gboard_img}.png'></div>"+
                                "</div>"+
                                "</c:forEach>";
                            tr_all.innerHTML = gg;
                        }
                        else if(selectoption == 'gyeonggi'){
                            var tr_all = document.getElementById("board_list_form");
                            tr_all.innerHTML="";
                            var gg =
                                "<c:forEach var="list_gyeonggi" items="${list_gyeonggi}">"+
                                "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                                "<div style='width : 80px; height : 100%'>${list_gyeonggi.gboard_no}</div>"+
                                "<div onclick=" + "location.href='group_controller.do?command=group_board_detail&gboard_no=${list_gyeonggi.gboard_no}'" + " class='title'>${list_gyeonggi.gboard_title}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_gyeonggi.gboard_subtitle}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_gyeonggi.gboard_region}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_gyeonggi.gboard_library}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_gyeonggi.regdate}</div>"+
                                "<div style='width : 210px; height : 100%'><img src='../img/${list_gyeonggi.gboard_img}.png'></div>"+
                                "</div>"+
                                "</c:forEach>";
                            tr_all.innerHTML = gg;
                        }
                        else if(selectoption == 'incheon'){
                            var tr_all = document.getElementById("board_list_form");
                            tr_all.innerHTML="";
                            var gg =
                                "<c:forEach var="list_incheon" items="${list_incheon}">"+
                                "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                                "<div style='width : 80px; height : 100%'>${list_incheon.gboard_no}</div>"+
                                "<div onclick=" + "location.href='group_controller.do?command=group_board_detail&gboard_no=${list_incheon.gboard_no}'" + " class='title'>${list_incheon.gboard_title}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_incheon.gboard_subtitle}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_incheon.gboard_region}</div>"+
                                "<div style='width : 150px; height : 100%'>${list_incheon.gboard_library}</div>"+
                                "<div style='width : 200px; height : 100%'>${list_incheon.regdate}</div>"+
                                "<div style='width : 210px; height : 100%'><img src='../img/${list_incheon.gboard_img}.png'></div>"+
                                "</div>"+
                                "</c:forEach>";
                            tr_all.innerHTML = gg;
                        }
                    }
                </script>
            </div>

            <div style="display: flex; flex-wrap: wrap; justify-content: center; width: 1190px">
                <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; height: 80px">
                    <div style="width: 80px">글번호</div>
                    <div style="width: 200px">제목</div>
                    <div style="width: 200px">부제목</div>
                    <div style="width: 150px">지역</div>
                    <div style="width: 150px">도서관</div>
                    <div style="width: 200px">등록일</div>
                    <div style="width: 210px">이미지</div>
                </div>
                <div id="board_list_form" style="display: flex; flex-wrap: wrap; width: 1190px">
                    <c:choose>
                        <c:when test="${empty list_all}">
                            <td>게시글이 없습니다..</td>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <div style="width: 100%; height: 100px"><button onclick="location.href='../group_controller.do?command=group_board_insert_form'">글 등록</button></div>
                </div>
            </div>
        </div>

    </div>
</section>
</body>
</html>