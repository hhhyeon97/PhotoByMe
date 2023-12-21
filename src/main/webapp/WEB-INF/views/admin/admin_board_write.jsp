<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 여기에 현재 관리자의 이름을 설정합니다.
    var adminName = "관리자";
    // input 요소에 값을 설정합니다.
    document.getElementById("bname").value = adminName;
});
</script>
</head>
<body>
     <h2>관리자 게시판 글쓰기</h2>
     <form method="post" action="admin_board_write_ok"
     onsubmit="return bw_check();">
     <table id="abtable">
    <tr>
     <th>이름</th>
     <td>
     <input name="bname" id="bname" size="14"/>
     </td>
    </tr>
    <tr>
     <th>제목</th>
     <td>
     <input name="btitle" id="btitle" size="35" />
     </td>
    </tr>
    <tr>
     <th>내용</th>
     <td>
     <textarea name="bcont" id="bcont" rows="9"
     cols="36"></textarea>
     </td>
    </tr>
   </table>
    <input type="submit" value="저장" />
    <input type="reset" value="취소" 
    onclick="$('#btitle').focus();" />
    <input type="button" value="목록"
    onclick="location='admin_board_list?page=${page}';" />
     </form>
</body>
</html>