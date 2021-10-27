<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.soso.login.Dto.UserDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
			UserDto dto = (UserDto)session.getAttribute("dto");
			UserDto ps = (UserDto)request.getAttribute("ps");
%>

<style type="text/css">

@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
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
		
		body{
		    margin: 0;
		    padding: 0;
		    min-width: 1400px;  /*브라우저 축소해도 요소가 깨지는것을 방지*/
		    min-height: 650px;
		    font-family: 'GowunDodum-Regular';
		}
		
		section{
		    min-width: 100%;
		    display: flex;
		    justify-content: center;
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

		li{
		    list-style: none;
		}

        
		#left { 
		 color: #333;
		 border: 1px solid #ccc;
		 background:white;
		 margin: 0px 5px 5px 0px;
		 padding: 10px;
		 height: auto;
		 width: 80%;
		 float: left;
		}
		
	/* 	#right { 
		 float: right;
		 color: #333;
		 border: 1px solid #ccc;
		 background:white;
		 margin: 0px 0px 5px 0px;
		 padding: 10px;
		 height: auto;
		 width: 15%;
		 display: inline;
		} */

		/* #right  */
	#m-right{
			width:20%;
		}	 
			
		
		
		#login{
			font-size:15px;
			display: flex;
			justify-content: center;
		}
			

		/* #right  */
		
		#login .btn{
            margin: 15px 15px 5px 50%;
            transform: translateX(-50%);
            width: 120px;
            height:34px;
            border: none;
            outline: none;
            background: rgb(173,175,255);
            cursor: pointer;
            font-size: 16px;
            color: white;
            border-radius: 4px;
            transition: .3s;
            
        }
        
        #/* right  */
        #login .btn:hover{
            opacity: .7;
        }
        
		/* #right >  */
		
		#rank{
		display:flex;
		flex-wrap: wrap;
		align-content: center;
		justify-content: center;
		font-size:16px;
		text-align: center;
		}
		
		/* #right >  */
		#rank h3{
		margin:10px 0;
		padding:10px 0;
		font-size:15px;
		text-align: center;
		}
		
		#myrank{
			border: 2px solid black;
		}

</style>
<script type="text/javascript">
</script>

<body style="overflow-x:auto; overflow-y:scroll;">

    <header><h1><a href="4.jsp"><img src="img/logo.png"></a></h1></header>
    <nav><%@ include file="/form/navi.jsp"%></nav>
    
  <section>
  <div id="left">
    <!-- 동영상 -->
    <div id="video">
      <h3>가장 많이 조회된 동영상</h3>
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
      <iframe width="220" height="200" src="https://www.youtube.com/embed/k_g7sBJ3fBg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  
    </div>
    
    <!-- 소모임 -->
    <div>
      <h3>내 주변 소모임</h3>
      <div id="group"></div>
    </div>
    
    <!-- 공지사항 -->
    <div>
      <h3>공지사항</h3>
      <div id="notic">
        <table border="1">
          <th width="900px">제목</th>
          <th width="200px">날짜</th>
          <tr>
            <td><a href="">공지사항</a></td>
            <td>2021-10-10</td>
          </tr>
        </table>
      </div>
    </div>
  </div>

  <div id="m-right">
  
    <!-- 회원 정보 -->
   <!--  <div id="login">
      <form action="">
        <ul>
          <li>님 환영합니다.</li>
          <li><a href="">나의 소속 소모임</a></li>
          <li>시 별무리 도서관</li>
          <li>스티커 개수 2</li>
          <input type ="button" class="btn" value="로그아웃" onclick="location.href='1.jsp'">
        </ul>
      </form>
    </div> -->
    
    <div id="login"><%@ include file="/form/logout.jsp"%></div>

    <!-- 회원 랭킹 -->
    <div id="rank">
      <h3>우리 학년에서 나는 몇위 ?</h3>
      <table id="rank-table" border="1">
          <col width="100px"><col width="100px"><col width="100px">
          <tr>
          <th>순위</th>
          <th>이름</th>
          <th>포인트</th>
          </tr>
         
          <c:choose>
          	<c:when test="${empty list}">
          		<tr>
					<td colspan="4">===== 로그인 후에 확인 할 수 있습니다. =====</td>
				</tr>
          	</c:when>
          	<c:otherwise>
          		<c:forEach items="${list}" var="rank" varStatus="i" end="4" >
          			<%-- <c:forEach var="i" begin="1" end="10" step="1"> --%>
		          		<tr>
		          			<td>${i.count }</td>
		          			<td>${rank.user_name }</td>
		          			<td>${rank.user_point }</td>
		       			</tr>
	       			<%-- </c:forEach> --%>
          		</c:forEach>
          	</c:otherwise>
          </c:choose>
       
          	<tr id="myrank">
          		<td>${no }</td>
          		<td>${name }</td>
          		<td>${point }</td>
          	</tr> 

      </table>
    </div>
  </div>
</section>


<footer><%@ include file="/form/footer.jsp"%></footer>
</body>
</html>