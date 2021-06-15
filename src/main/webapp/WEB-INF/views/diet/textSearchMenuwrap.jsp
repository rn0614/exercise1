<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<div class="textSearchMenuwrap">
	        <div id="textSearchMenu">
	        	<h3>식단 입력: 텍스트로 검색</h3>
	       		<div class="container">
				
					<ul class="tabs">
						<li class="breakfastBtn" value="아침">아침</li>
						<li class="lunchBtn" value="점심">점심</li>
						<li class="dinnerBtn" value="저녁">저녁</li>
						<li class="nightBtn" value="야식">야식</li>
						<li class="snackBtn" value="간식">간식</li>
					</ul>
					
					<div class="content">
						<p align="center" id="clickDay1" style="font-size:15px; margin: 5px;"></p>
						<p align="center" id="clickTime1" style="font-size:15px; margin: 5px;">시간을 클릭하세요 :)</p>
	<!-- 										<p align="center" style="font-size:15px; margin: 5px;">
												현재 식단
											</p> -->
						
					<div class="byTimeDietTable"></div>	
						<!-- Ajax(selectTimeBtn.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분 -->
						<!-- 검색  -->
							<h3>음식명으로 검색</h3>
							<form id="textForm" method="post">
								<div id="SearchBox">
								    <input id="keyword" placeholder="상품명 입력" >
								    <i id="glass" type="submit" class="fas fa-search"></i>
						    	</div>
							</form>
							<div id='TextSeachTable' style="width:100%; height:250px; overflow:auto;">
							</div>
							<hr>
							<h3>식단 입력</h3>
							<div id="hiddenFCode" style="display:none;"></div>
							<form id="checkForm" method="post">
								    <span>음식명: </span> &nbsp;&nbsp;
								    	<input type=text id="tFoodName" readonly> <br>
							    	<span>섭취량 (g, ml): </span> &nbsp;&nbsp;
								    	<input type=text id="tFoodAmt" placeholder="섭취량 입력" > <br><br>
							    	<input id="insertCalVOBtn" type="submit" value="식단표에 입력하기"><br><br>
							</form>
					
			            
					</div>
	
				</div>
	        </div>
      	</div>
	</body>
</html>