<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources\js\Menu.js"></script>
<script type="text/javascript" src="resources\js\User.js"></script>
<link rel="stylesheet" href="resources\css\Menu.css?after">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<script>
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

		// 로그인 시도
		$("#btn_login").on("click", function() {
			login();
		});
	});

	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}

	function enterkey() {
		if (window.event.keyCode == 13) {
			login();
		}
	}

	function login() {
		var text_id = $("#text_id").val(); // 아이디
		var text_pw = $("#text_pw").val(); // 비밀번호

		if (text_id.length < 6) {
			alert("아이디를 6-16 글자로 입력해주세요.");
		} else if (text_pw.length < 8) {
			alert("비밀번호를 8-16 글자로 입력해주세요.");
		} else {
			var form = {
				ID : text_id,
				PW : text_pw
			}
			$.ajax({
				url : "/Login_connectivity",
				type : "POST",
				data : form,
				success : function(data) {
					var user = data.User;
					if (user == null) {
						alert("아이디 또는 비밀번호가 잘못 되었습니다.");
						location.href = "Figure_login";
					} else {
						alert(user.NAME + "(" + user.ID + ")" + "님 환영합니다!");
						location.href = "Figure_main";
					}
				},
				error : function() {
					alert("기능고장!!");
				}
			});
		}
	}
</script>
<style>
.leftzone {
	width: 50%;
	height: 100%;
	padding: 5px 10px;
	display: inline-block;
	margin-top: 70px;
}

.rightzone {
	width: 50%;
	height: 100%;
	padding: 5px;
	float: right;
}

.toplogin {
	width: 100%;
	height: 100px;
}

.bottomlogin {
	width: 100%;
	margin-left: 30%;
	padding-left: 10px;
}

.leftlogin {
	width: 200px;
	height: 100px;
	padding: 10px;
	margin-left: 30%;
	float: left;
}

.rightlogin {
	width: 100px;
	height: 70px;
	padding: 10px 0px;
	float: left;
}
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div style="width: 100%; height: 315px; margin-top: 20px; border-top: 2px solid rgb(182, 182, 182); border-bottom: 2px solid rgb(182, 182, 182);">
		<div class="leftzone">
			<div class="toplogin">
				<div class="leftlogin">
					<input type="text" id="text_id" style="margin: 3px 2px;" name="ID" onkeyup="enterkey()">
					<input type="password" id="text_pw" style="margin: 3px 2px;" name="PW" onkeyup="enterkey()">
				</div>
				<div class="rightlogin">
					<input type="button" class="btn btn-primary" style="height: 70px;" id="btn_login" value="로그인">
				</div>
			</div>
			<!-- <div class="bottomlogin">
				<input type="checkbox">
				<a>아이디 저장</a>
				<br>
				<label for="">아이디 찾기</label>
				<label for="">비밀번호 찾기</label>
			</div> -->
		</div>
		<div class="rightzone">
			<img style="width: 100%; margin: 0 auto; height: 100%;" alt="" src="resources/images/main_nod.jpg">
		</div>
	</div>
</body>
</html>