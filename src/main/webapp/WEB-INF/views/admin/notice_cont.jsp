<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div id="n_cont">
 <div id="n_wrap">
  <h2 class="n_title">관리자 공지 내용</h2>
  <table id="n_table">
   <tr>
    <th>제목</th> <td>${n.ntitle}</td>
   </tr>
   <tr>
    <th>내용</th> <td>${n_cont}</td>
   </tr>
   <tr>
    <th>조회수</th> <td>${n.nhit}</td>
   </tr>
  </table>
  <div id="n_menu">
  <input type="button" value="목록"
  onclick="location='notice_list?page=${page}';" />  
  </div>
 </div>
</div>
</body>
</html>