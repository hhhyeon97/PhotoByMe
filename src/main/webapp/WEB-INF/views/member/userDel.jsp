<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<input type="submit" value="탈퇴" /> <input type="reset" value="취소"
					onclick="$('#del_pwd').focus();" />
			</div>
		</form>
	</div>
<jsp:include page="../subfooter.jsp" />
</body>
</html>