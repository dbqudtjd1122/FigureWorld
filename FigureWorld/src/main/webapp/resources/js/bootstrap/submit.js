$(".sub").find("#subm").click(function(){ //회원가입
    var id = $(".sub").find("#sublog").val();
    var psw = $(".sub").find("#subpw").val();
    var already = false;
    var psw2 = document.getElementById("subpwc").value;
  
    $.each(submit, function(i,x){
        if(id==submit[i].id){
            already = true;
        }
    });
    if(psw!=psw2){
        alert("비밀번호가 같지 않습니다");
        return false;
    }

    if(already){
        alert("이미 있는 아이디입니다.");
        return false;
    }
    if(id==""){
        alert("아이디는 공란이안됩니다");
    }
    else{
        submit.push({id:id, pw:psw});
        document.getElementById("subpw").value ="";
        document.getElementById("subpwc").value ="";
        document.getElementById("sublog").value ="";
        alert("회원가입을 축하합니다.");
    }
 });