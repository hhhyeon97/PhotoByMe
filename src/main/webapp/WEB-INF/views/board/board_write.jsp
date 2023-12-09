<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="/js/check.js"></script>
<jsp:include page="../header.jsp" />
<section>
<h2>문의 게시판</h2>
<form name="frm" method="post" action="board_write_ok"
style="display: flex;
    justify-content: center;
    align-items: center;
    text-align: center; margin-top:50px;">
<table border="1">
	<tr style="width:250px;">
		<td>작성자 </td>
		<td><input type="text" name="bname" id="bname"></td>
	</tr>
	<tr style="width:250px;">
		<td>제목</td>
		<td><input type="text" name="btitle" id="btitle"></td>
	</tr>
	<tr style="width:250px;">
		<td>내용 </td>
		<td><textarea name="bcont" id="bcont"></textarea></td>
	</tr>	
	
</table>
</form>
	<input type="button" class="btn btn-secondary" value="등록" onclick="add()">
	<input type="button" class="btn btn-secondary" value="취소" onclick="res()">
	<input type="button" class="btn btn-secondary" value="목록" onclick="location='board_list?page=${page}';" />
</section>
<footer style="position:fixed; bottom:150px;
left:0px; width:100%; height:30px;
line-height:30px; background-color:white;
text-align:center;">
<jsp:include page="../footer.jsp" />
</footer>
</body>
</html>