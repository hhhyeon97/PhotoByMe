<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<style>
h2 {
	text-align: center;
}

form {
	display:flex;
	justify-content: center;
	align-items: center;
}

#listpaging{
	/* position:relative;
	bottom:15px; */
}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<section>
		<h2><strong>Q&A</strong> ( ${listcount} )</h2>
		<form method="get" action="board_list">
			<table border="1">

				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
				<c:if test="${!empty blist}">
					<c:forEach var="b" items="${blist}">
						<tr>
							<td align="center"><c:if test="${b.bstep == 0}">
									<%-- 원본글일때만 그룹번호가 출력 --%>
     							${b.bref}
    						</c:if></td>
							<td><c:if test="${b.bstep != 0}">
									<%--답변글일때만 실행--%>
									<c:forEach begin="1" end="${b.bstep}" step="1">
   									&nbsp;<%--답변글 들여쓰기 --%>
									</c:forEach>
									<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAIlJREFUSEvtk8ENgCAQBJfS7EQrMVaipViKnWjWHA8TvCPZ8CDhPjyAHZiDhMaVGudjAELDnqLbdksaB6DvHqwAtugKSpP5yi4Ak41FlgpgqAupAUQWMuQoKfMAO4C5Jt3WLAAI+ZTyS/NPpyKGn6XDqACGssm/pQCokCd3SwFE2e/8AISa+lf0AOoeGhnOOABkAAAAAElFTkSuQmCC"/>
									<%--답변글 이미지 출력부분 --%>
								</c:if> <a href="board_cont?no=${b.bno}&page=${page}&state=cont">
									${b.btitle}</a> <%-- board_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
													get방식으로 &구분하면서 전달된다. --%></td>
							<td align="center">${b.bname}</td>
							<td align="center">${fn:substring(b.bdate,0,10)}</td>
							<td align="center">${b.bhit}</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty blist}">
					<tr>
						<th colspan="5">목록이 없습니다!</th>
					</tr>
						</c:if>
					</table>


			<%--페이징 즉 쪽나누기 추가 --%>
			<div id="listpaging">
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page<=1}">
     			[이전]&nbsp;
    			</c:if>
					<c:if test="${page>1}">
						<a href="board_list?page=${page-1}">[이전]</a>&nbsp;
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
							<a href="board_list?page=${a}">[${a}]</a>&nbsp;
     					</c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    				[다음]
    				</c:if>
					<c:if test="${page<maxpage}">
						<a href="board_list?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page<=1}">
     				[이전]&nbsp;
    					</c:if>
					<c:if test="${page>1}">
						<a
							href="board_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   					 </c:if>

					<%--현재 쪽번호 출력--%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}">
							<%--현재 페이지가 선택되었다면--%>
      					<${a}>
     					</c:if>
						<c:if test="${a != page}">
							<%--현재 페이지가 선택되지 않았다면 --%>
							<a
								href="board_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     						</c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    				[다음]
    				</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="board_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>
	<div id="bmenu">
				<input type="button"  class="btn btn-secondary" value="글쓰기"
					onclick="location='board_write?page=${page}';" />
					<c:if test="${(!empty find_field) && (!empty find_name)}">
					<input type="button" class="btn btn-secondary" value="전체목록"
						onclick="location='board_list?page=${page}';" />
				</c:if>
			</div>

			<%--검색 폼추가 --%>
			<div id="bfind">
				<select name="find_field">
					<option value="btitle"
						<c:if test="${find_field=='btitle'}">
   ${'selected'}</c:if>>제목</option>
					<option value="bcont"
						<c:if test="${find_field=='bcont'}">
   ${'selected'}</c:if>>내용</option>
				</select> <input name="find_name" id="find_name" size="14"
					value="${find_name}" /> <input type="submit" value="검색" />
			</div>


		</form>
	</section>
	
<jsp:include page="../subfooter.jsp" />
</body>
</html>