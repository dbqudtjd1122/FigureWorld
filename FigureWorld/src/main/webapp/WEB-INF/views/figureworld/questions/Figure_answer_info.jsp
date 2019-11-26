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

		$("#btn_writing").on("click", function() { // 글쓰기
			if ("${Login_ID}" == "" || "${Login_ID}" == null) { // 로그인정보 없을시 
				alert("로그인 정보가 없습니다. 로그인 창으로 넘어갑니다.");
				location = 'Figure_login'
			} else { // 로그인 정보 있을시
				location = 'Figure_writing'
			}
		});

		$("#btn_list").on("click", function() { // 게시판 목록으로
			location = 'Figure_questions'
		});
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
	<div>
		<div style="padding: 10px; width: 100%; height: 100%">
			<div style="margin-left: 20%; margin-right: 20%;">
				<label style="margin: 0px; font-size: 14px;">
					작성자 : ${map['NAME']} ｜
					<fmt:formatDate value="${map['Writing_Time']}" pattern="yyyy.MM.dd HH:mm" />
				</label>
				<br />
				<!-- fn:replace 엔터처리를 위한 jstl함수 -->
				<label style="font-size: 18px; font-weight: bold; margin-top: 20px;">관리자 답변</label>
				<br />
				<label id="text_content" class="content" style="height: 200px; min-height: 180px;">${fn:replace(map['Answer_Content'], cn, br)}</label>
				<br>
			</div>
			<div style="width: 100%; margin-bottom: 100px;">
				<div style="width: 400px; margin-left: 20%; float: left;">
					<input type="button" id="btn_writing" value="글쓰기" class="btn btn-primary" style="padding: 10px 20px; margin: 5px; font-weight: bold;">
				</div>
				<div style="width: 400px; margin-right: 20%; float: right; text-align: right;">
					<input type="button" id="btn_list" value="목록" class="btn btn-primary" style="padding: 10px 20px; margin: 5px;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>