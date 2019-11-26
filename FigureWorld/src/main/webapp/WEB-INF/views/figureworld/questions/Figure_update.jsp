<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script type="text/javascript" src="resources\js\Questions.js"></script>
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

		if ("${map['questions'].secret}" == "true") { // 비밀글설정 true면 체크박스 v
			$("input:checkbox[id='secret']").prop("checked", true);
		}

		// Questions.js
		// 제목, 내용 작성 글자수 제한
		select_text(); // 받은 데이터값을 엔터값 적용하여 뿌려주기
	});
	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}

	function update_finish() {
		var text_title = $("#text_title").val(); // 제목
		var text_content = $("#text_content").val(); // 내용

		if (text_title == "") {
			alert("제목을 입력해 주세요");
			fr_finish.text_title.focus();
			return false;
		} else if (text_content == "") {
			alert("내용을 입력해 주세요");
			fr_finish.text_content.focus();
			return false;
		} else {
			insert_text(); // Questions.js / true값 반환과 동시에 mysql에 엔터값 넣기
			return true;
		}
	}
</script>
<style>
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen">
		<div>
			<form action="Questions_update_writing?Questions_NM=${map['questions'].questions_NM}" method="post" name="fr_finish" onsubmit="return update_finish();">
				<div style="padding: 10px; width: 100%">
					<div style="height: 35px;">
						<label style="margin-left: 20%;">작성자 : ${map['name']}</label>
						<br>
					</div>
					<div style="margin-left: 20%">
						<textarea rows="2" cols="30" id="text_title" name="title" style="width: 75%; height: 40px;" placeholder=" 제목을 입력해 주세요">${map['questions'].title}</textarea>
						<span style="color: #aaa;" id="counter1">(0 / 최대 30자)</span>
						<textarea rows="10" cols="30" id="text_content" name="content" style="width: 75%; height: 300px; margin: 5px 0px;">${map['questions'].questions_Content}</textarea>
						<span style="color: #aaa;" id="counter2">(0 / 최대 500자)</span>
					</div>
					<div style="height: 35px;">
						<input type="checkbox" id="secret" name="secret" style="padding: 20px; margin-left: 20%;" />
						<a>비밀글 설정</a>
					</div>
					<div style="text-align: center; margin-bottom: 100px;">
						<input type="submit" id="btn_update" value="수정 완료" class="btn btn-primary" style="padding: 10px 20px; margin: 5px; font-weight: bold;">
						<input type="button" id="btn_cancel" value="취소" class="btn btn-secondary" onclick="history.back()" style="padding: 10px 20px; margin: 5px;">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>