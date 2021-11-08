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
        height: 300px;
        font-size: 30px;
        font-weight: bold;
    }
    .change_img_form{
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        width: 790px;
        height: 300px;
    }
    #img_box{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100px;
        height: 100px;
    }
    #img_sel{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 390px;
        height: 300px;
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
<script type="text/javascript">
    function change_img(){
        var selectoption = document.getElementById("img_check");
        selectoption = selectoption.options[selectoption.selectedIndex].value;

        if(selectoption == 'banana'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/banana.png');
        }else if(selectoption == 'chocolate'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/chocolate.png');
        }else if(selectoption == 'gimbab'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/gimbab.png');
        }else if(selectoption == 'dosirak'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/dosirak.png');
        }else if(selectoption == 'nintendo'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/nintendo.png');
        }

    }
</script>
<title>소그룹 게시판</title>
</head>
<body>
<header>
    <img src = "../img/logo.png">
</header>
<section>
    <div id="main_title_form">
        <div style="position: relative; right: 500px; font-weight: bold" onclick="location.href='../admin_controller.do?command=group'">뒤로가기</div>
        <h1 style="width: 190px; height: 35px; position: absolute">상품 추가</h1>
    </div>
    <form action="../mypage_controller.do" method="post">
        <input type="hidden" name="command" value="changestar_board_insert">
        <div id="board_form">
            <div class="title_form">
                <div class="title">상품명</div>
                <div class="change_title_form"><input class="change_title" type="text" name="title"></div>
            </div>
            <div class="subtitle_form">
                <div class="subtitle">가격</div>
                <div class="change_subtitle_form"><input class="change_subtitle" type="number" name="prize"></div>
            </div>
            <div class="subtitle_form">
                <div class="subtitle">수량</div>
                <div class="change_subtitle_form"><input class="change_subtitle" type="number" name="stock"></div>
            </div>
            <div class="img_form">
                <div class="img">이미지</div>
                <div class="change_img_form">
                    <div id="img_box">
                        <img id="img" src="../img/banana.png">
                    </div>
                    <div id="img_sel">
                        <select id="img_check" name="img" onchange="change_img();">
                            <option value="banana">바나나맛우유</option>
                            <option value="chocolate">초콜릿</option>
                            <option value="gimbab">삼각김밥</option>
                            <option value="dosirak">도시락</option>
                            <option value="nintendo">닌텐도</option>
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