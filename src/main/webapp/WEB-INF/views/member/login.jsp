<%@ page contentType="text/html; charset=UTF-8"%>
<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
			<button type="button" class="btn" id="joinBtn">회원가입</button>
		</div>
	</div>
	</form>

	<%-- <!-- 로그인 폼 수정 중  -->
	<!--<c:if test="${empty mid}">-->
		로그인 전 화면
		<div id="Login_wrap">
			<h2 class="Login_title">로그인 폼</h2>
			<form method="post" action="login_ok"
				onsubmit="return login_check();">
				<table id="Login_t">
					<tr>
						<th>아이디</th>
						<td><input name="mid" id="mid" size="14" tabindex="1" /> tabindex="1"로 설정하면 탭키를 눌렀을
     때 첫번째로 포커스를 가진다.</td>
						<th rowspan="2">
							rowspan="2" 2개행을 합침 <input type="submit" value="로그인" />
						</th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="mpw" id="mpw" size="14"
							tabindex="2" /></td>
					</tr>
				</table>
				<div id="Login_menu">
					<c:if test="${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>
					<input type="button" value="비번찾기" onclick="pwd_find();" /> <input
						type="button" value="회원가입" onclick="location='/member/join';" />
				</div>
			</form>
		</div> --%>
	<!--</c:if>-->
	<%-- <c:if test="${!empty mid}">
		로그인 이후 화면
		<div id="Index_wrap">
			<h2 class="Index_title">로그인 후 메인화면</h2>
			<form method="post" action="member_logout">
				<table id="Index_t">
					<tr>
						<th><input type="button" value="정보수정"
							onclick="location='member_edit';" /> <input type="button"
							value="회원탈퇴" onclick="location='member_del';" /> <input
							type="submit" value="로그아웃" /></th>
					</tr>
					<tr>
						<th>${mid}님로그인을환영합니다.</th>
					</tr>
				</table>
			</form>
		</div>
	</c:if> --%>

	<!-- 로그인 폼 끝  -->

	<script>
		var id = document.getElementById('userID');
		var pw = document.getElementById('userPW');
		var loginBtn = document.getElementById('loginBtn');
		var joinBtn = document.getElementById('joinBtn');

		joinBtn.addEventListener('click', function() {
		    window.location.href = '/member/join';
		});
		
		// 로그인 유효성 체크 바리데이션
		function login_check() {
			if (!mid.value) {
				alert('아이디를 입력해주세요.');
				mid.focus();
				return;
			}
			if (!mpw.value) {
				alert('비밀번호를 입력해주세요.');
				mpw.focus();
				return;
			}
		}
	</script>


	<jsp:include page="../footer.jsp" />
</body>
</html>