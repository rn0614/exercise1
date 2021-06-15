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
<script src="<c:url value='/js/idCheck.js'/>"></script>


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
	<div id="main">
		<div class="inner">
			<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
			<div class="container">
				<form id="joinForm" name="joinForm" method="post" action="/join">
					<div class="form-group">
						<br> <label for="id">id:</label> <input type="text"
							class="form-control" id="id" placeholder="Enter username"
							name="id" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<button type="button" id="idCheck" value="ID 중복 체크">ID 중복
						체크</button>
					<input type="hidden" name="checked_id" value=0>

					<div class="form-group">
						<label for="name">이름:</label> <input type="text"
							class="form-control" id="memName" placeholder="Enter password"
							name="memName" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" onkeyup="passwordCheckfunction()"
							placeholder="Enter password" name="pwd" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="pwd">Password 확인:</label> <input type="password"
							class="form-control" id="pwd2" onkeyup="passwordCheckfunction()"
							placeholder="Enter password" name="pwd2" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div style="color: red" id="passwordCheckMessage"></div>
					<div class="form-group">
						<div class="form-group">
							<label for="gender">성별:</label> <select class="form-control"
								id="gender" name="gender">
								<option value="남">남</option>
								<option value="녀">녀</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="email">이메일:</label> <input type="text"
							class="form-control" id="email" placeholder="Enter email"
							name="email" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="age">나이:</label> <input type="text"
							class="form-control" id="age" placeholder="Enter age" name="age"
							required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="height">키:</label> <input type="text"
							class="form-control" id="height" placeholder="Enter height"
							name="height" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<label for="weight">몸무게</label> <input type="text"
							class="form-control" id="weight" placeholder="Enter weight"
							name="weight" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="form-group">
						<div class="col-4 col-12-small">
							<label for="activityIndex">평소 운동량(활동지수)</label><input type="radio"
								id="demo-priority-low" name="activityIndex" value='25'>
							<label for="demo-priority-low">Low</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-normal"
								name="activityIndex" value='33'> <label
								for="demo-priority-normal">Normal</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-high" name="activityIndex"
								value=40> <label for="demo-priority-high">High</label>
						</div>
					</div>

					<button id="submit" type="submit">Submit</button>
				</form>
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
