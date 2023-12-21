<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2 class="amtitle">회원 정보 수정</h2>
	<form method="post" name="m" action="member_edit"
		onsubmit="return edit_check();">
		<table id="aMd_t">
			<tr>
				<th class="left_box">회원아이디</th>
				<td><input name="mid" size="14" value="${m.mid}" readonly /></td>
			</tr>
			<tr>
				<th class="left_box">비밀번호</th>
				<td><input type="password" name="mpw" id="mpw" size="14" /></td>
			</tr>
			<tr>
				<th class="left_box">비밀번호 확인</th>
				<td><input type="password" name="mpw2" id="mpw2" size="14" /></td>
			</tr>
			<tr>
				<th class="left_box">회원이름</th>
				<td><input name="mname" id="mname" size="14" value="${m.mname}" /></td>
			</tr>
			<tr>
				<th class="left_box">이메일</th>
				<td><input name="memail" id="memail" size="14"
					value="${m.memail}" />@<input name="memail2" id="memail2"
					size="12" value="${m.memail2}" readonly /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정" /> <input
					type="reset" value="취소" onclick="$('#mpw').focus();" /> <input
					type="button" value="회원목록"
					onclick="location='member_list?page=${page}';" /></th>
			</tr>
		</table>
	</form>
</body>
</html>