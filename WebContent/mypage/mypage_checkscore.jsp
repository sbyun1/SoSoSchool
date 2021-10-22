<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ page import="com.soso.result.rusult_dao.result_dao" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        justify-content: center ;    /*가운데 정렬*/
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
    /*성적표*/
    section .mainform #mainlist{
        min-width: 750px;         /*메인 구역 안 width 값*/
        display: flex;
        flex-wrap: wrap;
        list-style: none;
    }
    section .mainform #mainlist .title{
        min-width: 750px;
        min-height: 150px;
        font-size: 50px;
        font-weight: bold;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist #month_graph{
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        margin-left: 100px;
        margin-right: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .month_info{
        background-color: rgb(173,175,255);
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
    }
    section .mainform #mainlist #sub_graph{
        min-width: 250px;
        height: 270px;
        margin: 50px 80px 70px 100px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #mainlist .sub_info{
        background-color: rgb(173,175,255);
        min-width: 250px;
        height: 270px;
        margin-top: 50px;
        margin-bottom: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
    }
    #th{
        font-size: 30px; font-weight: bold;
    }
    #td{
        font-size: 20px;
        font-weight: bold;
        height: 60px;
        text-align: center;
    }
    /*버튼*/
    section .mainform #buttonform{
        min-width: 750px;
        height: 150px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .mainform #buttonform .button{
        width: 200px;
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart_sub);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ["월", "성적", { role: "style" } ],
            ["${month_3.month}월", <fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_3.kor + month_3.math + month_3.eng) / 3}"/>, "rgb(173,175,255)"],
            ["${month_2.month}월", <fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_2.kor + month_2.math + month_2.eng) / 3}"/>, "rgb(173,175,255)"],
            ["${month_1.month}월", <fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_1.kor + month_1.math + month_1.eng) / 3}"/>, "rgb(173,175,255)"],
        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
            { calc: "stringify",
                sourceColumn: 1,
                type: "string",
                role: "annotation" },
            2]);

        var options = {
            title: "망한 성적",
            width: 250,
            height: 270,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("month_graph"));
        chart.draw(view, options);
    }
    function drawChart_sub() {
        var data = google.visualization.arrayToDataTable([
            ["과목", "성적", { role: "style" } ],
            ["국어", ${month_1.kor}, "rgb(173,175,255)"],
            ["영어", ${month_1.eng}, "rgb(173,175,255)"],
            ["수학", ${month_1.math}, "rgb(173,175,255)"],
        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
            { calc: "stringify",
                sourceColumn: 1,
                type: "string",
                role: "annotation" },
            2]);

        var options = {
            title: "망한 성적",
            width: 250,
            height: 270,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("sub_graph"));
        chart.draw(view, options);
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
            성적 관리
        </div>
        <div id="month_graph">

        </div>
        <div class="month_info">
            <table>
                <tr id="th">
                    <th colspan="2">월간 평균 성적</th>
                </tr>
                    <tr id="td">
                        <td>${month_3.month}월</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_3.kor + month_3.math + month_3.eng) / 3}"/>점</td>
                    </tr>
                    <tr id="td">
                        <td>${month_2.month}월</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_2.kor + month_2.math + month_2.eng) / 3}"/>점</td>
                    </tr>
                    <tr id="td">
                        <td>${month_1.month}월</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="0"  value="${(month_1.kor + month_1.math + month_1.eng) / 3}"/>점</td>
                    </tr>
            </table>
        </div>
        <div id="sub_graph">
            그래프
        </div>
        <div class="sub_info">
            <table style="min-width: 200px">
                <tr id="th">
                    <th colspan="2">과목별 평균</th>
                </tr>
                <tr id="td">
                    <td>국어</td>
                    <td>${month_1.kor}점</td>
                </tr>
                <tr id="td">
                    <td>영어</td>
                    <td>${month_1.eng}점</td>
                </tr>
                <tr id="td">
                    <td>수학</td>
                    <td>${month_1.math}점</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="buttonform">
        <button class="button">성적 올리러!!<br><br>학습하기</button>
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