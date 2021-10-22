<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type = "text/css">
	 section .loginboard_form #loginboard{
        background-color: lightgrey;
        width: 230px;
        height: 190px;
        display: inline-flex;
        margin-top: 30px;
        border-radius: 5%;
       
    }
    section .loginboard_form #loginboard #imgform{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 80px;
        height: 190px;
    }
    section .loginboard_form #loginboard #imgform #image img{
        width: 65px;
        height: 65px;
        border-radius: 33px;
        margin-left: 15px;
    }
    section .loginboard_form #loginboard #imgform #setting img{
        border-radius: 10px;
        margin-top: 20px;
    }
    section .loginboard_form #loginboard #right #textform{
        min-width: 150px;
        height: 120px;
        text-align: center;
        line-height: 30px;
        font-size: 15px;
        font-weight: bold;
    }
    section .loginboard_form #loginboard #right #textform #name{
        line-height: 40px;
        margin-top: 10px;
    }
    section .loginboard_form #loginboard #right #textform #location{
        line-height: 20px;
        margin-bottom: 15px;
    }
    section .loginboard_form #loginboard #right #textform #star{
        line-height: 15px;
    }
    section .loginboard_form #loginboard #right #logoutbuttonform{
        min-width: 150px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    section .loginboard_form #loginboard #right #logoutbuttonform button{
        background-color: gray;
        font-weight: bold;
        color: white;
        width: 100px;
        height: 30px;
        border-radius: 5%;
        border: 0;
        outline: 0;
    }
</style>
<body>
	    <div id="loginboard">
        <div id="imgform">
            <div id="image" style="width: 80px; height:65px">
                <img src="../img/img01.png">
            </div>
            <div id="setting" style="width: 20px; height:40px">
                <img src="../img/setting.jpg">
            </div>
        </div>
        <div id="right">
            <div id="textform">
                <div id="name">
                    김이름님 환영합니다
                </div>
                <div id="location">
                    나의 소속 소모임<br>
                    소속 도서관
                </div>
                <div id="star">
                    ★ 별 개수
                </div>
            </div>
            <div id="logoutbuttonform">
                <button>로그아웃</button>
            </div>
        </div>
    </div>
</body>
</html>