<%@ page import="com.soso.login.Dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
    <title>navi</title>
</head>
<style>
    .navi{
        list-style-type: none;
        height: 100px;
        padding: 0;
        margin: 0;
    }
    .navi li{
        float: left;
        position: relative;
        padding: 0;
        line-height: 50px;
        min-width: 180px;
        text-align: center;
    }
    .navi li a{
        color: white;
        font-weight: bold;
        padding: 5px 25px;
        text-decoration: none;
    }
    .navi li ul{
        list-style: none;
        position: initial;
        left: 0;
        width: auto;
        background-color: gray;
        padding: 0;
        margin: 0;
        opacity: 0;
        cursor:pointer;
        position : initial;
    }
    .navi li:hover ul{
        opacity: 1;
    }
    .navi li ul li{
        float: none;
        position: static;
        height: 0;
        line-height: 0;
        background-color: gray;
    }
    .navi li:hover ul li{
        height: 30px;
        line-height: 30px;
        padding: 5px 0;
    }
    .navi li{
        transition: all 0.2s;
    }
    .navi li a{
        transition: all 0.2s;
    }
    .navi li ul li{
        transition: height 0.5s;
    }
    
</style>
<script type="text/javascript">
    function group_board(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../group_controller.do?command=group_map&user_no=${userdto.user_no}'
        }
    }
    function  group_chat(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../group_controller.do?command=group_chat&user_no=${userdto.user_no}'
        }
    }
    function mypage_checkscore(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../mypage_controller.do?command=mypage_checkscore&user_id=${userdto.user_id}'
        }
    }
    function mypage_changestar(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../mypage_controller.do?command=mypage_changestar'
        }
    }
    function mypage_userinfo(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../mypage_controller.do?command=mypage_userinfo'
        }
    }
    function mypage_qna(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../mypage_controller.do?command=mypage_qna'
        }
    }
    function group_main(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../group_controller.do?command=group_main&user_no=${userdto.user_no}&region=${userdto.region}'
        }
    }
    function ref_grade1(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../reference_controller.do?command=grade1'
        }
    }
    function ref_grade2(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../reference_controller.do?command=grade2'
        }
    }
    function ref_grade3(){
        if(${userdto.user_id eq null}){
            alert("잘못된 접근");
            location.href='../login/login.jsp'
        }else{
            location.href='../reference_controller.do?command=grade3'
        }
    }
    
</script>
<body>
<div>
    <ul class="navi">
        <li>
            <a>학습하기</a>
            <ul>
                <li><a>국어</a></li>
                <li><a>영어</a></li>
                <li><a>수학</a></li>
            </ul>
        </li>
        <li>
            <a>자료실</a>
            <ul>
                <li><a onclick="ref_grade1();">1학년</a></li>
                <li><a onclick="ref_grade2();">2학년</a></li>
                <li><a onclick="ref_grade3();">3학년</a></li>
            </ul>
        </li>
        <li>
            <a onclick="group_main();">소모임</a>
            <ul>
                <li><a onclick="group_board();">지역별모임</a></li>
                <li><a onclick="group_chat()">채팅하기</a></li>
            </ul>
        </li>
        <li>
            <a>마이페이지</a>
            <ul>
                <li><a onclick="mypage_checkscore();">나의 학습 현황</a></li>
                <li><a onclick="mypage_changestar();">상품 교환</a></li>
                <li><a onclick="mypage_userinfo();">회원 정보 수정</a></li>
                <li><a onclick="mypage_qna();">고객 문의</a></li>
            </ul>
        </li>
        <li><a>결제하기</a></li>
    </ul>
</div>
</body>
</html>