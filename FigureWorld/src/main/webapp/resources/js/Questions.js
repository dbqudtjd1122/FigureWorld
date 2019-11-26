$(document).ready(function() {

	$("#text_title").keyup(function(e) { // 제목 작성글자수 제한
		var title = $(this).val();
		$('#counter1').html("(" + title.length + " / 최대 30자)"); //글자수 실시간 카운팅

		if (title.length > 30) {
			alert("최대 30자까지 입력 가능합니다.");
			$(this).val(title.substring(0, 30));
			$('#counter1').html("(30 / 최대 30자)");
		}
	});

	$("#text_content").keyup(function(e) { // 내용 작성글자수 제한
		var content = $(this).val();
		$('#counter2').html("(" + content.length + " / 최대 500자)"); //글자수 실시간 카운팅

		if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#counter2').html("(500 / 최대 500자)");
		}
	});

	$("#text_answer").keyup(function(e) { // 내용 작성글자수 제한
		var answer = $(this).val();
		$('#sp_answer').html("(" + answer.length + " / 최대 1000자)"); //글자수 실시간 카운팅

		if (answer.length > 1000) {
			alert("최대 1000자까지 입력 가능합니다.");
			$(this).val(answer.substring(0, 1000));
			$('#sp_answer').html("(1000 / 최대 1000자)");
		}
	});
});

function select_text() { // 받은 데이터값을 엔터값 적용하여 뿌려주기
	var title = $("#text_title").val(); // 제목
	title = title.split('<br>/').join("\r\n");
	$("#text_title").val(title);

	var content = $("#text_content").val(); // 내용
	content = content.split('<br>/').join("\r\n");
	$("#text_content").val(content);
}

function insert_text() { // 입력한 값을 mysql에 엔터값 넣기
	var title = $('#text_title').val();
	title = title.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#text_title').val(str);
	var content = $('#text_content').val();
	content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#text_content').val(str);
}
