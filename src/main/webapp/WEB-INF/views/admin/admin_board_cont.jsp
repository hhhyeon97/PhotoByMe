<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
 <h2 class="abc_title">관리자 게시판 내용</h2>
  <table id="abc_t">
   <tr>
    <th>제목</th> <td>${b.btitle}</td>
   </tr>
   <tr>
    <th>내용</th> <td>${bcont}</td>
   </tr>
   <tr>
    <th>조회수</th> <td>${b.bhit}</td>
   </tr>
  </table>
  <input type="button" value="목록"
  onclick="location='admin_board_list?page=${page}';" />  
</body>
</html>