<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
		min-height: 650px;
		font-family: 'GowunDodum-Regular';
	}
		
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
	section{
		min-width: 1190px;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
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
		display:flex;
		margin: auto;
		width: 500px;
		max-width: 90%;
		flex-direction: column;
	}
	
	.container form{
		display:block;
		width: 100%;
		height: 100%;
		padding: 20px;
		background-color: white;
		border-radius: 4px;
		box-shadow: 0 8px 16px reba(0,0,0,.3);
	}
	
	.container form h1{
		text-align: center;
		margin-bottom: 24px;
		color:#222
	}
	
	.container form .form-control{
		width: 100%;
		height: 40px;
		background-color: white;
		border-radius: 4px;
		border: 1px solid silver;
		margin: 10px 0 18px 0;
		padding: 0 10px;
	}
	.container form .btn{
		margin-left: 50%;
		transform: translateX(-50%);
		width: 110px;
		height: 46px;
		border: none;
		outline: none;
		background: rgb(173,175,255);
		cursor: pointer;
		font-size: 16px;
		color: white;
		border-radius: 4px;
		transition: .3s;
	}
	
	.container form .btn:hover{
		opacity: .7;
	}
	.btn-link2{
		display: flex;
		justify-content: center;
		width: 100%;
		height: 100%;
		padding: 10px;
		margin-bottom: 100px;
		background-color: white;
		border-radius: 4px;
		box-shadow: 0 8px 16px reba(0,0,0,.3);
	}
	
	.btn-link2 > .btn{
		background: lightgrey;
		cursor: pointer;
		font-size: 15px;
		color: black;
		border-radius: 4px;
		transition: .3s;
		margin:0 15px;
		padding: 10px;
		border: none;
		outline: none;
	}
  
	.btn-link2 > .btn:hover{
		background-color:rgb(14, 14, 14);
		color:white;
		opacity: 0.6;
	}
	p{
		text-align: center;
		font-size: 16px;
	}
  
	#p{
		display:flex;
		justify-content: center;
	}
	</style>
</head>
<body style="overflow-x:auto; overflow-y:scroll;">

  <header><h1><a href="main.jsp"><img src="/img/logo.png"></a></h1></header>
    <nav><%@ include file="/form/navi.jsp"%></nav>
    
    <section>
    <div class="btn-link2">
        <input type="button" class="btn" value="로그인" onclick="location.href='../login_controller.do?command=loginform'">
        <input type="button" class="btn" value="회원가입" onclick="location.href='../login_controller.do?command=regisform'">
        <input type="button" class="btn" value="아이디/비밀번호 찾기" onclick= "location.href='../login_controller.do?command=searchForm'">
    </div>
    
    <div class="container">
        <form method="post" action="../login_controller.do?command=login">
              <div class="form-group">
                <label for="">ID</label>
                <input type="text" name="userId" class="form-control" placeholder="아이디를 입력하세요." required>
            </div>
            <div class="form-group">
                <label for="">PASSWORD</label>
                <input type="password" name="userPassword" class="form-control" placeholder="●●●●●●●●●●●●" required>
            </div>
            <input type="submit" class="btn" value="로그인">
        </form>

        <div id="p">
        <p>개인정보 보호를 위해 공용 PC에서 사용 후,<BR>
        계정의 로그아웃 상태를 반드시 확인해 주세요.</p>
        </div>
    </div>
</section>
<footer><%@ include file="/form/footer.jsp"%></footer>
</body>

</html>