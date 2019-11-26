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
<!-- raty 별점 플러그인 -->
<script src="resources/js/raty/jquery.raty.js"></script>
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
		headnavi(); // 네비바, 작은구매창 스크롤 고정설정

		// 구매수량 수정
		var price = "${product.price}"; // 가격
		var stock_index = "${product.stock}"; // 재고
		var purchase = $(".purchase").val(); // 구매할수량
		$(".up").on("click", function() {
			if (stock_index > 0 && stock_index > purchase) {
				purchase = Number(purchase) + 1;
				$(".purchase").val(purchase);
				$(".price").text(numberWithCommas(price * purchase));
			} else {
				alert("재고가 부족합니다.");
			}
		});

		$(".down").on("click", function() {
			if (purchase > 0) {
				purchase = Number(purchase) - 1;
				$(".purchase").val(purchase);
				$(".price").text(numberWithCommas(price * purchase));
			}
		});

		$(".btn_basket").on("click", function() { // 장바구니 담기
			if (purchase != 0) {
				if ("${Login_ID}" == "" || "${Login_ID}" == null) { // 로그인정보 없을시 
					if (confirm("로그인 정보가 없습니다.\n로그인창으로 이동합니다.") == true) { // 로그인창으로 가기
						location = 'Figure_login';
					} else {
						return;
					}  
				} else { // 로그인 정보 있을시
					var form = {
							User_NM : "${Login_NM}",
							Product_NM : "${product.product_NM}",
							Quantity : purchase
					}
					$.ajax({
						url : "/Figure_InsertBasket",
						type : "POST",
						data : form,
						success : function(data) {
							if(data.result == 1){
								if (confirm("장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠습니까?") == true) { // 로그인창으로 가기
									topbanner("Shopping_basket", "${Login_ID}", "${Login_NM}");
								}
							} else if(data.result == -1){
								if (confirm("장바구니에 이미 담긴 상품 입니다.\n장바구니로 이동하시겠습니까?") == true) { // 로그인창으로 가기
									topbanner("Shopping_basket", "${Login_ID}", "${Login_NM}");
								}
							}
						},
						error : function() {
							alert("기능고장!!");
						}
					});
				}
			} else {
				alert("구매수량이 0개 입니다.")
			}

		})

		/* $("#purchase").on("click", function () {
		    stock_index = $("#stock_index").text();
		    purchase_index = $("#purchase_index").val();
		    if(stock_index > 0){
		        sum = stock_index-purchase_index;
		        $("#stock_index").text(sum);
		        $("#purchase_index").val(1);
		        $("#a_purchase").text(purchase_index+"개 구매되었습니다!!");
		        stock_index = sum;
		        purchase_index = 1;
		    } else{
		        alert("재고가 없습니다.");
		    }
		}) */
	});
	onload = function() {
		submenu(); // Menu.js파일 서브메뉴 설정 mouseover, mouseleave
	}

	function headnavi() { // 스크롤 내렸을때 네비바 상단 고정
		var scrol1 = $("#navi1").offset();
		var scrol2 = $("#navi2").offset();
		var product_mini = $("#mini").offset();

		$(window).scroll(function() {
			if ($(document).scrollTop() > scrol1.top - 172) { // 1번 네비바
				$("#navi1").addClass("navi1");
				if ($(document).scrollTop() > scrol2.top - 172) { // 2번 네비바
					$("#navi1").removeClass("navi1");
					$("#navi2").addClass("navi2");
					$("#mini").removeClass("basics-mini");
					$("#mini").addClass("new-mini");	
				} else {
					$("#navi2").removeClass("navi2");
					$("#mini").removeClass("new-mini");
					$("#mini").addClass("basics-mini");
				}
			} else {
				
				$("#navi1").removeClass("navi1");
				$("#navi2").removeClass("navi2");
				$("#mini").removeClass("new-mini");
				$("#mini").addClass("basics-mini");
			}
		})
	}

	function numberWithCommas(x) { // 정수 3자리마다 컴마찍기.
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<style>
.navi1 {
	/*스크롤 내려도 고정시키기 위함*/
	position: fixed;
	top: 99px;
	z-index: 2;
	left: 0;
	right: 0;
}

.navi2 {
	/*스크롤 내려도 고정시키기 위함*/
	position: fixed;
	top: 99px;
	z-index: 2;
	left: 0;
	right: 0;
}

.new-mini {
	/*스크롤 내려도 고정시키기 위함*/
	width: 400px;
	position: fixed;
	top: 170px;
	z-index: 2;
	margin-left: 1000px;
}

.basics-mini {
	width: 400px;
	float: right;
	border: 1px solid #EEEEEE;
}

.a-item-ok {
	width: 698px;
	text-align: center;
	vertical-align: middle;
	background-color: #EEEEEE;
	font-weight: bold;
	color: #9EA2A7;
}

.a-item-non {
	width: 698px;
	text-align: center;
	vertical-align: middle;
	background-color: #EEEEEE;
	font-weight: bold;
	color: #9EA2A7;
	margin: 1px;
}

.a-item-non:hover {
	color: #9EA2A7;
}

.li-item-ok {
	border-left: 1px solid #515050;
	border-right: 1px solid #515050;
	border-top: 1px solid #515050;
}

.li-item-non {
	border-bottom: 1px solid #515050;
}

</style>
</head>
<body>
	<jsp:include page="../FigureTopMenu.jsp"></jsp:include>
	<div id="Screen">
		<div class="wrap" style="float: left; width: 50%;">
			<img class="target" data-zoom="3" alt="" src="${product.title_Img}" style="width: 100%; padding: 50px; margin: 0 auto;">
		</div>
		<div style="float: right; width: 50%; margin-top: 50px;">
			<div style="float: right;">
				<label style="float: right;">상품번호 : ${product.product_NM}</label>
				<br>
				<label style="float: right;">상품등록일자 : <fmt:formatDate value="${product.product_Date}" pattern="yyyy-MM-dd" /></label>
			</div>
			<div style="width: 100%; padding-left: 50px; margin: 0 auto; float: left;">
				<h2>
					<label style="font-weight: bold;">[${product.product_Group}] ${product.product_Name}</label>
					<a href="" style="float: right;">
						<img src="resources\images\heart2.png" style="width: 50px; margin: 10px;">
					</a>
				</h2>
				<label style="font-size: 16px;">${product.detail}</label>
				<br> <br>
				<div style="width: 100%; border-top: 1px solid rgb(182, 182, 182); border-bottom: 1px solid rgb(182, 182, 182); padding: 20px 10px 10px 10px;">
					<h5>
						<label>
							가격 :
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />
							원
						</label>
						<!-- price 금액 쉼표처리 -->
						<br>
						<label>재고 : ${product.stock}</label>
					</h5>
				</div>
				<div style="width: 100%; padding: 20px 10px 10px 10px;">
					<h5>
						<label>수량 : </label>
						<input type="button" class="down" value="-" style="width: 32px; margin-right: -6px; padding-left: 8px; padding-right: 8px;">
						<input type="text" class="purchase" readonly="readonly" value="0" style="padding-left: 8px; padding-right: 8px; max-width: 50px; text-align: center;">
						<input type="button" class="up" value="+" style="width: 32px; margin-left: -6px; padding-left: 8px; padding-right: 8px;">
						<br>
						<label>총 상품금액 : </label>
						<label class="price">0</label>
						<label>원</label>
					</h5>
				</div>
				<div style="width: 100%; margin: 0 auto; text-align: center; margin-top: 10px;">
					<input type="button" class="btn btn-outline-secondary btn_basket" value="장바구니" style="padding: 15px; width: 47%; margin: 5px;">
					<input type="button" class="btn btn-secondary" value="바로구매" style="padding: 15px; width: 47%; margin: 5px;">
				</div>
			</div>
		</div>
	</div>
	<div style="min-width: 100%;">
		<div id="navi1" style="width: 1400px; display: table; margin: auto;">
			<ul class="nav nav-tabs" style="line-height: 50px;">
				<li class="nav-item li-item-ok"><a class="nav-link active a-item-ok" href="#navi1">관련 상품</a></li>
				<li class="nav-item li-item-non"><a class="nav-link a-item-non" href="#navi2">상품 정보</a></li>
			</ul>
		</div>
	</div>
	<div id="Screen">
		<table>
			<c:forEach var="row" items="${list}">
				<td style="width: 20%; text-align: center; padding: 30px;">
					<div>
						<a href="Figure_Product_info?Product_NM=${row.product_NM}">
							<img alt="" src="${row.title_Img}" style="width: 220px;">
						</a>
						<br>
						<h6>[${row.product_Group}]${row.product_Name}</h6>
						<label>
							가격 :
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${row.price}" />
							원
						</label>
						<br>
						<label>재고 : ${row.stock}</label>
						<br>
					</div>
				<td>
			</c:forEach>
		</table>
	</div>
	<div>
		<div id="navi2" style="width: 1400px; display: table; margin: auto;">
			<ul class="nav nav-tabs" style="line-height: 50px;">
				<li class="nav-item li-item-non"><a class="nav-link a-item-non" href="#navi1">관련 상품</a></li>
				<li class="nav-item li-item-ok"><a class="nav-link active a-item-ok" href="#navi2">상품 정보</a></li>
			</ul>
		</div>
	</div>
	<div id="Screen" style="margin-bottom: 150px;">
		<div style="min-width: 100%;">
			<div style="width: 1000px; float: left;">
				<img src="${product.info_Img}" alt="" style="width: 100%; margin: 0 auto;">
			</div>
			<div id="mini" class="basics-mini">
				<div style="width: 100%; height: 150px; text-align: center; border: 1px solid #EEEEEE;">
					<img alt="" src="${product.title_Img}" align="left" style="width: 150px; padding: 20px; margin: 0 auto;">
					<label style="font-weight: bold; margin-top: 30px;">상품명</label>
					<br>
					<label style="font-weight: bold;">[${product.product_Group}] ${product.product_Name}</label>
				</div>
				<div style="width: 100%; padding: 20px 0px 10px 30px;">
					<h5>
						<label>
							가격 :
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />
							원
						</label>
						<br>
						<label>재고 : ${product.stock}</label>
						<br>
						<label>수량 : </label>
						<input type="button" value="-" class="down" style="width: 32px; margin-right: -6px; padding-left: 8px; padding-right: 8px;">
						<input type="text" class="purchase" readonly="readonly" value="0" style="width: 50px; text-align: center; padding-left: 8px; padding-right: 8px;">
						<input type="button" value="+" class="up" style="width: 32px; margin-left: -6px; padding-left: 8px; padding-right: 8px;">
						<br>
						<label>총 상품금액 : </label>
						<label class="price">0</label>
						<label>원</label>
					</h5>
				</div>
				<div style="width: 100%; padding: 0px 25px;">
					<input type="button" class="btn btn-outline-secondary btn_basket" value="장바구니" style="padding: 15px; width: 100%; margin: 5px;">
					<br>
					<input type="button" class="btn btn-secondary" value="바로구매" style="padding: 15px; width: 100%; margin: 5px;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>