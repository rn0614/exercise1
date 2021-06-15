<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>:: AI Personal Trainer :: 칼로리 사전 ::</title>
</head>
<style>
	h2 {
		text-align: center;
		font-family:"삼성 고딕체","굴림",Gulim;
		font-size:46px;
		font-weight:bold;
		color:#000000;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 85%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
	
</style>


<script>
//아래쪽에서 이 함수를 호출해서 페이지값을 컨트롤러에 맵핑시킨다
function list(page){
    console.log("페이지를 이동합니다.");
    location.href="foodList?curPage="+page;
}
</script>

<body>
<body class="is-preload">
<div id="main">
	<div class="inner">
	<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
	<center>
			<br><br>
			<h2><img src="/images/dictionary.png" width="40" height="40"/> 칼로리 사전</h2>
	
	</div>
</div>

<div id="outter">
	
	<!-- 검색  -->
	<div style="float: left;">
		<form name="form1" method="post" action="foodList">

		    <select name="search_option">
		    <option value="all" 
		<c:if test="${map.search_option == 'all'}">selected</c:if>
		        >전체</option>
		        
		        <option value="fCode"
		<c:if test="${map.search_option == 'fCode'}">selected</c:if>
		   >식품코드</option>
		
		        <option value="fName" 
		<c:if test="${map.search_option == 'fName'}">selected</c:if>
		        >식품명</option>
		
		        <option value="f_category" 
		<c:if test="${map.search_option == 'f_category'}">selected</c:if>
		        >분류</option>
		
		        
		
		    </select>
		    <input name="keyword" value="${map.keyword}">
		    <input type="submit" value="검색">
		</form>

	</div>
	
	
	
	<%-- <!-- 페이지 갯수 출력 -->
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 --> --%>
	
	<table border="1">
		<tr>
			<td>식품코드</td>
			<td width="50%">식품명</td>
			<td>분류</td>
			<!-- <td>1회 제공량</td>
			<td>1회 칼로리량</td>
			<td>100g당 칼로리량</td> -->
					
		</tr>
		<c:forEach items="${map.list}" var="food">
			<tr>
				<td><a href="foodDetail?fCode=${food.fCode }">${food.fCode }</a></td>
				<td>${food.fName }</td>
				<td>${food.f_category }</td>
				<%-- <td>${food.servings }</td>
				<td>${food.kcal }</td>
				<td>${food.kcal_per_100 }</td> --%>
			</tr>
		</c:forEach>
	
	<br><br>
	
	

	
	<!-- 페이지 네비게이션 (페이지 알고리즘 관련) 출력 -->
 	<tr>
        <td colspan = "7" align = "center">
            <c:if test="${map.pager.curBlock > 1}">
  	<a href="#" onclick="list('1')">[처음]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 (뒤쪽에 있기때문에) 처음으로 갈 수 있도록 링크를 추가 -->
        
            <c:if test="${map.pager.curBlock > 1}">
                <a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
            </c:if> <!-- 현재 블록이 1블록보다 크면 이전 블록으로 이동할 수 있도록 링크 추가 -->
            
            <c:forEach var="num"
                begin="${map.pager.blockBegin}"
                end="${map.pager.blockEnd}">
                <c:choose>
                    <c:when test="${num == map.pager.curPage}">
                    
                    <!-- 현재 페이지인 경우 하이퍼링크 제거 -->
                    <!-- 현재 페이지인 경우에는 링크를 빼고 빨간색으로 처리를 한다. -->
                        <span style="color:red;">${num}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="list('${num}')" >${num}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            
            <c:if test="${map.pager.curBlock <= map.pager.totBlock}">
                <a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작으면 다음으로 갈 수있도록 링크를 추가 -->
            
            
            <c:if test="${map.pager.curPage <= map.pager.totPage}">
                <a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
            </c:if> <!-- 현재 페이지블록이 총 페이지블록보다 작거나 같으면 끝으로 갈 수 있도록 링크를 추가함-->
            </td>
    </tr>
    
    </center>
</table>

	
	
</div>
</body>
</html>