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
		<div class="OCRSearchMenuwrap">
	        <div id="OCRSearchMenu">
	        	<h3>식단 입력: 성분표로 검색</h3>
	       		<div class="container">
				
					<ul class="tabs">
						<li class="breakfastBtn" value="아침">아침</li>
						<li class="lunchBtn" value="점심">점심</li>
						<li class="dinnerBtn" value="저녁">저녁</li>
						<li class="nightBtn" value="야식">야식</li>
						<li class="snackBtn" value="간식">간식</li>
					</ul>
					
					<div class="content">
					
						<p align="center" id="clickDay2" style="font-size:15px; margin: 5px;"></p>
						<p align="center" id="clickTime2" style="font-size:15px; margin: 5px;">시간을 클릭하세요 :)</p>
	<!-- 										<p align="center" style="font-size:15px; margin: 5px;">
												현재 식단
											</p> -->
						
						<div class="byTimeDietTable">
							<!-- Ajax(selectTimeBtn.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분 -->
						</div>	
						
	            		<h3>영양 성분표 불러오기</h3>
	
						<form id="ocrForm"  method="post" enctype="multipart/form-data">	         
				         	파일 :  <input type="file" id="uploadFile" name="uploadFile"> 
				         	
				         	<br><br>
				           <input id="submit" type="submit" value="불러오기">
						</form>	
						
						<hr>
						<div id="imageIndicator" style="font-size:15px; visibility:hidden;"> <!-- onmouseover='OCRImagePreview()'  --> 
								<span>이미지보기</span> 
	  						    <i class="far fa-images"></i>
						</div>
							<img id="OCRImage" src="" height=350px width=350px alt="OCRImage"/>		
						<h3>영양 성분표 분석 결과</h3><br>
				
						
						<form id="ocrResultForm" method="post">
								<span>총 내용량:</span> &nbsp;&nbsp;
									<input id="totalAmount" type="text" size=10 readonly>&nbsp; <span class="amountUnit"></span><br>
								<span>1회 제공량:</span> &nbsp;&nbsp;
									<input id="unitAmount" type="text" size=10 readonly>&nbsp; <span class="amountUnit"></span> <br>
								<span>1회 칼로리:</span> &nbsp;&nbsp;
									<input id="unitCalories" type="text" size=10 readonly>&nbsp; <span>Kcal</span> <br>
								<span>상품명:</span> &nbsp;&nbsp;
									<input id="prodName" type="text" size=18 placeholder="상품명 입력"> <br>
								<span>섭취량:</span> &nbsp;&nbsp;
									<input id="intake" type="text" size=10 placeholder="섭취량 입력">&nbsp; <span class="amountUnit"></span> <br><br>
							
								<input id="insertDietOCR" type="submit" value="식단표에 입력하기"><br><br>
						<!-- nutriFactor VO 만들어서 입력 받기 (탄단지 까지만) -->
						<!-- 나중에 해당 정보를 DB에 넣는 기능까지 넣기 -->
							<!-- 칼로리사전에 저장 버튼 -> 클릭 (alert("사전에 저장되었습니다 :)") -->
						</form><br>
						<!-- <a href="/">index 페이지로 이동</a> -->
						
					</div>
	
				</div>
	        </div>
      	</div>
	</body>
</html>