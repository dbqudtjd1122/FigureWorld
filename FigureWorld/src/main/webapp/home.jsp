<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%
	String strReferer = request.getHeader("referer");

	if(strReferer == null){
%>
<script language="javascript">
	alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
	document.location.href="/Figure_main";
</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<script type="text/javascript">

</script>
</head>
<body>
	<h1>비정상적인 경로 입니다. 로그인을 해주세요.</h1>
	<a href="location='Figure_login'"></a>
</body>
</html>
