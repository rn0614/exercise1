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
		<header>
       		<div id="headerBox">
            	<div id="logoBox"><a href="<c:url value='/'/>">
            	<img src="<c:url value='image/logo2.png'/>" id="logoImg"></a></div>
            	<div id="topMenuBox">
            		<c:if test="${empty sessionScope.sid }" >	            	
            			<a href="<c:url value='/loginForm' />">로그인</a>  
            			<a href="<c:url value='/joinForm' />">회원가입</a> 
            			<a href="<c:url value='/test' />">test 삭제예정</a>
            			<a href="<c:url value='exer/exerciseListView' />">운동 기록</a>
            		</c:if> 
            		<c:if test="${not empty sessionScope.sid }" >
            			${sessionScope.sid } 님 환영합니다! 
            			<a href="<c:url value='/logout' />">로그아웃 </a>
            			<a href="<c:url value='/member/myPage' />">MY Page </a>
            		</c:if>
            	</div>
           	</div>
    	</header>
    	
    	
    	<h1>AI 퍼스널 트레이너</h1>
    	
    	<div id="mainMenuBox">
        	<ul id="menuItem"> 
        		<li><a href="#">홈 이미지</a></li>   
        		<li><a href="#">달력</a></li>                        
        		<li><a href="#">게시판</a></li>                        	          
        		<li><a href="#">마이페이지</a></li>
        	</ul>
       	</div>
       	
       	<article  id="content2"> <!-- 베스트 상품 -->   
        	<div id="productBox">
          		<div class='product'>
          			<div><a href="<c:url value='/muscle1'/>"><img src="<c:url value='/image/prd001.jpg'/>">가슴 운동</a></div>
          			<div><a href="#"><img src="<c:url value='/image/prd002.jpg'/>">등 운동</a></div>
          		</div>
			</div>         	
		</article>
    	
	</body>
</html>