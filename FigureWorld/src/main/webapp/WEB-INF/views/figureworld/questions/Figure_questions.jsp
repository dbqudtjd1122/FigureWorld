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
<link rel="stylesheet" href="resources\css\Menu.css?after">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<script type="text/javascript">

	$(document).ready(
			function() {

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
				
				// $("#questions_search").val("${search}"); // 검색한 정보 뿌려주기
				
				$("#btn_writing").on("click", function () {
					if("${Login_ID}" == "" || "${Login_ID}" == null){ // 로그인정보 없을시 
						alert("로그인 정보가 없습니다. 로그인 창으로 넘어갑니다.");
						location='Figure_login'
					} else{ // 로그인 정보 있을시
						location='Figure_writing'
					}
				});
			});
	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}
	
	function Questions_info(Questions_NM, secret, unm, name, rating){
		if(secret == "true"){
			if("${Login_NM}" == unm){ // 게시글과 로그인한사람이 같은경우
				if(rating == "관리자"){
					location='Answer_info?Questions_NM='+Questions_NM+"&name="+name;
				} else {
					location='Questions_info?Questions_NM='+Questions_NM+"&name="+name;
				}
			} else if ("${Login_NM}" == "") { // 로그인정보가 없음
				if (confirm("로그인 정보가 없습니다.\n로그인창으로 이동하시겠습니까?") == true) { // 로그인창으로 가기
					location='Figure_login';
				}
			} else { // 정보가 다름
				if("${Login_Rating}" == "대표이사" || "${Login_Rating}" == "관리자"){
					if(rating == "관리자"){
						location='Answer_info?Questions_NM='+Questions_NM+"&name="+name;
					} else {
						location='Questions_info?Questions_NM='+Questions_NM+"&name="+name;
					}
				} else {
					alert("접근 불가능한 비밀글입니다.");
				}
			}
		} else {
			if(rating == "관리자"){
				location='Answer_info?Questions_NM='+Questions_NM+"&name="+name;
			} else {
				location='Questions_info?Questions_NM='+Questions_NM+"&name="+name;
			}
		}
	}
	
	function page(idx, search){
		var pagenum = idx;
	    // var contentnum = $("#contentnum option:selected").val();   
	    var str_search = "${search}"; // 검색값
	    var search_value = "${search_value}"; // 검색 옵션 (제목/내용/작성자)
	    
	    if(search == "search"){ // 검색버튼으로 온경우
	    	search_value = $("#search_value option:selected").val();
			str_search = $("#questions_search").val();
		}
	    //location.href="${pageContext.request.contextPath}/Figure_questions?pagenum="+pagenum+"&contentnum="+contentnum+"&search="+str_search+"&search_value="+search_value;
	    location.href="${pageContext.request.contextPath}/Figure_questions?pagenum="+pagenum+"&search="+str_search+"&search_value="+search_value; 
    }
	
	function enterkey(idx, search) {
		if (window.event.keyCode == 13) { // 엔터키로 온경우
			page(idx, search);
		}
	}
	
</script>
<style>
#question_list {
	text-align: center;
}

.num { /*번호*/
	width: 80px;
	height: 50px;
}

.title { /*제목*/
	width: 800px;
	height: 50px;
}

.name { /*이름*/
	width: 150px;
	height: 50px;
}

.date { /*작성일*/
	width: 230px;
	height: 50px;
}

.inquiry { /*조회수*/
	width: 80px;
	height: 50px;
}

.secret { /*비밀글*/
	width: 80px;
	height: 50px;
}

#text_title { /*게시글 제목*/
	cursor: pointer;
	color: #4A5CFD;
}

tfoot tr {
	clear: both;
}
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen">
		<div id="question_list" style="padding: 10px; margin-top: 30px;">
			<table class="table table-hover" style="vertical-align: middle;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>비밀글</th>
				</tr>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td class="num">${row['Questions_NM']}</td>
							<td class="title">
								<label id="text_title" onclick="Questions_info('${row['Questions_NM']}', '${row['Secret']}', 
								'${row['User_NM']}', '${row['NAME']}', '소비자')">${row['Title']} </label>
							</td>
							<td class="name">${row['NAME']}</td>
							<td class="date">
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
								<fmt:formatDate value="${row['BoadrWriting_Time']}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td class="inquiry">${row['Inquiry_Index']}</td>
							<td class="secret">
								<c:choose>
									<c:when test="${row['Secret'] eq true}">
										<img alt="" src="resources\images\lock.png" style="width: 30px;">
									</c:when>
									<c:otherwise>
										<img alt="" src="resources\images\unlock.png" style="width: 30px;">
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<c:forEach var="low" items="${answer}">
							<c:if test="${row['Questions_NM'] eq low['Questions_NM']}">
								<tr>
									<td></td>
									<td>
										<img alt="" src="resources\images\arrow.png" style="width: 37px;">
										&nbsp;
										<label id="text_title" onclick="Questions_info('${row['Questions_NM']}', '${row['Secret']}', 
								'${row['User_NM']}', '${row['NAME']}', '관리자')">관리자 답글 입니다. </label>
									</td>
									<td class="name">${low['NAME']}</td>
									<td class="date">
										<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
										<fmt:formatDate value="${low['Writing_Time']}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td></td>
									<td></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="position: relative; margin-bottom: 100px;">
			<div style="position: absolute;">
				<input type="button" id="btn_writing" value="글쓰기" class="btn btn-outline-primary" style="float: right; width: 100px; margin-right: 50px;">
			</div>
			<div style="position: absolute; margin-left: 120px;">
				<select id="search_value" style="border: 1px solid rgb(0, 81, 255); height: 38px;">
					<option value="제목" <c:if test="${search_value=='제목'}"> selected </c:if>>제목</option>
					<option value="내용 " <c:if test="${search_value=='내용'}"> selected </c:if>>내용</option>
					<option value="작성자" <c:if test="${search_value=='작성자'}"> selected </c:if>>작성자</option>
					<option value="모두" <c:if test="${search_value=='모두'}"> selected </c:if>>제목+내용+작성자</option>
				</select>
				<input type="text" id="questions_search" value="${search}" style="height: 38px; width: 200px; border: 1px solid rgb(0, 81, 255);" onkeyup="enterkey(1, 'search')">
				<img src="resources\images\search.jpg" alt="" style="height: 39px; margin-right: 100px; margin-left: -5px; margin-top: -5px; cursor: pointer" onclick="page(1, 'search')">
			</div>
			<nav aria-label="page navigation example">
				<ul class="pagination justify-content-center" style="margin-left: auto; margin-right: auto;">
					<!-- class="pagination" -->
					<!-- 왼쪽 화살표 -->
					<c:if test="${page.prev}">
						<li class="page-item"><a class="page-link" style="text-decoration: none;" href="javascript:page(${page.getStartPage()-1}, '');">&laquo;</a></li>
					</c:if>
					<!-- 페이지 숫자 표시 -->
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
						<li class="page-item"><a class="page-link" style="text-decoration: none;" href="javascript:page(${idx}, '');">${idx}</a></li>
					</c:forEach>
					<!-- 오른쪽 화살표 -->
					<c:if test="${page.next}">
						<li class="page-item"><a class="page-link" style="text-decoration: none;" href="javascript:page(${page.getEndPage()+1}, '');">&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>