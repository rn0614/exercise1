<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>Insert title here</title>
</head>
<body class="is-preload">
<div id="main">
	<div class="inner">
	<header id="header">
	
		
		<a href="/" class="logo"><strong>AI Personal </strong>Trainer</a>
		<ul class="icons">
			<c:if test="${empty sessionScope.loginId }">
				<li><a href="<c:url value='/loginForm' />">로그인</a></li>
				<li><a href="<c:url value='/joinForm' />">회원가입</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.loginId }">
            			${sessionScope.loginId } 님 환영합니다! 
            	<a href="<c:url value='/logout' />">로그아웃 </a>
				<a href="<c:url value='/myPage/${sessionScope.loginId }'/>">MY Page </a>
			</c:if>
		</ul>
		
	</header>
	</div>
		</div>
</body>
</html>