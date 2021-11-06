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
            font-family: 'GowunDodum-Regular';
        }
        #menu{
            list-style: none;
            margin: 0px 0px auto auto;
            padding-left: 0px;
            font-size: 35px;
            font-weight: bold;
        }
        #menu li{
            text-align: center;
            margin: 50px auto 50px auto;
            cursor: pointer;
        }
        #menu .li_selec{
            font-size: 20px;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
<ul id="menu">
    <li style="margin-bottom:60px; font-size:30px; cursor: default">자료실</li>
    <li class="li_selec">1학년</li>
    <li class="li_selec">2학년</li>
    <li class="li_selec">3학년</li>
</ul>
</body>
</html>