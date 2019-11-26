<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        div{
            border: 2px solid #f00;
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
    <button id="creat">글쓰기</button>
    <button id="remove">삭제하기</button>
    <div id="divvv">

        <td>1번</td>
    </div>
    
    <br>
    
    <div id="divvv">
        <td>2번</td>
    </div>

    <marquee><img src="images/iron2.png" alt=""></marquee>
 
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script>
        // var m = $("<marquee></marquee>").text("ㅋㅋㅋ");
        var m = $("<tr><td></td></tr>").text("ㅋㅋㅋ");
        var num = 0;
        $("#creat").click(function () {
            // $("div").append(m); // 아래생성
            // $("div").prepend(m); // 위에 생성


            var divv = $("div");
            $("<tr><td>ㅋㅋㅋ"+num+"</td></tr>").prependTo("div"); // 연달아 쓸경우
            // divv.prepend(m); // 한가지만 골라서 단발적으로 쓸겨우
            num++;
        });
        $("#remove").click(function () {
            $("div").empty();
        });

    </script>
</body>

</html>