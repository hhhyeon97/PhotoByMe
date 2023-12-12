<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="../header.jsp" />

			<h2 id="headgong">공지사항</h2>
			<hr id="notice_hr">
			<table id="notice">
				<tr>
					<th>제목</th>
					<th>날짜</th>
				</tr>
				<c:if test="${!empty nlist}">
					<c:forEach var="n" items="${nlist}">
						<tr>
							<th><a href="user_notice_cont?nno=${n.nno}"> <c:if
										test="${fn:length(n.ntitle)>16}">
       ${fn:substring(n.ntitle,0,16)}...
      </c:if> <c:if test="${fn:length(n.ntitle)<16}">
      ${n.ntitle}
      </c:if>
							</a></th>
							<th>${n.ndate}</th>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty nlist}">
					<tr>
						<th colspan="2">공지 목록이 없습니다!</th>
					</tr>
				</c:if>

			</table>
	<jsp:include page="../footer.jsp" />
	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>



</body>
</html>