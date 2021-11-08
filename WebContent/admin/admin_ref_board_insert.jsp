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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        #main_title_form{
            width: 1190px;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #board_form{
            width: 1190px;
            min-height: 500px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
        }
        /*제목구역*/
        .title_form{
            width: 1190px;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .title{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 400px;
            height: 100%;
            font-size: 30px;
            font-weight: bold;
        }
        .change_title_form{
            display: flex;
            align-items: center;
            width: 790px;
            height: 100%;
        }
        .change_title{
            font-size: 20px;
            width: 400px;
            height: 40px;
        }
        /*부제목 구역*/
        .subtitle_form{
            width: 1190px;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .subtitle{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 400px;
            height: 100%;
            font-size: 30px;
            font-weight: bold;
        }
        .change_subtitle_form{
            display: flex;
            align-items: center;
            width: 790px;
            height: 100%;
        }
        .change_subtitle{
            font-size: 20px;
            width: 400px;
            height: 40px;
        }
        /*내용 구역*/
        .content_form{
            width: 1190px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .content{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 400px;
            height: 300px;
            font-size: 30px;
            font-weight: bold;
        }
        .change_content_form{
            display: flex;
            align-items: center;
            width: 790px;
            height: 300px;
        }
        .change_content{
            width: 100%;
            height: 100%;
            font-size: 20px;
            resize: none;
        }

        /*이미지 구역*/
        .img_form{
            width: 1190px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        .img{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 400px;
            height: 80px;
            font-size: 30px;
            font-weight: bold;
        }
        .change_img_form{
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            width: 790px;
            height: 100%;
        }
        #img_box{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100px;
            height: 100%;
        }
        #img_sel{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 390px;
            height: 100%;
        }

        /*버튼 구역*/
        .button_form{
            width: 1190px;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /*선택 구역*/
        .select_form{
            width: 1190px;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        #region_sel_form{
            width: 595px;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }
        #library_sel_form{
            width: 595px;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        /*버튼*/
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
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="main_title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin_controller.do?command=ref'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">글 작성</h1>
    </div>
    <form action="../reference_controller.do" method="post">
        <input type="hidden" name="command" value="ref_board_insert">
        <div id="board_form">
            <div class="title_form">
                <div class="title">제목</div>
                <div class="change_title_form"><input class="change_title" type="text" name="title"></div>
            </div>
            <div class="content_form">
                <div class="content">내용</div>
                <div class="change_content_form"><textarea class="change_content" name="content" placeholder="width:500; height:200으로 설정"></textarea></div>
            </div>
            <div class="img_form">
                <div class="img">학년</div>
                <div class="change_img_form">
                    <div id="img_sel">
                        <select id="img_check" name="grade">
                            <option value="1">1학년</option>
                            <option value="2">2학년</option>
                            <option value="3">3학년</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="img_form">
                <div class="img">과목</div>
                <div class="change_img_form">
                    <div id="img_sel">
                        <select id="img_check" name="subject">
                            <option value="KOR">국어</option>
                            <option value="ENG">영어</option>
                            <option value="MATH">수학</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="img_form">
                <div class="img">종류</div>
                <div class="change_img_form">
                    <div id="img_sel">
                        <select name="type">
                            <option value="DOCU">파일</option>
                            <option value="VIDEO">비디오</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="button_form">
                <input class="button" type="submit" value="작성">
            </div>
        </div>
    </form>
</section>
</body>
</html>