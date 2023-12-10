<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="wrapper">
		<h2>게시판 댓글</h2>
		<form method="post" action="board_reply_ok"
			onsubmit="return reply_check();">
			<%--답변글 히든값 --%>
			<input type="hidden" name="bref" value="${b.bref}" />
			<%--원본글과 답변글을 묶어주는 그룹 번호값 --%>
			<input type="hidden" name="bstep" value="${b.bstep}" />
			<%-- 원본글이면 0,첫번째 답변글이면 1,즉 원본글과 답변글을 구분하는 번호값이면서 몇번째 답변글인가를 알려줌. --%>
			<input type="hidden" name="blevel" value="${b.blevel}" />
			<%--답변글 정렬순서 --%>
			<%-- 페이징 히든값 --%>
			<input type="hidden" name="page" value="${page}" />

			<table id="reply_table">
				<tr>
					<th>이름</th>
					<td><input name="bname" id="bname" size="14" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="btitle" id="btitle" size="35"
						value="Re:${b.btitle}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bcont" id="bcont" rows="9" cols="36"></textarea></td>
				</tr>
			</table>
			<div id="replymenu">
				<input type="submit" value="댓글등록" /> <input type="reset" value="취소"
					onclick="$('#bname').focus();" /> <input type="button" value="목록"
					onclick="location='board_list?page=${page}';" />
			</div>
		</form>
	</div>
</body>
</html>