<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.bxslider li {
    float:left;
}
.bxslider li a{
    height:inherit;
    width:inherit;
    display:block
}

footer {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="./FigureTopMenu.jsp"></jsp:include>
	<div>
		<ul class="bxslider">
			<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=아츠제로"><img src="resources/images/main_eb.jpg" alt="" id="slide_img"></a></li>
			<li><a href="#"><img src="resources/images/main_nod.jpg" alt="" id="slide_img"></a></li>
			<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=사보&에이스"><img src="resources/images/main_stampede.jpg" alt="" id="slide_img"></a></li>
			<li><a href="#"><img src="resources/images/main_stampede2.jpg" alt="" id="slide_img"></a></li>
			<li><a href="http://192.168.0.97:9090/Figure_Product_list?Product_Name=반다이"><img src="resources/images/main_zero.jpg" alt="" id="slide_img"></a></li>
		</ul>
	</div>
	<div id="logo" style="width: 100%; text-align: center;">
		<img src="resources/images/onepiec_logo.png" alt="">
		<img src="resources/images/dragonball_logo.png" alt="">
		<img src="resources/images/naruto_logo.png" alt="">
		<img src="resources/images/pokemon_logo.png" alt="">
		<img src="resources/images/sailormoon_logo.png" alt="">
	</div>
	<div>
		<footer>
			Figure World ┃ 서울특별시 종로구 종로12길 15 (관철동 13-13) ┃ 대표전화 1577-1541 ┃ 등록일 2019-11-22 ┃ 대표이사 유병성<br> COPYRIGHT www.FigureWorld.com<br> <br>
		</footer>
	</div>
</body>
</html>