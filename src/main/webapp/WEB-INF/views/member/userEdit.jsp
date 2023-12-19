<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="/js/member.js"></script>
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
<div id="mJoin_wrap">
		<h2 class="mJoin_title">회원수정</h2>
		<form name="m" method="post" action="user_edit_ok"
			onsubmit="return edit_check();">
			<table id="mJoin_t">
				<tr>
					<th>회원아이디</th>
					<td>${mid}</td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" name="mpw" id="mpw"
						size="14" class="input_box" /></td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password" name="mpw2" id="mpw2"
						size="14" class="input_box" /></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name="mname" id="mname" size="14"
						class="input_box" value="${em.mname}"/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
					<input type="text" size="14" name="memail" id="memail" class="input_box" value="${em.memail}">
    			<span>@</span>
    			<input type="text" name="memail2" id="memail2" size="18" class="input_box" value="${em.memail2}"/>
					</td>
				</tr>
			</table>
			<div id="mJoin_menu">
				<input type="submit" value="수정" class="btn btn-dark" />
				 <input type="reset" value="취소" class="btn btn-dark" onclick="$('#mpw').focus();" />
			</div>
		</form>
	</div>
		<jsp:include page="../subfooter.jsp" />
</body>
</html>