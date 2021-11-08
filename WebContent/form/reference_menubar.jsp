<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script type="text/javascript">
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
    <li class="li_selec" onclick="ref_grade1();">1학년</li>
    <li class="li_selec" onclick="ref_grade2();">2학년</li>
    <li class="li_selec" onclick="ref_grade3();">3학년</li>
</ul>
</body>
</html>