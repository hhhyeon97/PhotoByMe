<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function del_check() {
		if ($.trim($("#del_pwd").val()) == "") {
			alert("탈퇴 비번을 입력하세요!");
			$("#del_pwd").val("").focus();
			return false;
		}
	}
</script>
<style>
body{
	text-align:center;
}
form {
	display:flex;
	justify-content: center;
	align-items: center;
	text-align:center;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div>
		<h2>회원탈퇴</h2>
		<form method="post" action="user_del_ok"
			onsubmit="return del_check();">
			<table id="tt">
				<tr>
					<th>회원아이디</th>
					<td>${mid}</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>${dm.mname}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="del_pwd" id="del_pwd"
						size="14" /></td>
				</tr>
			</table>
			<div id="btnmenu">
				<input type="submit" class="btn btn-dark" value="탈퇴" /> 
				<input type="reset" value="취소" class="btn btn-dark" onclick="$('#del_pwd').focus();" />
			</div>
		</form>
	</div>
<jsp:include page="../subfooter.jsp" />
</body>
</html>