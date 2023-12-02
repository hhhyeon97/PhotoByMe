<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:if test="${!empty id}">
		<%--로그인 이후 화면 --%>
		<div id="Index_wrap">
			<h2 class="Index_title">로그인 후 메인화면</h2>
			<form method="post" action="member_logout">
				<table id="Index_t">
					<tr>
						<th><input type="button" value="정보수정"
							onclick="location='member_edit';" /> <input type="button"
							value="회원탈퇴" onclick="location='member_del';" /> <input
							type="submit" value="로그아웃" /></th>
					</tr>
					<tr>
						<th>${id}님로그인을 환영합니다.</th>
					</tr>
				</table>
			</form>
		</div>
	</c:if>
</body>
</html>