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
<%--관리자 메인 본문 --%>
<div id="aMain_cont">
	<form method="get" action="admin_board_list">
		<div id="bList_wrap">
			<h2 class="bList_title">관리자 게시판 목록</h2>
			<div class="bList_count">글개수: ${listcount} 개</div>
			<table id="bList_t">
				<tr>
					<th width="6%" height="26">번호</th>
					<th width="34%">제목</th>
					<th width="14%">작성자</th>
					<th width="18%">작성일</th>
					<th width="10%">조회수</th>
					<th width="18%">수정/삭제</th>
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
								</c:if> <a
								href="admin_board_cont?no=${b.bno}&page=${page}&state=cont">
									<c:if test="${fn:length(b.btitle)>16}">
										<%-- 제목 문자열 길이가 16자를 초과하면 실행 --%>
 ${fn:substring(b.btitle,0,16)}...
 <%--제목을 16자까지만 출력하고 나머지는 ... 표시 --%>
									</c:if> <c:if test="${fn:length(b.btitle)<16}">
${b.btitle}
</c:if>
							</a> <%-- board_cont?no=번호&page=쪽번호&state=cont 3개의 인자값이
get방식으로 &구분하면서 전달된다. --%></td>
							<td align="center">${b.bname}</td>
							<td align="center">${fn:substring(b.bdate,0,10)}</td>
							<td align="center">${b.bhit}</td>
							<td align="center"><input type="button" value="수정"
								onclick="location=
'admin_board_cont?no=${b.bno}&page=${page}&state=edit';" />
								<input type="button" value="삭제"
								onclick="if(confirm('정말로 삭제할까요?') == true){
location=
'admin_board_del?no=${b.bno}&page=${page}';	
}else{ return ;}" />
								<%-- confirm() 자바스크립트 함수(메서드)는 삭제 유무를 판단하는
확인/취소 버튼을 가진 경고창을 만들어 준다.확인을 클릭하면 true,
취소를 클릭하면 false를 반환 --%></td>
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
			<div id="bList_paging">
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
					<c:if test="${page>1}">
						<a href="admin_board_list?page=${page-1}">[이전]</a>&nbsp;
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
							<a href="admin_board_list?page=${a}">[${a}]</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
					<c:if test="${page<maxpage}">
						<a href="admin_board_list?page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%-- 검색후 페이징 --%>
				<c:if test="${(!empty find_field) || (!empty find_name)}">
					<c:if test="${page<=1}">
     [이전]&nbsp;
    </c:if>
					<c:if test="${page>1}">
						<a
							href="admin_board_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
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
								href="admin_board_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
     </c:if>
					</c:forEach>

					<c:if test="${page >= maxpage}">
    [다음]
    </c:if>
					<c:if test="${page<maxpage}">
						<a
							href="admin_board_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
					</c:if>
				</c:if>
			</div>

			<div id="bList_menu">
				<input type="button" value="글쓰기"
					onclick="location='admin_board_write?page=${page}';" />
				<c:if test="${(!empty find_field) && (!empty find_name)}">
					<input type="button" value="전체목록"
						onclick="location='admin_board_list?page=${page}';" />
				</c:if>
			</div>

			<%--검색 폼추가 --%>
			<div id="bFind_wrap">
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
		</div>
	</form>
</div>
</body>
</html>