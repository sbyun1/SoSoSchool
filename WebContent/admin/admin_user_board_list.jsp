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
        
        .user_table{
	
		
		border-collapse: collapse;
		border-top: 1px solid #444444;
		border:1px;
	}
    td{
   
    border-bottom: 1px solid #FAF0F4;
 
    }
    th{
    background-color:rgb(173,175,255);
   
    padding: 10px;
    }
    
    tr:nth-child(2n){
    background-color:#FBF4F5;
    }
	input{
     font-family: 'GowunDodum-Regular';
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
        <h1 style="width: 190px; height: 35px; position: absolute">유저 리스트</h1>
    </div>
    <div id="board_form">
        <div id="board_list">
            <table class = "user_table" border="1">
                <tr>
                    <th>유저 번호</th>
                    <th>부모님 이름</th>
                    <th>유저 이름</th>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>학년</th>
                    <th>주소</th>
                    <th>상세 주소1</th>
                    <th>상세 주소2</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>랭킹용 포인트</th>
                    <th>교환용 포인트</th>
                    <th>구독여부</th>
                    <th>지역</th>
                    <th>회원 유형</th>
                    <th>가입 여부</th>
                </tr>
                    <c:choose>
                        <c:when test="${empty list}">
                            <td style="width: 1190px">게시글이 없습니다..</td>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="list" items="${list}">
                                <tr style="cursor: pointer" onclick="location.href='../admin_controller.do?command=user_detail&user_no=${list.user_no}'">
                                    <td>${list.user_no}</td>
                                    <td>${list.user_pr}</td>
                                    <td>${list.user_name}</td>
                                    <td>${list.user_id}</td>
                                    <td>${list.user_pw}</td>
                                    <td>${list.grade}</td>
                                    <td>${list.postcode}</td>
                                    <td>${list.roadAddr}</td>
                                    <td>${list.detailAddr}</td>
                                    <td>${list.phone}</td>
                                    <td>${list.email}</td>
                                    <td>${list.user_point}</td>
                                    <td>${list.user_star}</td>
                                    <td>${list.sub_yn}</td>
                                    <td>${list.region}</td>
                                    <td>${list.user_type}</td>
                                    <td>${list.enabled_yn}</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
            </table>
        </div>

    </div>
</section>
</body>
</html>