<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="wrapper">
		<h2>게시판 수정폼</h2>
		<form method="post" action="board_edit_ok"
			onsubmit="return bw_check();">
			<input type="hidden" name="bno" value="${b.bno}" /> <input
				type="hidden" name="page" value="${page}" />
			<table id="board_edit">
				<tr>
					<th>이름</th>
					<td><input name="bname" id="bname" size="14"
						value="${b.bname}" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="btitle" id="btitle" size="35"
						value="${b.btitle}" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bcont" id="bcont" rows="9" cols="36">${b.bcont}</textarea></td>
				</tr>
			</table>
			<div id="editmenu">
				<input type="submit" value="수정" /> <input type="reset" value="취소"
					onclick="$('#bname').focus();" /> <input type="button" value="목록"
					onclick="location='board_list?page=${page}';" />
			</div>
		</form>
	</div>
</body>
</html>