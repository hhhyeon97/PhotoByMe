<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="/css/join.css">
<!-- jQuery cdn 최신 버전 소스 -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />

<div class="container">
        <h1>회원가입 ⌯'▾'⌯</h1>
        <form action="join_ok.jsp" id="join_form" method="post">
            <div class="neu-input">
                <input type="text" name="mid" id="text" placeholder="아이디">
            </div>
            <div class="neu-input">
                <input type="password" name="mpw" placeholder="비밀번호">
            </div>
            <div class="neu-input">
            	<input type="password" name="mpw" placeholder="비밀번호 재확인">
            </div>
            <div class="neu-input">
                <input type="text" name="mname" placeholder="이름">
            </div>
             <div class="neu-input">
                <input type="text" name="memail" placeholder="이메일">
            </div>
             <div class="neu-input">
                <input type="text" name="mAddr1">
            </div>
             <div class="neu-input">
                <input type="text" name="mAddr2">
            </div>
             <div class="neu-input">
                <input type="text" name="mAddr3">
            </div>
            <div class="neu-button">
                <input type="button" class="join_button" value="가입하기">
            </div>
        </form>
    </div>
<jsp:include page="../footer.jsp" /> 

<script>

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		$("#join_form").attr("action", "/member/join");
		$("#join_form").submit();
	});
});

</script>  
</body>
</html>