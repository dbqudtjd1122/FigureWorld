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
<script type="text/javascript" src="resources\js\bootstrap\bootstrap.js"></script>
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
	
		
		$(".check-all").click(function() { // 체크박스 전체선택
			$(".check-row").prop("checked", this.checked);
		});
		
		$("#All_Order").click(function() { // 체크된 목록 주문하기 ['Basket_NM']
			var checklist = [];
			$("input[name=check]:checked").each(function() {
				checklist.push($(this).val());
			});
			
			allorder(checklist);
		});
	});

	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}
	var clickoption = "";
	function QuantityChage(basket_nm, stock, quantity){ // 수량변경

		 $("#h_basket_nm").val(basket_nm);
		 $('#SelectQuantity').empty(); // 옵션 삭제
		 
		 for(var i=1; i<=stock; i++){ // 옵션추가
			$('<option value="'+ i +'">' + i + '</option>').appendTo('#SelectQuantity');
		 	if(quantity == i){
		 		$("#SelectQuantity").val(i).attr("selected", "selected");
		 	}
		 }
		 $("#myModal").modal();
	}
	
	function modal_finish(){ // 모달 확인버튼으로 종료시 
		var basket_nm = $("#h_basket_nm").val();
		var quantity = $("#SelectQuantity option:selected").text()

		var form = { 
					Basket_NM : basket_nm,
					Quantity : quantity
				}
			$.ajax({
				url : "/Figure_UpdateQuantity",
				type : "POST",
				data : form,
				success : function(data) {
					if(data.result == 1){
						location.reload();
					}
				},
				error : function() {
					alert("기능고장!!");
				}
			});
	}
	
	function order_basket(basket_nm){ // 클릭상품만 구매
		
		var checklist = [basket_nm];
		allorder(checklist);
	}
	
	function allorder(checklist){ // 주문
		if(checklist.length == 0){
			alert("주문하실 상품을 선택해 주세요.");
		} else {
			var form = { 
				Checklist : checklist
			}
			$.ajax({
				url : "/Figure_AllOrder",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				type : "POST",
				data : form,
				success : function(data) {
					location.reload();
					alert("성공");
				},
				error : function() {
					alert("기능고장!!");
				}
			});
		}
	}
		
	function delete_basket(basket_nm){ // 장바구니 목록 1개 삭제
		if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?") == true) {
			var form = {
					Basket_NM : basket_nm
			}
			$.ajax({
				url : "/Figure_DeleteBasket",
				type : "POST",
				data : form,
				success : function(data) {
					if(data.result == 1){
						alert("목록이 삭제 되었습니다.");
						location.reload(); // 새로고침
					} else {
						alert("삭제 실패");
						location = 'Figure_main';
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
th {
	border: 1px solid #EEEEEE;
	margin-top: 10px;
	padding: 10px;
	height: 40px;
}

td {
	border: 1px solid #EEEEEE;
}

.td_div1 {
	width: 180px;
	float: left;
}

.td_img {
	width: 150px;
	padding: 15px;
}

.td_div2 {
	float: left;
	padding: 15px 0px;
}
</style>
<body>
	<jsp:include page="../FigureTopMenu.jsp" flush="true"></jsp:include>
	<div id="Screen" style="margin-bottom: 100px; padding: 10px 50px;">
		<h5>장바구니</h5>
		<div style="margin: 10px 5px; border-top: 2px solid #000000;">
			<table style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<th>
							<input type="checkbox" class="check-all">
						</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>배송비</th>
						<th>판매자명</th>
						<th>주문금액</th>
					<tr>
				</thead>
				<tbody>
					<c:set var="total" value="0" />
					<c:forEach var="row" items="${list}" varStatus="status" begin="0" end="${list_size}">
						<tr>
							<td style="width: 35px;">
								<input type="checkbox" name="check" class="check-row" value="${row['Basket_NM']}">
							</td>
							<td style="text-align: left;">
								<div class="td_div1">
									<a href="Figure_Product_info?Product_NM=${row['Product_NM']}">
										<img alt="" src="${row['Title_Img']}" class="td_img">
									</a>
								</div>
								<div class="td_div2">
									<label>[${row['Product_Group']}] ${row['Product_Name']}</label>
									<br>
									<label>${row['Detail']}</label>
									<br>
									<label>재고 : ${row['Stock']}</label>
									<br>
								</div>
							</td>
							<td>${row['Quantity']}<br>
								<input type="button" class="btn btn-outline-dark" value="변경" onclick="QuantityChage(${row['Basket_NM']}, ${row['Stock']}, ${row['Quantity']})" data-toggle="modal" data-target="#myModal" style="padding: 2px 5px; margin-top: 5px;">
							</td>
							<td>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${row['Price']}" />
							</td>
							<c:if test="${status.index eq 0}">
								<td rowspan="<c:out value="${status.end}" />">무료</td>
								<td rowspan="<c:out value="${status.end}" />">FigureWorld</td>
							</c:if>
							<td>
								<div>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${row['Price'] * row['Quantity']}" />
									원<br>
									<c:set var="total" value="${total + (row['Price'] * row['Quantity'])}" />
									<input type="button" class="btn btn-info" value="주문" onclick="order_basket(${row['Basket_NM']})" style="padding: 2px 5px; margin-top: 5px;">
									<input type="button" class="btn btn-secondary" value="삭제" onclick="delete_basket(${row['Basket_NM']})" style="padding: 2px 5px; margin-top: 5px;">
								</div>
							</td>
						</tr>
						<c:if test="${status.last}">
							<!-- for문의 마지막 값일경우. true -->
							<tr style="height: 100px;">
								<td colspan="4">총알배송</td>
								<td colspan="3" style="background-color: rgba(82, 215, 255, 0.867);">
									결제금액<br>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" />
									원
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="width: 100%; text-align: center; padding-top: 10px;">
			<input type="button" value="주문하기" class="btn btn-success" id="All_Order" style="margin: 5px; padding: 10px; width: 150px;">
			<a href="/Figure_main">
				<input type="button" value="쇼핑 홈 가기" class="btn btn-secondary" style="margin: 5px; padding: 10px; width: 150px;">
			</a>
		</div>
		<!-- Trigger the modal with a button -->
		<input type="hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4>구매수량 변경</h4>
					</div>
					<div class="modal-body">
						<select id="SelectQuantity" name="SelectQuantity" style="height: 25px;">
						</select>
						<input type="hidden" id="h_basket_nm">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="modal_finish()">확인</button>
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>