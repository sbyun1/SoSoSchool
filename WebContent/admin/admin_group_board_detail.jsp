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
    <%--window.onload = function (){--%>
    <%--    if(${gdto.gboard_img eq 'img1'}){--%>
    <%--        $("#img_check").val('img1').prop("selected", true);--%>
    <%--    }--%>
    <%--    else if(${gdto.gboard_img eq 'img2'}){--%>
    <%--        $("#img_check").val('img2').prop("selected", true);--%>
    <%--    }--%>
    <%--    else if(${gdto.gboard_img eq 'img3'}){--%>
    <%--        $("#img_check").val('img3').prop("selected", true);--%>
    <%--    }--%>
    <%--}--%>
    function change_img(){
        var selectoption = document.getElementById("img_check");
        selectoption = selectoption.options[selectoption.selectedIndex].value;
        if(selectoption == 'img1'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/img1.png');
        }else if(selectoption == 'img2'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/img2.png');
        }else if(selectoption == 'img3'){
            $("#img").attr('src','');
            $("#img").attr('src','../img/img3.png');
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
        <h1 style="width: 190px; height: 35px; position: absolute">${gdto.gboard_title}</h1>
    </div>
    <form action="../group_controller.do" method="post">
        <input type="hidden" name="gboard_no" value="${gdto.gboard_no}">
        <input type="hidden" name="command" value="group_board_detail_update">
        <div id="board_form">
            <div style="width: 1190px; height: 100px; display: flex; flex-wrap: wrap; align-items: center; justify-content: center">
                <div style="width: 400px; height: 100%; display: flex; justify-content: center; align-items: center; font-size: 30px; font-weight: bold">글 번호</div>
                <div style="width: 790px; height: 100%; display: flex; align-items: center">${gdto.gboard_no}</div>
            </div>
            <div class="title_form">
                <div class="title">제목</div>
                <div class="change_title_form"><input class="change_title" type="text" name="title" value="${gdto.gboard_title}"></div>
            </div>
            <div class="subtitle_form">
                <div class="subtitle">부제목</div>
                <div class="change_subtitle_form"><input class="change_subtitle" type="text" name="subtitle" value="${gdto.gboard_subtitle}"></div>
            </div>
            <div class="content_form">
                <div class="content">내용</div>
                <div class="change_content_form"><textarea class="change_content" name="content">${gdto.gboard_content}</textarea></div>
            </div>
            <div class="img_form">
                <div class="img">이미지</div>
                <div class="change_img_form">
                    <div id="img_box">
                        <img id="img" src="../img/${gdto.gboard_img}.png">
                    </div>
                    <div id="img_sel">
                        <select id="img_check" name="img" onchange="change_img();">
                            <option value="img1" ${gdto.gboard_img eq 'img1' ? 'selected':''}>img1</option>
                            <option value="img2" ${gdto.gboard_img eq 'img2' ? 'selected':''}>img2</option>
                            <option value="img3" ${gdto.gboard_img eq 'img3' ? 'selected':''}>img3</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="button_form">
                <input class="button" type="submit" value="수정">
                <input class="button" type="button" value="삭제" onclick="location.href='../group_controller.do?command=group_board_delete&gboard_no=${gdto.gboard_no}'">
            </div>
        </div>
    </form>
</section>
</body>
</html>