<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/8f2ec3fbbc.js"
	crossorigin="anonymous">
	
</script>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

<script src="<c:url value='/js/simpleCalendarEx.js'/>"></script>
<link href="<c:url value='/css/simpleCalendar.css'/>" rel='stylesheet' />

<%-- <script src="<c:url value='js/subMenu.js'/>"></script> --%>
<script src="<c:url value='/js/subMenuEx.js'/>"></script>
<link href="<c:url value='/css/subMenu.css'/>" rel="stylesheet">
<link rel="stylesheet" href="/css/main.css" />
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>:: AI Personal Trainer :: 운동달력 ::</title>
<style>
</style>
</head>

<body onload="build();">

	<div class="main">
		<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
		<div id="greetings"></div>
		<table style="margin-left: auto; margin-right: auto;" id="calendar">
			<tr>
				<td colspan="2"><font size=1%; color="#B3B6B3"> <label
						onclick="beforem()" id="before"></label>
				</font></td>
				<td colspan="3" align="center" id="yearmonth"></td>
				<td colspan="2"><font size=1%; color="#B3B6B3"> <label
						onclick="nextm()" id="next"></label>
				</font></td>
			</tr>
			<tr id="dayLabels">
				<td align="center"><font color="#FF9090">Sun.</font></td>
				<td align="center">Mon.</td>
				<td align="center">Tue.</td>
				<td align="center">Wed.</td>
				<td align="center">Thu.</td>
				<td align="center">Fri.</td>
				<td align="center"><font color=#7ED5E4>Sat.</font></td>
			</tr>

		</table>
		<!-- <button type="button" class="mobile-menu"><i class="fas fa-bars"></i></button> -->

		<div class="menuwrap">
			<nav id="menu">
				<!-- "메뉴목록 표시" -->
				<h3 align="center" id="monthday" style="font-size: 25px;"></h3>
				<div id="byExerciseTable"></div><br>
				<p><b>운동 입력란</b></p>
				<form method="post" action="/exer/insert">
				<input type="hidden" name="id" value="${loginId }"
								readonly>
				<input type="hidden" id="year" name="year" required>
				<input type="hidden" id="month" name="month" required>
				<input type="hidden" id="exdate" name="exdate" required>	
					<table>
						<tr>
							<th>운동명</th>
							<td><input type="text" name="exName" required></td>
						</tr>
						<tr>
							<th>운동무게</th>
							<td><input type="text" name="exWeight" value='0'></td>
						</tr>
						<tr>
							<th>횟수</th>
							<td><input type="text" name="exCount" value='0'></td>
						</tr>
						<tr>
							<th>운동거리</th>
							<td><input type="text" name="exMeter" value='0'></td>
						</tr>
						<tr>
							<th>운동시간</th>
							<td><input type="text" name="exTime" value='0'></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="등록"> <input
								type="reset" value="취소"></td>
						</tr>
					</table>
				</form>
			</nav>
		</div>


		<div class="textSearchMenuwrap">
			<nav id="textSearchMenu">
				<h3>운동 기록표</h3>


				<div class="content">
					<p align="center" id="clickDay1"
						style="font-size: 20px; margin: 5px;"></p>
					<table class="selectedTable" border="1" width="350">
						<tr>
							<td style="">운동명</td>
							<td>부위</td>
							<td>시간</td>
							<td>횟수</td>
						</tr>
					</table>
				</div>
			</nav>
		</div>

	</div>


	<div class="OCRSearchMenuwrap">
		<nav id="OCRSearchMenu">
			<h3>운동 검색</h3>
			<div class="container">



				<div class="content">

					<p align="center" id="clickDay2"
						style="font-size: 15px; margin: 5px;"></p>
					<p align="center" id="clickTime2"
						style="font-size: 15px; margin: 5px;">궁금한 운동정보를 검색하세요</p>



					<input type='text' name='word' value='' placeholder="운동이름을 검색하세요">
					<button type='submit'>검색</button>
					<button type='button'
						onclick="window.open('./create_form.jsp', '', 'width=700, height=630'); return false;">등록</button>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <a
						href="/">index 페이지로 이동</a>

				</div>

			</div>
		</nav>
	</div>


</body>

</html>
