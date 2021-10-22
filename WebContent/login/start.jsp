<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	body{
	    margin: 0;
	    padding: 0;
	    min-width: 1400px;   /*브라우저 축소해도 요소가 깨지는것을 방지*/
	    min-height: 650px;
	    font-family: 'GowunDodum-Regular';
	}
	
	header{
	    background-color: aliceblue;
	    min-width: 100%;
	    height: 80px;
	    display: flex;
	    align-items: center;        /*가운데 정렬*/
	    justify-content: center;    /*가운데 정렬*/
	    -ms-user-select: none;      /*드래그 금지*/
	    -moz-user-select: none;
	    -khtml-user-select: none;
	    -webkit-user-select: none;
	    user-select: none;
	}
	
	header h1 a{
	           color: black;
	           text-decoration: none;
	}
	       
	

		
	section{
	    min-width: 100%;
	}
		
  footer{
        background-color:rgb(233,233,236);
        min-width: 100%;
        min-height: 150px;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: center;
        -ms-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        user-select: none;
    }
	
	.container{
	       min-height: 80vh;
	       width: 100%;
	       display: flex;
	       align-items: center;
	       justify-content: flex-start;
	}
	
	#first{
	       background-image: url(./img/student.jpg);
	       background-size: 1000px 600px;
	       background-position: right bottom;
	       background-repeat: no-repeat;
	       position: relative;
	}
	
	#first p{
	   display: block;
	   width: fit-content;
	   position: relative;
	   color: black;
	}
	
	#first .cta{
	    display: inline-block;
	    padding: 10px 15px;
	    color: rgb(173,175,255);;
	    border-radius: 10px;
	    background-color: transparent;
	    border: 2px solid rgb(173,175,255);;
	    font-size: 16px;
	    font-weight: bold;
	    letter-spacing: .1rem;
	    margin-top:6px;
	    transition: .3s ease; 
	    transition-property: background-color, color;
	    text-decoration: none;
	}
	
	#first .cta:hover{
	    color:white;
	    background-color: rgb(173,175,255);;
	}
	
	.tt {
	    position: relative;
	    margin: 10px 165px;
	    
	}
	
	#t1{
	    font-size: 26px;
	    font-weight: bold;
	}
	
	#t1 span{
	    margin:5px 0;
	    font-size: 15px;
	    font-weight: bold;
	}
    

	
</style>
<body style="overflow-x:auto; overflow-y:scroll;">
    <header>
     <img src="img/logo.png">
    </header>
    <section id="first">
        <div class="container">
            <div class="tt">
                <p id="t1">
                여러분은,<br>
                무엇이든<br>
                배울 수 있습니다.<br>
                <span>국어,영어,수학과목을 쉽고 재미있게</span>
                </p>
                <a href="login.jsp" type="button" class="cta" onclick="login();">학습하기</a>
           
            </div>
        </div>
    </section>
    
    <footer><%@ include file="/form/footer.jsp"%></footer>
</body>

<script type="text/javascript">
	function login(){
		location.href="login.jsp";
	}
</script>
</html>