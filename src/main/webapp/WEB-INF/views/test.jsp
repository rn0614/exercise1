<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>		
		<script src="<c:url value='/js/idCheck.js'/>"></script>
		<script type="text/javascript">
			function passwordCheckfunction(){
				var userPassword1 = $('#pwd').val();
				var userPassword2 = $('#pwd2').val();
				if(userPassword1 != userPassword2){
					$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다');
				}else{
					$('#passwordCheckMessage').html('비밀번호가 일치합니다');
				}
			}
		</script>	
	</head>
	<body>
	<div id="wrap">
		<!--  TOP  -->
		<!--  회원 가입 폼  -->
		<section>
	        <h1 id="title">회원 가입</h1>
	        <form id="joinForm" name="joinForm" method="post"  action="/join"><!-- action="join.do" -->
	          <table>
	            <tr><th> ID</th><td><input type="text" id="Id" name="Id" > 
	            		<input type="button" id="idCheck" value="ID 중복 체크"></td></tr>
	            <tr><th> 성명</th><td><input type="text" id="memName" name="memName" ></td></tr>
	            <tr><th>비밀번호</th><td><input type="password" onkeyup="passwordCheckfunction()" id="pwd" name="pwd"></td></tr>
	            <tr><th>비밀번호 확인</th><td><input type="password" onkeyup="passwordCheckfunction()" id="pwd2" name="pwd2"></td></tr>
	            <tr><th></th><td style="color : red" id="passwordCheckMessage"></td></tr>
	            
	            <tr><th>성별</th>
	                  <td><select id="gender" name="gender">
	                               <option value="">선택하세요</option>
								   <option value="남">남</option>
								   <option value="녀">녀</option>
	                          </select></td></tr> 
	            <tr><th>이메일</th><td><input type="text" id ="email" name="email"></td></tr>
				<tr><th>나이</th><td><input type="text" id ="age" name="age"></td></tr>
				<tr><th>키(cm)</th><td><input type="text" id ="height" name="height"></td></tr>
				<tr><th>몸무게(kg)</th><td><input type="text" id ="weight" name="weight"></td></tr>
				
				
	            <tr>
	                <td colspan="2" align="center" id="button">
	                	
	                    <br><input type="submit" id="join" value="회원가입">
	                    <input type="reset" value="취소">
	                </td>
	            </tr>             
	            </table>
	            <a href="/">메인 화면으로 이동</a><br>
	      </form>	
      </section>
      <!--  BOTTOM  -->
		</div>
    </body>
</html>


