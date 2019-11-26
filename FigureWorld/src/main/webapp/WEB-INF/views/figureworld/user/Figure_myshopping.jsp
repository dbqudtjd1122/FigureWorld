<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<script type="text/javascript">
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
	});

	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}
</script>
<style>
td {
	border: 1px solid #EEEEEE;
	margin: 0 auto;
	text-align: center;
}

.td_div1 {
	width: 180px;
	float: left;
	margin-left: 20%;
}

.td_img {
	width: 150px;
	padding: 15px;
}

.td_div2 {
	width: 200px;
	float: left;
	padding: 15px 0px;
}
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen" style="margin-bottom: 100px; padding: 10px 50px;">
		<h5>주문내역</h5>
		<div style="margin: 10px 5px; border-top: 2px solid #000000;">
			<table style="width: 100%; text-align: center; margin: auto;">
				<!-- <thead>
					<tr>
						<th>하하</th>
						<th>ㅈㅈㅈ</th>
						<th>ㄷㄷㄷ</th>
					</tr>
				</thead> -->
				<tbody>
					<c:forEach var="row" items="${list}" varStatus="status">
						<tr>
							<td>
								<div class="td_div1">
									<a href="Figure_Product_info?Product_NM=${row['Product_NM']}">
										<img alt="" src="${row['Title_Img']}" class="td_img">
									</a>
								</div>
								<div class="td_div2">
									<label>[${row['Product_Group']}] ${row['Product_Name']}</label>
									<br>
									<label>${row['Purchase_Quantity']}개 주문</label>
									<br>
									<label>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${row['Payment_Amount']}" />
										원
									</label>
								</div>
								<div class="td_div2">
									<label>Figure_World</label><br>
									<label>1588-1541</label><br>
									<input type="button" class="btn btn-outline-secondary" value="문의하기" onclick="location='Figure_questions'">
								</div>
								<div class="td_div2">
									<label>주문일 <fmt:formatDate value="${row['Purchase_Date']}" pattern="yyyy-MM-dd" /></label><br>
									<label>배송출발일 <fmt:formatDate value="${row['Bereleased_Date']}" pattern="yyyy-MM-dd" /> </label>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>