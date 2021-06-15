<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="is-preload">
	<div id="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
			<div class="container">

				<!--  TOP 메뉴 넣을 곳  -->
				<h2>로그인</h2>
				<form method="post" id="loginForm" action="<c:url value="/login"/>">
					<div class="form-group">
						<label for="id">id</label> <input type="text" class="form-control"
							id="id" placeholder="Enter id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" placeholder="Enter password"
							name="pwd">
					</div>
					<c:if test="${not empty ERRORMSG}">
						<font color="blue"> login failed<br>
						</font>
					</c:if>
					<button type="submit">Submit</button>
				</form>
				<!--  BOTTOM 메뉴? 넣을지 안넣을지는 미정  -->
			</div>
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
		</div>
	</div>
</body>
</html>
