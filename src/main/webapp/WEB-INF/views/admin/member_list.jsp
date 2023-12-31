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
	<form method="get" action="member_list">
		<h2>회원 관리</h2>
		<div>회원( ${listcount} )</div>
		<table id="bList_t">
			<tr>
				<th width="20%" height="26">아이디</th>
				<th width="16%">회원이름</th>
				<th width="16%">가입날짜</th>
				<th width="26%">수정/삭제</th>
			</tr>
			<c:if test="${!empty blist}">
				<c:forEach var="m" items="${blist}">
					<tr>
						<td align="center">${m.mid}</td>
						<td><a
							href="member_info?mid=${m.mid}&page=${page}&state=info">
								${m.mname}</a></td>
						<td align="center">${fn:substring(m.mdate,0,10)}</td>
						<td align="center"><input type="button" value="수정"
							onclick="location='member_info?mid=${m.mid}&page=${page}&state=edit';" />
							<input type="button" value="삭제"
							onclick="if(confirm('정말로 삭제할까요?') == true){location='member_del?mid=${m.mid}&page=${page}';}else{ return ;}" />
							<%-- confirm() 자바스크립트 함수(메서드)는 삭제 유무를 판단하는
확인/취소 버튼을 가진 경고창을 만들어 준다.확인을 클릭하면 true,
취소를 클릭하면 false를 반환 --%></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty blist}">
				<tr>
					<th colspan="5">회원목록이 없습니다!</th>
				</tr>
			</c:if>
		</table>

		<%--페이징 즉 쪽나누기 추가 --%>
		<div id="bList_paging">
			<%-- 검색전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name)}">
				<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
				<c:if test="${page>1}">
					<a href="member_list?page=${page-1}">[이전]</a>&nbsp;
    </c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
					<c:if test="${a != page}">
						<%--현재 페이지가 선택되지 않았
     다면 --%>
						<a href="member_list?page=${a}">[${a}]</a>&nbsp;
     </c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
				<c:if test="${page<maxpage}">
					<a href="member_list?page=${page+1}">[다음]</a>
				</c:if>
			</c:if>

			<%-- 검색후 페이징 --%>
			<c:if test="${(!empty find_field) || (!empty find_name)}">
				<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
				<c:if test="${page>1}">
					<a
						href="member_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
    </c:if>

				<%--현재 쪽번호 출력--%>
				<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
					<c:if test="${a == page}">
						<%--현재 페이지가 선택되었다면--%>
      <${a}>
     </c:if>
					<c:if test="${a != page}">
						<%--현재 페이지가 선택되지 않았
     다면 --%>
						<a
							href="member_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
				</c:forEach>

				<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
				<c:if test="${page<maxpage}">
					<a
						href="member_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
				</c:if>
			</c:if>
		</div>

		<div id="bList_menu">
			<c:if test="${(!empty find_field) && (!empty find_name)}">
				<input type="button" value="전체회원"
					onclick="location='member_list?page=${page}';" />
			</c:if>
		</div>

		<%--검색 폼추가 --%>
		<div id="bFind_wrap">
			<select name="find_field">
				<option value="mid"
					<c:if test="${find_field=='mid'}">
   ${'selected'}</c:if>>아이디</option>
				<option value="mname"
					<c:if test="${find_field=='mname'}">
   ${'selected'}</c:if>>회원이름</option>
			</select> <input name="find_name" id="find_name" size="14"
				value="${find_name}" /> <input type="submit" value="검색" />
		</div>
	</form>
</body>
</html>