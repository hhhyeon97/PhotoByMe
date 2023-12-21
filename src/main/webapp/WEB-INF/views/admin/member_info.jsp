<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title></title>
</head>
<body>
  <h2 class="amtitle">회원정보</h2>
  <table id="amtable">
   <tr>
    <th>회원아이디</th> <td>${m.mid}</td>
   </tr>
   <tr>
    <th>회원이름</th> <td>${m.mname}</td>
   </tr>
   <tr>
    <th>이메일</th>
    <td>${m.memail}@${m.memail2}</td>
   </tr>   
   <tr>
    <th>가입날짜</th> <td>${m.mdate}</td>
   </tr>
  </table>
  <input type="button" value="회원목록"
  onclick="location='member_list?page=${page}';" />
</body>
</html>