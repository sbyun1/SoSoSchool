<%@ page import="java.util.List" %>
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
<title>자료실 게시판</title>
</head>
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin/admin_main.jsp'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">자료실 게시글</h1>
    </div>
    <div id="board_form">
        <div id="board_list">
            <div id="select_form">
                <select id="select_grade" onchange="change_region();">
                    <option value="none">선택</option>
                    <option value="grade1_kor">1학년 국어</option>
                    <option value="grade1_math">1학년 수학</option>
                    <option value="grade1_eng">1학년 영어</option>
                    <option value="grade2_kor">2학년 국어</option>
                    <option value="grade2_math">2학년 수학</option>
                    <option value="grade2_eng">2학년 영어</option>
                    <option value="grade3_kor">3학년 국어</option>
                    <option value="grade3_math">3학년 수학</option>
                    <option value="grade3_eng">3학년 영어</option>
                </select>
            </div>
            <script type="text/javascript">
                var selectoption = document.getElementById("select_grade");
                selectoption = selectoption.options[selectoption.selectedIndex].value;

                window.onload = function (){
                    if(selectoption == 'none'){
                        var tr_all = document.getElementById("board_list_form");
                        var gg =
                            "<c:forEach var="list_all" items="${list_all}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                }
            </script>
            <script type="text/javascript">
                function change_region(){
                    var selectoption = document.getElementById("select_grade");
                    selectoption = selectoption.options[selectoption.selectedIndex].value;

                    if(selectoption == 'none'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${list_all}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade1_kor'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${kor_1}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade1_math'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${math_1}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade1_eng'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${eng_1}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade2_kor'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${kor_2}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade2_math'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${math_2}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade2_eng'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${eng_2}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade3_kor'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${kor_3}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade3_math'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${math_3}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                    else if(selectoption == 'grade3_eng'){
                        var tr_all = document.getElementById("board_list_form");
                        tr_all.innerHTML="";
                        var gg =
                            "<c:forEach var="list_all" items="${eng_3}">"+
                            "<div style='width : 1190px; height : 100px; display: flex; flex-wrap: wrap;'>"+
                            "<div style='width : 90px; height : 100%'>${list_all.rboard_no}</div>"+
                            "<div style='width : 300px' onclick=" + "location.href='reference_controller.do?command=board_detail&rboard_no=${list_all.rboard_no}'" + " class='title'>${list_all.rboard_title}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_grade}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_subject}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_type}</div>"+
                            "<div style='width : 200px; height : 100%'>${list_all.rboard_regdate}</div>"+
                            "</div>"+
                            "</c:forEach>";
                        tr_all.innerHTML = gg;
                    }
                }
            </script>
            <div style="display: flex; flex-wrap: wrap; justify-content: center; width: 1190px">
                <div style="display: flex; flex-wrap: wrap; justify-content: center; align-items: center; height: 80px">
                    <div style="width: 90px">글번호</div>
                    <div style="width: 300px">제목</div>
                    <div style="width: 200px">학년</div>
                    <div style="width: 200px">과목</div>
                    <div style="width: 200px">게시물타입</div>
                    <div style="width: 200px">등록일</div>
                </div>
                <div id="board_list_form" style="display: flex; flex-wrap: wrap; width: 1190px">
                    <c:choose>
                        <c:when test="${empty list_all}">
                            <div>게시글이 없습니다..</div>
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <div style="width: 100%; height: 100px"><button onclick="location.href='../reference_controller.do?command=ref_board_insert_form'">글 등록</button></div>
                </div>
            </div>
        </div>
        
    </div>
</section>
</body>
</html>