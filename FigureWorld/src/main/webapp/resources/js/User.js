$(document).ready(function () {
	
	
	// 모든페이지에서 서브메뉴 스타일 적용
	for (var i = 1; i <= 8; i++) {
		$("#menu0" + String(i) + "_sub").css("top", "277px").css(
				"width", "146px");
	}
	
	$("#logout").on("click", function () {
		$.ajax({
        	url: "/Logout_connectivity",
        	type: "POST",
            success: function(data){
            	alert("로그아웃!!");
            	location.reload();
            },
            error: function(){
            	alert("기능고장!!");
            	location.reload();
        	}
		});
	})

	/*$(document).on("click", "#logout", function () {
		$.ajax({
	    	url: "/Logout_connectivity",
	    	type: "POST",
	        success: function(data){
	        	alert("로그아웃!!");
	        },
	        error: function(){
	        	alert("기능고장!!");
	    	}
		});
		location.reload();
	});*/
});



