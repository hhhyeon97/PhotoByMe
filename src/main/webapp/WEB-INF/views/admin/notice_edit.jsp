<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="../header.jsp" />
<%--관리자 메인 본문 --%>
  <div id="aMain_cont">
    <div id="aBw_wrap">
     <h2 class="aBw_title">관리자 공지 수정</h2>
     <form method="post" action="notice_edit_ok">
     <input type="hidden" name="nno" 
     value="${n.nno}" />
     <input type="hidden" name="page" value="${page}" />
     <table id="aBw_t">
    <tr>
     <th>이름</th>
     <td>
     <input name="nname" id="nname" size="14" 
     value="${n.nname}"/>
     </td>
    </tr>
    <tr>
     <th>제목</th>
     <td>
     <input name="ntitle" id="ntitle" size="35" 
     value="${n.ntitle}" />
     </td>
    </tr>
    <tr>
     <th>비밀번호</th>
     <td>
     <input type="password" name="npwd" id="npwd"
     size="14" />
     </td>    
    </tr>
    <tr>
     <th>내용</th>
     <td>
     <textarea name="ncont" id="ncont" rows="9"
     cols="36">${n.ncont}</textarea>
     </td>
    </tr>
   </table>
   <div id="aBw_menu">
    <input type="submit" value="수정" />
    <input type="reset" value="취소" 
    onclick="$('#nname').focus();" />
    <input type="button" value="목록"
    onclick="location='notice_list?page=${page}';" />
   </div>
     </form>
    </div>
  </div>
	<jsp:include page="../subfooter.jsp" />
</body>
</html>