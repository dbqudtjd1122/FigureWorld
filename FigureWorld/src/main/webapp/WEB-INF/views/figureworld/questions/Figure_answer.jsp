<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	// 줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
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

		// Questions.js
		// 제목, 내용 작성 글자수 제한
	});
	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}

	function answer_finish() { // mysql에 엔터값 적용하기
		var answer = $('#text_answer').val();
		answer = answer.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#text_answer').val(str);
		return true;
	}
</script>
<style>
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen">
		<div style="margin-bottom: 100px;">
			<form action="InsertAnswer?Questions_NM=${map['questions'].questions_NM}" method="post" name="fr_finish" onsubmit="return answer_finish();">
				<div style="padding: 10px; width: 100%">
					<div style="height: 35px;">
						<label style="margin-left: 20%;">
							작성자 : ${Login_NAME}
							<input id="test_id" type="hidden" name="User_NM" value="${Login_NM}" />
						</label>
						<br>
					</div>
					<div style="margin-left: 20%;">
						<label style="font-size: 18px; font-weight: bold;">제목 </label>
						<label style="margin-bottom: 10px;">${map['questions'].title}</label>
						<br>
						<label style="font-size: 18px; font-weight: bold;">내용</label>
						<br>
						<label style="margin-bottom: 20px;">${fn:replace(map['questions'].questions_Content, cn, br)}</label>
					</div>
				</div>
				<div>
					<label style="margin-left: 20%; font-size: 18px; font-weight: bold;">관리자 답변 작성란</label>
					<textarea rows="10" cols="30" id="text_answer" name="answer" style="width: 60%; height: 300px; margin: 5px 0px 5px 20%;"></textarea>
					<span style="color: #aaa;" id="sp_answer">(0 / 최대 1000자)</span>
					<div style="text-align: center;">
						<input type="submit" id="btn_finish" value="확인" class="btn btn-primary" style="padding: 10px 20px; margin: 5px; font-weight: bold;">
						<input type="button" id="btn_cancel" value="취소" class="btn btn-secondary" onclick="history.back()" style="padding: 10px 20px; margin: 5px;">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>