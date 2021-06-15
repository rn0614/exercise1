<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- subMenu.css ln.265 부터 작성 -->
		<!-- subMenu.css ln.265 부터 작성 -->
		<!-- subMenu.css ln.265 부터 작성 -->
		<!-- subMenu.css ln.265 부터 작성 -->
	</head>
	<body>
		<div class="insertFoodVOwrap">
	        <div id="insertFoodVO">
	        	<h3>음식 데이터 입력</h3>
	       		<div class="container">
					<hr>
	           		<h3>음식 정보 입력</h3><br>
					<form id="insertFoodVOForm" method="post">
							<span style="font-size:17px;">음식 분류:</span>
							<select name="foodCate" id="foodCateg" size="10">
								<option value="농산가공식품류">농산가공식품류</option>
								<option value="면류류">면류</option>
								<option value="즉석식품류">즉석식품류</option>
								<option value="식육가공품 및 포장육">식육가공품 및 포장육</option>
								<option value="수산가공식품류">수산가공식품류</option>
								<option value="알가공품류">알가공품류</option>
								<option value="주류">주류</option>
								<option value="절임류 또는 조림류">절임류 또는 조림류</option>
								<option value="과자류, 빵류 또는 떡류">과자류, 빵류 또는 떡류</option>
								<option value="빙과류">빙과류</option>
								<option value="조미식품">조미식품</option>
								<option value="기타식품류" selected>기타식품류</option>
							</select> <br><br>
							<span style="font-size:17px;">음식명:</span> <input id="foodName" type="text" size=10 placeholder="음식명 입력"> <!-- <span class="amountUnit"></span> --> <br><br>
							<span style="font-size:17px;">음식량 (ml/g):</span> <input id="foodServ" type="text" size=10 placeholder="음식량 입력 (단위: ml, g)"> <br><br>
							<span style="font-size:17px;">칼로리 (Kcal):</span> <input id="foodCalo" type="text" size=10 placeholder="칼로리 입력 (단위: Kcal)"> <br><br>
						<input id="insertFoodBtn" type="submit" value="음식 정보 입력 완료">
					</form>
				</div>
	        </div>
      	</div>
	</body>
</html>