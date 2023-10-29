<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="/css/login.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<!-- 1차 틀 -->
	<!-- 	<div class="container">
		<h1>로그인 ⌯'▾'⌯</h1>
		<form>
			<div class="neu-input">
				<input type="email" placeholder="아이디">
			</div>
			<div class="neu-input">
				<input type="password" placeholder="비밀번호">
			</div>
			<div class="neu-button">
				<button onclick="validateEmail()">로그인</button>
			</div>
		</form>
	</div> -->

<!-- 2차 틀 -->
	<form name="welcome" method="post" class="login">
		<div class="container">
		<h1>로그인 ⌯'▾'⌯</h1>
		<div class="neu-input">
			 <input type="text" id="userID" placeholder="아이디"
				onkeydown="if(event.keyCode == 13) loginChk()">
		</div>
		<div class="neu-input">
			 <input type="password" id="userPW" placeholder="비밀번호"
				onkeydown="if(event.keyCode == 13) loginChk()">
		</div>
		<div class="neu-button">
			<button type="button" class="btn" id="loginBtn" onclick="loginChk()">로그인</button>
			<button type="button" class="btn" id="joinBtn"><a href="./join">회원가입</a></button>
		</div>
	</div>
	</form>

	<script>
		var id = document.getElementById('userID');
		var pw = document.getElementById('userPW');
		var loginBtn = document.getElementById('loginBtn');
		var joinBtn = document.getElementById('joinBtn');

		// 로그인 유효성 체크 바리데이션
		function loginChk() {
			if (!id.value) {
				alert('아이디를 입력해주세요.');
				id.focus();
				return;
			}
			if (!pw.value) {
				alert('비밀번호를 입력해주세요.');
				pw.focus();
				return;
			}
		}
	</script>
<jsp:include page="../footer.jsp" />
</body>
</html>