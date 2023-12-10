<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<title></title>
</head>
<body>
	<div id="cont_wrap">
		<h2>게시판 내용보기</h2>
		<table id="cont_table">
			<tr>
				<th>제목</th>
				<td>${b.btitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${bcont}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${b.bhit}</td>
			</tr>
		</table>
		<div id="cont_menu">
			<input type="button"  class="btn btn-secondary" value="답변"
				onclick="location=
'board_cont?no=${b.bno}&page=${page}&state=reply';" />
			<input type="button"  class="btn btn-secondary" value="수정"
				onclick="location=
'board_cont?no=${b.bno}&page=${page}&state=edit';" />
			<input type="button"  class="btn btn-secondary" value="삭제"
				onclick="location=
'board_cont?no=${b.bno}&page=${page}&state=del';" />
			<input type="button"  class="btn btn-secondary" value="목록"
				onclick="location='board_list?page=${page}';" />
		</div>
	</div>
</body>
</html>