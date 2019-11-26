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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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

	});

	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}
</script>
<style>
table {
	width: 100%;
	height: 0 auto;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 100px;
	text-align: center;
	vertical-align: middle;
	table-layout: fixed;
	text-align: center
}

table, td {
	border: 1px solid rgb(182, 182, 182);
}

.td_imglist {
	width: 220px;
	overflow: hidden;
	text-overflow: ellipsis;
	padding: 15px 0px;
}
</style>
</head>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen">
		<div>
			<div id="product_list" style="margin-top: 30px; text-align: center;">
				<table>
					<tbody>
						<tr>
							<c:forEach var="row" items="${list}" varStatus="status">
								<td class="td_imglist">
									<div>
										<a href="Figure_Product_info?Product_NM=${row.product_NM}">
											<img alt="" src="${row.title_Img}" style="width: 220px;">
										</a>
										<br> ${row.product_Name}<br> 
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.price}" />원
									</div>
								</td>
								<c:if test="${status.count%5 eq 0}">
						</tr>
						<tr>
							</c:if>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>