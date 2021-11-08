<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
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
			margin:0;
			padding:0;
			font-family:'GowunDodum-Regular';	
            font-size:14px;
	}
/* 	input {
			width:300px;
            height:37px;
            margin: 5px;
            border : 1px solid #80808082;
	} */
	
	table,tr,td {
            border: none;
            margin:0;
			padding:0;
			border-spacing:5px;
	}
	
	table tr td input {
			font-size:14px;
            border: none;
            outline: none;
	}
	
	tr > td {
			border-spacing:25px;
			width:300px;
            height:37px;
            margin: 5px;
            border : 1px solid #80808082;
	}
	
	#btnChk{
			display: inline;
        	position: absolute;
            background: rgb(173,175,255);
            cursor: pointer;
            font-size: 10px;
            color: white;
            border-radius: 2px;
            width: 300px;
            height: 39px;
            padding: 9px;
            margin: 5px;
            border: none;
            outline: none;
	}
	
	#alertText{
		text-align:center;
		font-weight: bold;
	}
	#hidden{
		display:none;
	}
</style>
<script type="text/javascript">
	window.onload=function(){
		var id = opener.document.getElementsByName("parent_id")[0].value;
		document.getElementsByName("id")[0].value = id;
	}
	
	function confirm(bool){
		if(bool == "true"){
			opener.document.getElementsByName("student_name")[0].focus();
			opener.document.getElementsByName("parent_id")[0].title="y";
			opener.document.getElementsByName("parent_id")[0].readOnly=true;
			opener.document.getElementsByName("parent_id")[0].style.backgroundColor="rgb(233,233,236)"; 
		}else{
			opener.document.getElementsByName("parent_id")[0].focus();
			opener.document.getElementsByName("parent_id")[0].title="n";
			opener.document.getElementsByName("parent_id")[0].readOnly=false;
		}
		self.close();
	}
	
</script>
</head>
<%
	String idnotused = request.getParameter("idnotused");
%>
<body>
	<table cellpadding="0">
		<tr id="hidden">
			<td><input type="hidden" name="id" ></td>
		</tr>
		<tr id="alertText">
			<td><%=idnotused.equals("true")?"현재 아이디는 생성 가능합니다.":"중복된 아이디가 존재합니다." %></td>
		</tr>
	</table>
			<input type="button" id="btnChk" value="확인" onclick="confirm('<%=idnotused %>');">
</body>
</html>