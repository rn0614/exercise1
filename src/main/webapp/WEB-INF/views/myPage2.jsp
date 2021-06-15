<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
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


<script type="text/javascript">
	function passwordCheckfunction() {
		var userPassword1 = $('#pwd').val();
		var userPassword2 = $('#pwd2').val();
		var pwdCh = 0;
		if (userPassword1 != userPassword2) {
			$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다');
		} else {
			$('#passwordCheckMessage').html('비밀번호가 일치합니다');
			pwdCh = 1;
		}
	}
	function checksubmit() {
		var data = document.mainform;
		if (pwdCh == 0) {
			alert('비밀번호가 다릅니다.');
			return false;
		}
	}
</script>
</head>
<body>
	<h3>myPage</h3>
	<form method="post" action="/memUpdate">
		<table>
			<tr>
				<td>id</td>
				<td><input type="text" name="id" value="${mem.id}" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${mem.name }"
					readonly></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="${mem.email }"
					readonly></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value="${mem.age}"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="gender" value="${mem.gender}"
					readonly></td>
			</tr>
			<tr>
				<td>키</td>
				<td><input type="text" name="height" value="${mem.height}"></td>
			</tr>
			<tr>
				<td>몸무게</td>
				<td><input type="text" name="weight" value="${mem.weight}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="완료"> <input
					type="reset" value="취소"></td>
			</tr>

		</table>
	</form>
	<br>
	<br>
	<a href="/mybatis/">메인 화면으로 이동</a>
	<br>
	<a href="<c:url value='/' />">메인 화면으로 이동</a>
	<!--  같은 표현 -->
</body>
</html>











