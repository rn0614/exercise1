<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<script 
			src="https://kit.fontawesome.com/8f2ec3fbbc.js" 
			crossorigin="anonymous">
		</script>

	    <link href="<c:url value='css/simpleCalendar.css'/>" rel='stylesheet' />
        <link href="<c:url value='css/ocr.css'/>" rel="stylesheet" >
        <link href="<c:url value='css/text.css'/>" rel="stylesheet" >  
        <link href="<c:url value='css/subMenu.css'/>" rel="stylesheet" >
        <link href="<c:url value='css/selectTimeBtn.css'/>" rel="stylesheet" >
        
        <script src="<c:url value='js/jquery-3.6.0.min.js'/>"></script>
        
        <script src="<c:url value='js/dietJs/selectTimeBtn.js'/>"></script>
        <script src="<c:url value='js/dietJs/ocr.js'/>"></script>
     	<script src="<c:url value='js/dietJs/text.js'/>"></script>
    	<script src="<c:url value='js/dietJs/subMenu.js'/>"></script>
        <script src="<c:url value='js/dietJs/OCRImagePreview.js'/>"></script>
		<script src="<c:url value='js/dietJs/simpleCalendar.js'/>"></script>
        <script src="<c:url value='js/dietJs/deleteDiet.js'/>"></script>
		<script src="<c:url value='js/dietJs/insertFood.js'/>"></script>
		<meta charset="EUC-KR">
		<title>:: AI Personal Trainer :: 식단달력 ::</title> 
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/css/main.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/table.css">
		
		<style>

		</style>
	</head>
 
	<body class="is-preload" onload="build();">
		<div id="wrapper">
			<div id="main">
				<div class="inner">
					<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
						<div id="greetings"></div>
					    <table align="center" id="calendar">
					        <tr>
					            <td colspan="2">
					            	<font size=100%; color="#B3B6B3">
					            		<label onclick="beforem()" id="before" ></label>
				            		</font>
				           		</td>
					            <td colspan="3" align="center" id="yearmonth"></td>
					            <td colspan="2">
					            	<font size=100%; color="#B3B6B3">
					            		<label onclick="nextm()" id="next"></label>
				            		</font>
				           		</td>
					        </tr>
					        <tr id="dayLabels">
					            <td align="center"> <font color="#FF9090">Sun.</font></td>
					            <td align="center"> Mon. </td>
					            <td align="center"> Tue. </td>
					            <td align="center"> Wed. </td>
					            <td align="center"> Thu. </td>
					            <td align="center"> Fri. </td>
					            <td align="center"><font color=#7ED5E4>Sat.</font></td>
					        </tr>
				
					    </table>
					    
					    <jsp:include page="/WEB-INF/views/diet/menuwrap.jsp" flush="true" />
					    <jsp:include page="/WEB-INF/views/diet/textSearchMenuwrap.jsp" flush="true" />
					    <jsp:include page="/WEB-INF/views/diet/OCRSearchMenuwrap.jsp" flush="true" />
					    <jsp:include page="/WEB-INF/views/diet/insertFoodVOwrap.jsp" flush="true" />
			    </div>
		    </div>
	    </div>
    		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
    
	</body>
	 
</html>
