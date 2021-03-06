<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Project</title>
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
<script>
	/*이미지 슬라이드*/
	var imgs;
	var img_count;
	var img_position = 1;

	$(document).ready(function() {
		if ("${Login_ID}" == "" || "${Login_ID}" == null) { // 로그인정보 없을시 
			$("#login").show();
			$("#membership").show();
			$("#logout").hide();
		} else { // 로그인 정보 있을시
			$("#login").hide();
			$("#membership").hide();
			$("#logout").show();
		}

		headmenu(); // Menu.js파일 배너 및 서브메뉴 설정 

		// 이미지 bx슬라이더
		$(".bxslider").bxSlider({
			auto : true, // 이미지 회전이 자동으로 시작합니다.
			speed : 500, // 이미지가 다음 이미지로 바뀌는데 걸리는 시간입니다. 단위는 ms(mili seconds) 입니다. 500 ms가 기본값 입니다.
			pause : 4000, // 하나의 이미지가 멈춰서 보여지는 시간입니다. 4000ms 가 기본값입니다.
			mode : 'fade', // 이미지가 교체되는 방식입니다. 'fade', 'horizontal', 'vertical' 을 사용할 수 있습니다. 각각 fade in/fade out, 수평 스크롤, 수직 스크롤 방식으로 이미지가 교체됩니다.
			// autoControls : true, // 시작 중지 버튼을 보여지게 합니다.
			pager : true
		// 페이지 바로가기 버튼을 보여지게 합니다.
		});
	})
	
	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	};
</script>
<style>
#logo img {
	/*밑에 제품별 로고 이미지 (원피스 마블 등)*/
	margin: 10px;
	border: 1px solid #747474;
	text-align: center;
}

footer {
	width: 100%;
	text-align: center;
}
</style>
</head>

<body>
	<div class="topBanner">
		<div style="margin-right: 100px">
			<label for="" class="topBanner_in" id="login"
				onclick="location='Figure_login'">로그인</label> &nbsp; <label for=""
				class="topBanner_in" id="membership"
				onclick="location='Figure_membership'">회원가입</label> &nbsp; <label
				for="" class="topBanner_in" id="shopping_basket"
				onclick="topbanner(this.id)">장바구니</label> &nbsp; <label for=""
				class="topBanner_in" id="my_shopping" onclick="topbanner(this.id)">마이쇼핑</label>
			&nbsp; <label for="" class="topBanner_in" id="community"
				onclick="location='Figure_questions'">문의 게시판</label> &nbsp; <label
				for="" class="topBanner_in" id="logout">로그아웃</label>

		</div>
	</div>

	<div id="Screen">
		<div style="position: relative; height: 150px;">
			<div style="position: absolute;">
				<img src="resources\images\main_title.png" alt="" id="main_title"
					style="margin-left: auto; margin-right: auto; display: table; cursor: pointer;">
			</div>
			<div style="position: absolute; right: 0px; top: 53px;">
				<input type="text" id="text_search" name="keyword"
					onkeyup="EnterSearch()"
					style="height: 43px; width: 200px; border: 1px solid rgb(0, 81, 255);">
				<img src="resources\images\search.jpg" onclick="ProductSearch()"
					alt=""
					style="height: 43px; margin-right: 100px; margin-left: -5px; margin-top: -5px; cursor: pointer">
			</div>
		</div>
		<div
			style="height: 30px; text-align: center; background-color: rgba(82, 215, 255, 0.867);">
			<a style="color: white; font-size: 20px;">있을거 다~~~~있는 Figure
				World!</a>
		</div>
	</div>
	
	<div>
		<nav id="topMenu" style="background-color: white;">
			<ul id="total_menu">
				<li class="menuLink"><a class="menuLink" href="https://figurepresso.com/product/list.html?cate_no=27" id="menu01">원피스</a>
					<ul id="menu01_sub" class="localNav">
						<div id="slider1" style="height: 1px;"></div>
						<li><a href="#">밀짚모자 해적단</a>&nbsp;</li>
						<li><a href="#">흰수염 해적단</a>&nbsp;</li>
						<li><a href="#">최악의 세대</a>&nbsp;</li>
						<li><a href="#">사황</a>&nbsp;</li>
						<li><a href="#">칠무해</a>&nbsp;</li>
						<li><a href="#">해군</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="https://figurepresso.com/product/search.html?banner_action=&keyword=%EB%A7%88%EB%B8%94" id="menu02">마블</a>
					<ul id="menu02_sub" class="localNav">
						<div id="slider2" style="height: 1px;"></div>
						<li><a href="#">아이언맨</a>&nbsp;</li>
						<li><a href="#">토르</a>&nbsp;</li>
						<li><a href="#">캡틴 아메리카</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="https://figurepresso.com/category/%EB%93%9C%EB%9E%98%EA%B3%A4%EB%B3%BC/49/" id="menu03">드래곤볼</a>
					<ul id="menu03_sub" class="localNav">
						<div id="slider3" style="height: 1px;"></div>
						<li><a href="#">메뉴3</a>&nbsp;</li>
						<li><a href="#">메뉴4</a>&nbsp;</li>
						<li><a href="#">메뉴5</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="https://figurepresso.com/product/search.html?banner_action=&keyword=%ED%8F%AC%EC%BC%93%EB%AA%AC%EC%8A%A4%ED%84%B0" id="menu04">포켓몬스터</a>
					<ul id="menu04_sub" class="localNav">
						<div id="slider4" style="height: 1px;"></div>
						<li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://www.kantukan.co.kr/shop/mall/prdt/prdt_list.php?pcate=033007" id="menu05">아이돌마스터</a>
					<ul id="menu05_sub" class="localNav">
						<div id="slider5" style="height: 1px;"></div>
						<li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://www.kantukan.co.kr/shop/mall/prdt/prdt_list.php?pcate=033020004" id="menu06">코난</a>
					<ul id="menu06_sub" class="localNav">
						<div id="slider6" style="height: 1px;"></div>
						<li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://www.kantukan.co.kr/shop/mall/prdt/prdt_list.php?pcate=033020004" id="menu07">세일러문</a>
					<ul id="menu07_sub" class="localNav">
						<div id="slider7" style="height: 1px;"></div>
						<li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li>
					</ul></li>
				<li>|</li>
				<li class="menuLink"><a class="menuLink" href="http://www.kantukan.co.kr/shop/mall/prdt/prdt_list.php?pcate=033050" id="menu08">나루토</a>
					<ul id="menu08_sub" class="localNav">
						<div id="slider8" style="height: 1px;"></div>
						<li><a href="#">메뉴1</a>&nbsp;</li>
						<li><a href="#">메뉴2</a>&nbsp;</li>
						<li><a href="#">메뉴3</a>&nbsp;</li>
					</ul></li>
			</ul>
		</nav>
	</div>
	
	<div>
		<ul class="bxslider">
			<li><img src="resources/images/main_eb.jpg" alt=""
				id="slide_img"></li>
			<li><img src="resources/images/main_nod.jpg" alt=""
				id="slide_img"></li>
			<li><img src="resources/images/main_stampede.jpg" alt=""
				id="slide_img"></li>
			<li><img src="resources/images/main_stampede2.jpg" alt=""
				id="slide_img"></li>
			<li><img src="resources/images/main_zero.jpg" alt=""
				id="slide_img"></li>
		</ul>
	</div>

	<div id="logo" style="width: 100%; text-align: center;">
		<img src="resources/images/onepiec_logo.png" alt=""> <img
			src="resources/images/dragonball_logo.png" alt=""> <img
			src="resources/images/naruto_logo.png" alt=""> <img
			src="resources/images/pokemon_logo.png" alt=""> <img
			src="resources/images/sailormoon_logo.png" alt="">
	</div>

	<div>
		<footer>
			Figure World ┃ 서울특별시 종로구 종로12길 15 (관철동 13-13) ┃ 대표전화 1577-1541 ┃ 등록일
			2019-08-26 ┃ 대표이사 홍길동<br> COPYRIGHT www.FigureWorld.com<br>
			<br>
		</footer>
	</div>
</body>
</html>