<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>:: AI Personal Trainer :: 칼로리 사전 상세보기::</title>
</head>
<style>
	h2 {
		text-align: center;
		font-family:"삼성 고딕체","굴림",Gulim;
		font-size:46px;
		font-weight:bold;
		color:#000000;
	}
  table { width: 80%;}
  textarea { width: 80%;}
 	#outter {
		display: block;
		width: 40%;
		margin: auto;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
<br><br>
<h2><img src="/images/dictionary.png" width="40" height="40"/> 상세보기</h2>
<br>
<div id="outter">
	<table border="1">
		<tr>
			<td>식품코드: ${food.fCode }</td>
		</tr>
		<tr>
			<td>
				식품명: ${food.fName }
			</td>
		</tr>
		<tr>
			<td>분류: ${food.f_category}</td> 
		</tr>
		<tr>
			<td>1회 제공량(g): ${food.servings}</td> 
		</tr>
		<tr>
			<td>1회 칼로리량(g): ${food.kcal}</td> 
		</tr>
		<tr>
			<td>100g당 칼로리량(g): ${food.kcal_per_100}</td> 
		</tr>
	</table>
	<input type="button" value="칼로리사전" style="float: right;" onclick="location.href='foodList';"> 
</div>
</body>
</html>
