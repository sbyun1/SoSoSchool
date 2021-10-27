<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head><title>아이디 찾기</title>
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
        header h1 a{
            color: black;
            text-decoration: none;
        }
        
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
	        flex-wrap: wrap;
		}
		
	    /*푸터*/
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
		
		
		table {
			margin:135px 5px;
		}
		tr > td > input{
			width: 350px;
		}
		.btn{
			width:100px;
	        background: rgb(173,175,255);
            cursor: pointer;
            font-size: 20px;
            color: white;
            border-radius: 4px;
            margin:8px 3px;
            padding: 9px;
            transition: .3s;
            border: none;
            outline: none;
		}
		.btn:hover{
		opacity: 0.6;
		}
		
		.btn2{
			width:100px;
	        background: gray;
	        cursor: pointer;
	        font-size: 20px;
	        color: white;
	        border-radius: 4px;
	        margin:8px 3px;
	        padding: 9px;
	        transition: .3s;
	        border: none;
	        outline: none;
		}
		.btn2:hover{
			opacity: 0.6;
		}
		
		
</style>
</head>

<body>
 <header><h1><a href="main.jsp"><img src="/img/logo.png"></a></h1></header>
   <nav><%@ include file="../form/navi.jsp"%></nav>
   <section>
	
	<div id="input">
	<form method="post" action="../login_controller.do?command=searchId">
		<table>
		<col width="120px"><col width="100px">
			<tr>
			      <td align="left">학부모 이름</td>
			      <td><input type = "text" name = "name" ></td>
			</tr>
			<tr>
			      <td align="left">이메일</td>
			      <td><input type = "email" name = "email" maxlength = "50"></td>
			</tr>
			
			<tr>
			      <td align="center" colspan="2">
			            <input type="submit" class="btn" value="찾기">
			            <input type="button" class="btn2" value="로그인" onclick="location.href='../login_controller.do?command=loginform'">
			      </td>
			</tr>
			
		</table>
	</form>
	</div>
	
	</section>
	<footer><%@ include file="../form/footer.jsp"%></footer>
</body>
</html>