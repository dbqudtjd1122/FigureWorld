$(document).ready(function() {
	$("a.menuLink").hover( // 메뉴 마우스 올릴시 애니메이션 이벤트
	function() {
		// var left = $(this).parent().position().left;
		var width = $(this).width();
		var str_id = (this.id).substring(5, 6)

		$("#slider" + str_id).stop().animate({
			'left' : 0,
			'width' : width - 10
		});

		//#topMenu .menuLink:hover {
		/* topMenu 아이디를 가진 태그 안에 menuLink클래스를 가진 태그에 마우스가 over되면 스타일 설정*/
		//color: white;
		/* 글씨 색을 붉은색으로 설정 */
		//background - color: #64a2ff;
		/* 배경색을 조금 더 밝은 회색으로 설정 */
		//}
	}, function() {
		var str_id = (this.id).substring(5, 6)
		var width = $('ul li:first-child a').width();
		$("#slider" + str_id).stop().animate({
			'left' : 0,
			'width' : 0
		});
	});
	
	$("#main_title").on("click", function() {
		location='Figure_main'
	});

});

function submenu() {
	var submenu = new Array();
	var sub_tmps = document.getElementById("topMenu")
			.getElementsByTagName("ul");

	for (var i = 0, len = sub_tmps.length; i < len; i++) { // ul 클래스를 통한 list생성
		if (sub_tmps[i].className == "localNav") {
			submenu.push(sub_tmps[i]);
		}
	}
	var menu_tmps = document.getElementById("topMenu")
			.getElementsByTagName("a");
	for (var i = 0, len = menu_tmps.length; i < len; i++) {
		if (menu_tmps[i].className == "menuLink") {
			menu_tmps[i].onmouseover = function() { // 메뉴에 마우스가 들어왔을때
				for (var j = 0, sublen = submenu.length; j < sublen; j++) {
					submenu[j].style.display = "none";
				}
				document.getElementById(this.id + "_sub").style.display = "block";
			}
			menu_tmps[i].onfocus = menu_tmps[i].onmouseover;
		} else {
			$("#topMenu").mouseleave(function() { // 메뉴에서 마우스가 나갔을때.(서브메뉴 포함)
				for (var j = 0, sublen = submenu.length; j < sublen; j++) {
					submenu[j].style.display = "none";
				}
			})
		}
	}
}

function headmenu() {
	/*탑 메뉴 배너(로그인 회원가입 등등) + 서브메뉴*/
	var jbOffset = $('.topBanner').offset(); // 메뉴의 위치를 파악합니다.
	var jbOffset2 = $('#topMenu').offset();
	$(window).scroll(function() { // 스크롤이 발생하면 함수를 실행시킵니다.     
		if ($(document).scrollTop() > jbOffset.top) { // 문서의 스크롤바 위치가 메뉴의 수직 위치보다 아래라면
			$('.topBanner').addClass('topFixed'); // 메뉴에 jbFixed 클래스를 추가하여 고정시키고,
			if ($(document).scrollTop() + 50 > jbOffset2.top) {
				$("#topMenu").addClass('topFixed2');
				for (var i = 1; i <= 8; i++) { // 서브메뉴 스타일 적용
					$("#menu0" + String(i) + "_sub").css("top", "50px");
				}
			} else {
				$("#topMenu").removeClass('topFixed2');
				for (var i = 1; i <= 8; i++) { // 서브메뉴 스타일 적용
					$("#menu0" + String(i) + "_sub").css("top", "227px");
				}
			}
		} else {
			$('.topBanner').removeClass('topFixed'); // 그렇지 않다면 제거합니다.
			for (var i = 1; i <= 8; i++) { // 서브메뉴 스타일 적용
				$("#menu0" + String(i) + "_sub").css("top", "277px");
			}
		}
	});
	/*탑 메뉴 배너 END + 서브메뉴*/
}

function ProductSearch(){
	var search = $("#text_search").val();
	if(search.length < 2){
		alert("2글자 이상의 검색어로 입력해주세요.");
	} else {
		location='Figure_Product_list?Product_Name='+search;
	}
}

function EnterSearch(){ // 상품검색 엔터
	if (window.event.keyCode == 13) { // 엔터키로 온경우
		ProductSearch();
	}
}

function topbanner(id, Login_ID, Login_NM) { // 장바구니 페이지	
	if (Login_ID == "" || Login_ID == null) { // 로그인정보 없을시 
		if (confirm("로그인 정보가 없습니다.\n로그인창으로 이동하시겠습니까?") == true) { // 로그인창으로 가기
			location = 'Figure_login'
		}
	} else { // 로그인 정보 있을시
		var f = document.fr_topbanner;
		f.User_NM.value = Login_NM;

		if(id == "Shopping_basket"){ // 장바구니
			f.action = "/Figure_basket"
			f.submit();
		} else if(id == "myshopping"){ // 마이쇼핑
			f.action = "/Figure_myshopping"
			f.submit();
		}
	}
}
