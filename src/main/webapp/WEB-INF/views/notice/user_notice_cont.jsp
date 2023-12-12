<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="../header.jsp" />

		<h2 class="gtitle">공지내용</h2>
		<table id="gtable">
			<tr>
				<th>제목</th>
				<td>${n.ntitle}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${ncont}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${n.nhit}</td>
			</tr>
		</table>
		<div id="nmenu">
			<input type="button" id="gbutton" class="btn btn-dark" value="공지목록" onclick="location='user_notice_list';" />
		</div>
	
<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>