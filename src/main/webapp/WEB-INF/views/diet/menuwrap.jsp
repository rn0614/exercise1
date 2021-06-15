<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MenuWrap</title>
	</head>
	<body>
	    <div class="menuwrap">
	        <div id="menu">
	            <!-- "메뉴목록 표시" -->
	            <%-- <h3 id="memberId">${sessionScope.loginId}</h3> --%>
	            <h3 align="center" id="monthday" 
	            	style="font-size:25px; margin-bottom:20px !important;">
            	</h3>
	            <h4 id="deleteParaphr" style="display:none;"> 삭제하려는 식단을 클릭해주세요 :)</h4>
				<div id="byDateDietTable">
					<!-- Ajax(subMenu.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분 -->
				</div>	
				<div id="calCodeDiv" style="display:none" >
					<!-- Ajax(subMenu.js) 로 Controller => DB 로 데이터 받아서 작성되는 부분
						 숨겨놓았다가 삭제할 때 calCode 얻는 용도                            --> 
				</div>
	            
	            
	            <div id="dietSearch">
		            <input type="button" id="textSearch" value="식단 입력: 텍스트로 검색">
		            <input type="button" id="OCRSearch" value="식단 입력: 성분표로 검색">
		            <input type="button" id="deleteDiet" value="식단 삭제">
    		        <input type="button" id="insertFoodBtn" value="음식 데이터 입력">
    		        <input type="button" id="deleteChecker" value="네! 삭제할게요!!"
    		        	style="display:none">
		            <!-- <input type="button" id="dietDelete" href="#" value="식단 삭제 (미구현)"> -->
	            </div>
	
	        </div>
	    </div>
	</body>
</html>