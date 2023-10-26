<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet" href="css/join.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
        <h1>회원가입 ⌯'▾'⌯</h1>
        <form>
            <div class="neu-input">
                <input type="text" placeholder="이름">
            </div>
            <div class="neu-input">
                <input type="text" id="text" placeholder="아이디">
            </div>
            <div class="neu-input">
                <input type="password" placeholder="비밀번호">
            </div>
            <div class="neu-input">
            	<input type="password" placeholder="비밀번호 재확인">
            </div>
            <div class="neu-button">
                <button onclick="validateEmail()">회원 가입</button>
            </div>
            
        </form>
    </div>
<jsp:include page="footer.jsp" />   
</body>
</html>