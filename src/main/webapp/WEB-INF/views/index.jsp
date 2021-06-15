<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>AI Personal Trainer :: Main</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%
	Calendar cal = Calendar.getInstance();
	String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
%>
		
<%!
	public String getDay(int x){
	String str = "";
	switch(x){
	case 1:str="일요일"; break;
	case 2:str="월요일"; break;
	case 3:str="화요일"; break;
	case 4:str="수요일"; break;
	case 5:str="목요일"; break;
	case 6:str="금요일"; break;
	case 7:str="토요일"; break;
	}
	return str;
}
%>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
				<!-- <section id="banner">
					<div class="content">
						<header>
							<h1>
								Exercise Management<br /> CSS Test!!!!!!
							</h1>
							<p>A free and fully responsive site template</p>
						</header>
						<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu.
							Proin aliquam facilisis ante interdum congue. Integer mollis,
							nisl amet convallis, porttitor magna ullamcorper, amet egestas
							mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id
							euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor
							sit nullam.</p>
						<ul class="actions">
							<li><a href="#" class="button big">Learn More</a></li>
						</ul>
					</div>
					<span class="image object"> <img src="images/pic10.jpg"
						alt="" />
					</span>
				</section> -->
				
		
				<!-- Section -->
				<section>
					<header class="major">
						<!-- 날짜 및 요일 -->
						<font size=4px>
							<%= cal.get(Calendar.YEAR) %>년
							<%= cal.get(Calendar.MONTH)+1 %>월
							<%= cal.get(Calendar.DATE) %>일
							<%= getDay(cal.get(Calendar.DAY_OF_WEEK)) %></font><br><br>
					</header>
					<div class="posts">
						<article>
							<a href="exer/exerciseNewForm" class="image"><img src="images/exerPic01.jpg" alt="" /><!-- <img src="images/pic01.jpg" alt="" /> --></a>
							<h3>Exercise Management</h3>
							<p>오늘의 운동 기록하기</p>
						</article>
						<article>
							<a href="dietMain" class="image"><img src="images/dietPic01.jpg" alt="" /><!-- <img src="images/pic02.jpg" alt="" /> --></a>
							<h3>Diet Management</h3>
							<p>오늘의 식단 기록하기</p>
						</article>
					</div>
				</section>
				<!-- Section -->
				<!-- <section>
					<header class="major">
						<h2>TODAY's Record</h2>
					</header>
					<div class="features">
						<article>
							<div class="content">
								<h3>Today Exercise</h3>
								<p>Today Exercise</p>
							</div>
						</article>
						<article>
							<div class="content">
								<h3>Today Diet</h3>
								<p>Today Diet</p>
							</div>
						</article>
					</div>
				</section> -->
			</div>
		</div>
	
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search --> <!-- 메뉴 위 검색창 -->
								<section id="search" class="alt">
									<!-- <form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form> -->
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/">Mainpage</a></li>
										<!-- <li><a href="exerMain">Exercise Management Main</a></li> -->
										<li>
											<span class="opener">Exercise Management</span>
											<ul>
												<li><a href="exer/exerciseListView">Exercise Record List</a></li>
												<li><a href="voiceRecord">Voice Record</a></li>
												<li><a href="stt">Voice Record File Upload</a></li>
												<li><a href="exer/exerciseNewForm">Exercise Calender</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">Diet Management</span>
											<ul>
												<li><a href="foodList">Calorie Dictionary</a></li>
												<li><a href="dietMain">Diet Calender</a></li>
												<!-- <li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li> -->
											</ul>
										</li>
									</ul>
								</nav>
	 	
 							<!--Menu
								<nav id="menu">
									<header class="major">
										<h2>Record / File Upload</h2>
									</header>
									<ul>
										<li><a href="exer/exerciseListView">Exercise Record List</a></li>
										<li><a href="indexTest2">Recode TEST</a></li>
										<li><a href="voiceRecord">Voice Record</a></li>
										<li><a href="stt">Voice Record File Upload</a></li>
										<li><a href="exer/exerciseNewForm">Text record</a></li>
									</ul>
								</nav> -->

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
										<li class="icon solid fa-phone">(000) 000-0000</li>
										<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<!-- <footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer> -->

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