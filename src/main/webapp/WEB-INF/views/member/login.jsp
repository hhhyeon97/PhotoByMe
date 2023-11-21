<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="shortcut icon" href="/images/favicon.ico"/>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/css/login.css">


<script>
 function login_check(){
    if($.trim($("#login_id").val())==""){
       alert("로그인 아이디를 입력하세요!");
       $("#login_id").val("").focus();
       return false;
    }
    if($.trim($("#login_pwd").val())==""){
       alert("로그인 비번을 입력하세요!");
       $("#login_pwd").val("").focus();
       return false;
    }
 }//로그인 인증 유효성 검증
 
 //비번찾기
 function pwd_find(){
    $url="pwd_find";//매핑주소
    window.open($url,"비번검색","width=400px,height=300px"+
          ",scrollbars=yes");
    //open(공지창경로,공지창이름,속성) 메서드로 폭이 400픽셀,
    //높이가 300픽셀,스크롤바가 생성되는 새로운 공지창을 만든다.
 }
</script>
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

	
	<!-- <form name="welcome" method="post" class="login">
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
			<button type="button" class="btn" id="loginBtn" onclick="location='/';">로그인</button>
			<button type="button" class="btn" id="joinBtn" onclick="location='/member/join';">회원가입</button>
		</div>
	</div>
	</form> -->

	<!-- 로그인 폼 시작  -->
	<c:if test="${empty id}">
		<%--로그인 전 화면 --%>
			<form method="post" action="login_ok"
				onsubmit="return login_check();">
					<div class="container">
					<h1>로그인 ⌯'▾'⌯</h1>
						<div class="neu-input">
						<input name="mid" id="login_id" placeholder="아이디" size="14"
							tabindex="1" />
						<!-- tabindex="1"로 설정하면 탭키를 눌렀을 때 첫번째로 포커스를 가진다.-->
     					</div>
							
						<div class="neu-input">
						<input type="password" name="mpw" id="login_pwd"
							placeholder="비밀번호" size="14" tabindex="2" />
							</div>
				<div class="neu-button">
				<input type="submit" id="loginBtn" value="로그인" />
					<input type="button" class="btn" value="비번 찾기" onclick="pwd_find();" /> 
					<input type="button" class="btn" id="joinBtn" value="회원가입" onclick="location='/member/join';" />
				</div>
		</div>
		</form>
	</c:if>
	<c:if test="${!empty id}">
		<%--로그인 이후 화면 --%>
		<div id="Index_wrap">
			<h2 class="Index_title">로그인 후 메인화면</h2>
			<form method="post" action="member_logout">
						<input type="button" value="정보수정"
							onclick="location='member_edit';" /> <input type="button"
							value="회원탈퇴" onclick="location='member_del';" /> <input
							type="submit" value="로그아웃" />
						${id}님로그인을 환영합니다.
			</form>
		</div>
	</c:if>
	<!-- 로그인 폼 끝  -->
	
	
	

	<!-- <script>
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
	</script> -->


	<jsp:include page="../footer.jsp" />
</body>
</html>