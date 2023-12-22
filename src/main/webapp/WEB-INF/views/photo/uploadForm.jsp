<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/member.js"></script>
<style>
/* 	body{
		display: flex;
		justify-content: center;
		align-items: center;
		height:300px;
		line-height: 300px;
	} */
</style>
</head>
<body>
 <form method="post" enctype="multipart/form-data">
    <ul>
      <li>상품명 <input type="text" name="itemName"></li>
      <li>파일<input type="file" name="file" ></li>
    </ul>
    <input type="submit"/>
  </form>
  
<!--  <a href="/upload">스프링 파일 업로드</a>-->
<!-- <form action="/file/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload" />
</form> -->
<!-- <form method="post" action="upload_ok"
         onsubmit="return write_check();" enctype="multipart/form-data">
          <table>
            <tr>
               <th>사진 제목</th>
               <td>
               <input type="text" name="ptitle" id="ptitle" required />
               </td>
            </tr>
            <tr>
               <th>파일첨부</th>
               <td>
               <input type="file" name="purl" id="purl" required />
               </td>
            </tr>
         </table>
    등록 버튼
     <input type="submit" value="Upload Photo" /> 
     <input type="reset" value="취소" onclick="$('#ptitle').focus();"> 
</form> -->
</body>
</html>