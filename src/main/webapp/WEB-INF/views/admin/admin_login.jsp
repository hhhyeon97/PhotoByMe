<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title></title>
<script>
 function admin_check(){
    if($.trim($("#aid").val()) == ""){
       alert("관리자 아이디를 입력하세요!");
       $("#aid").val("").focus();
       return false;
    }
    if($.trim($("#apw").val()) == ""){
       alert("관리자 비밀번호를 입력하세요!");
       $("#apw").val("").focus();
       return false;
    }
 }
</script>
</head>
<body>
	<div id="aloginwrap">
		<h2 class="atitle">관리자 로그인</h2>
		<form method="post" action="admin_login_ok"
			onsubmit="return admin_check();">
			<table id="alogin_t">
				<tr>
					<th>관리자 아이디</th>
					<td><input name="aid" id="aid" size="14"
						tabindex="1" />
					</td>
					<th rowspan="2"><input type="submit" value="로그인" /></th>
				</tr>
				<tr>
					<th>관리자 비밀번호</th>
					<td><input type="password" name="apw" id="apw"
						size="14" tabindex="2" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>