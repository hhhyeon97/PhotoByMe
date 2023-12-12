<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
<jsp:include page="../header.jsp" />
	<div id="del_wrap">
		<h2>게시판 삭제</h2>
		<form method="post" action="board_del_ok">
			<input type="hidden" name="bno" value="${b.bno}" /> <input
				type="hidden" name="page" value="${page}" />

			<div id="delmenu">
				<input type="submit" onclick="del()" value="삭제" /> <input
					type="reset" value="취소"/> <input
					type="button" value="목록"
					onclick="location='board_list?page=${page}';" />
			</div>
		</form>
	</div>
<jsp:include page="../subfooter.jsp" />	
</body>
</html>