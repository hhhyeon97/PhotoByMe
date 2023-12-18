<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>회원가입</title>
<link rel="stylesheet" href="/css/join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
<script type="text/javascript" src="/js/member.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="container">
        <h1>회원가입 ⌯'▾'⌯</h1>
        <form action="join_ok" id="join_form" name="m" method="post">
            <div class="neu-input">
                <input type="text" class="id_input" id="mid" name="mid" placeholder="아이디">
						<input type="button" value="아이디중복체크"
						id="checkbtn" onclick="id_check();">
				<br><span id="idcheck"></span>
            </div>
            <div class="neu-input">
                <input type="password" class="password_input" id="mpw" name="mpw" placeholder="비밀번호 (대문자/특수문자 포함 8자 이상)">
            </div>
            <div class="neu-input">
                <input type="text" name="mname" id="mname" placeholder="이름">
            </div>
            <!-- 메일 부분 시작 -->
             <div class="neu-input" style="display: flex; align-items: center;">
    			<input type="text" size="14" name="memail" id="memail" class="input_box" placeholder="이메일">
    			<span>@</span>
    			<input type="text" name="memail2" id="memail2" size="18" class="input_box" placeholder="도메인"/>
			</div>
        </form>
         <div class="neu-button">
                <input type="submit"  class="join_button" id="join_Button" value="가입하기" onclick="join_check()" />
       			<input type="reset" value="취소"  class="join_button" id="resetbtn" onclick="$('#mid').focus();" />
            </div>
    </div>
<jsp:include page="../footer.jsp" />
</body>
</html>