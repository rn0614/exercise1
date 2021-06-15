<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>칼로리 사전</title>
</head>

<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
</style>
<body>

<h2>칼로리 사전</h2>
<div id="outter">
	<table border="1">
		<tr>
			<td>식품코드</td>
			<td width="50%">식품명</td>
			<td>분류</td>
			<td>1회 제공량</td>
			<td>1회 칼로리량</td>
			<td>100g당 칼로리량</td>
					
		</tr>
		<c:forEach items="${list}" var="food">
			<tr>
				<td><a href="foodDetail?fCode=${food.fCode }">${food.fCode }</a></td>
				<td>${food.fName }</td>
				<td>${food.f_category }</td>
				<td>${food.servings }</td>
				<td>${food.kcal }</td>
				<td>${food.kcal_per_100 }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
