<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
div{
	display:flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}
</style>
<script type="text/javascript" src="/js/check.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div>
<h2>공지사항 작성</h2>
<form name="frm2" method="post" action="notice_write_ok">
<table>
<tr>
	<td> 작성자 </td>
	<td> <input type="text" name="nname" id="nname"></td>
</tr>

<tr>
	<td> 비밀번호 </td>
	<td> <input type="password" name="npwd" id="npwd"size="14" /></td>
</tr>

<tr>
	<td> 제목</td>
	<td> <input type="text" name="ntitle" id="ntitle" ></td>
</tr>

<tr>
	<td> 내용 </td>
	<td> <textarea name="ncont" id="ncont" ></textarea></td>
</tr>


</table>
</form>

<input type="button" class="btn btn-secondary" value="등록" onclick="add2()">
	<input type="button" class="btn btn-secondary" value="취소">
	<input type="button" class="btn btn-secondary" value="목록" onclick="location='notice_list?page=${page}';" />

</div>
<jsp:include page="../footer.jsp" />
</body>
</html>