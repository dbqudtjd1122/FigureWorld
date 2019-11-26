<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources\js\Menu.js"></script>
<script type="text/javascript" src="resources\js\User.js"></script>
<link rel="stylesheet" href="resources\css\Menu.css?after">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<!-- bx 슬라이더 (메인이미지 슬라이더) -->
<link href="resources/css/bxslider/jquery.bxslider.css" rel="stylesheet" />
<script src="resources/js/bxslider/jquery.bxslider.js"></script>
</head>
<body>
	<div class="topBanner">
		<div style="margin-right: 100px">
			<form name="fr_topbanner" method="post">
				<label for="" class="topBanner_in" id="login" onclick="location='Figure_login'">로그인</label>
				&nbsp;
				<label for="" class="topBanner_in" id="membership" onclick="location='Figure_membership'">회원가입</label>
				&nbsp;
				<label for="" class="topBanner_in" id="Shopping_basket" onclick="topbanner(this.id, '${Login_ID}', '${Login_NM}')">장바구니</label>
				&nbsp;
				<label for="" class="topBanner_in" id="myshopping" onclick="topbanner(this.id, '${Login_ID}', '${Login_NM}')">마이쇼핑</label>
				&nbsp;
				<label for="" class="topBanner_in" id="community" onclick="location='Figure_questions'">문의 게시판</label>
				&nbsp;
				<label for="" class="topBanner_in" id="logout">로그아웃</label>
				<input type="hidden" name="User_NM">
			</form>
		</div>
	</div>
	<div id="Screen">
		<div style="position: relative; height: 150px;">
			<div style="position: absolute;">
				<img src="resources\images\main_title.png" alt="" id="main_title" style="margin-left: auto; margin-right: auto; display: table; cursor: pointer;">
			</div>
			<div style="position: absolute; right: 0px; top: 53px;">
				<input type="text" id="text_search" name="keyword" onkeyup="EnterSearch()" style="height: 43px; width: 200px; border: 1px solid rgb(0, 81, 255);">
				<img src="resources\images\search.jpg" onclick="ProductSearch()" alt="" style="height: 43px; margin-right: 100px; margin-left: -5px; margin-top: -5px; cursor: pointer">
			</div>
		</div>
		<div style="height: 30px; text-align: center; background-color: rgba(82, 215, 255, 0.867);">
			<a style="color: white; font-size: 20px;">있을거 다~~~~있는 Figure World!</a>
		</div>
	</div>
	<div>
		<nav id="topMenu" style="background-color: white;">
			<ul id="total_menu">
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=원피스" id="menu01">원피스</a>
					<ul id="menu01_sub" class="localNav">
						<div id="slider1" style="height: 1px;"></div>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=루피">루피</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=조로">조로</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=상디">상디</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=나미">나미</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=쵸파">쵸파</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=마블" id="menu02">마블</a>
					<ul id="menu02_sub" class="localNav">
						<div id="slider2" style="height: 1px;"></div>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=아이언맨">아이언맨</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=토르">토르</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=캔틴 아메리카">캡틴 아메리카</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=헐크">헐크</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=드래곤볼" id="menu03">드래곤볼</a>
					<ul id="menu03_sub" class="localNav">
						<div id="slider3" style="height: 1px;"></div>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=손오공">손오공</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=손오반">손오반</a>&nbsp;</li>
						<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=트랭크스">트랭크스</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				 <li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=포켓몬스터" id="menu04">포켓몬스터</a>
					<ul id="menu04_sub" class="localNav">
						<div id="slider4" style="height: 1px;"></div>
						<!-- <li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li> -->
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=아이돌마스터" id="menu05">아이돌마스터</a>
					<ul id="menu05_sub" class="localNav">
						<div id="slider5" style="height: 1px;"></div>
						<!-- <li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li> -->
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=코난" id="menu06">코난</a>
					<ul id="menu06_sub" class="localNav">
						<div id="slider6" style="height: 1px;"></div>
						<!-- <li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li> -->
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=세일러문" id="menu07">세일러문</a>
					<ul id="menu07_sub" class="localNav">
						<div id="slider7" style="height: 1px;"></div>
						<!-- <li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li> -->
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=나루토" id="menu08">나루토</a>
					<ul id="menu08_sub" class="localNav">
						<div id="slider8" style="height: 1px;"></div>
						<!-- <li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li> -->
					</ul></li>
			</ul>
		</nav>
	</div>
</body>
</html>