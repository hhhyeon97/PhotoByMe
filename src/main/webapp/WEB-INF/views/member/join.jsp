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
        <form action="join_ok" id="join_form" method="post" onsubmit="return write_check();">
            <div class="neu-input">
                <input type="text" class="id_input" id="id_input" name="mid" oninput="nothangleid()" placeholder="아이디">
            <!--<button type="button" onclick="checkDuplicateId()">아이디 중복 체크</button>  -->
            </div>
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
            <span class="id_input_re_3">아이디가 짧습니다.(4자 이상 필수)</span>
            <span class="id_input_re_4">아이디 형식을 초과했습니다.(4~12자 사이)</span>
            <span class="id_input_re_5">공백이 들어가면 안 됩니다.</span>
            <div class="neu-input">
                <input type="password" class="password_input" id="password_input" name="mpw" placeholder="비밀번호 (대문자/특수문자 포함 8자 이상)">
            </div>
            <div class="neu-input">
                <input type="text" name="mname" placeholder="이름">
            </div>
             <div class="neu-input">
                <input type="text" name="memail" placeholder="이메일">
            </div>
            <div class="neu-button">
                <input type="submit" class="join_button" value="가입하기">
            </div>
        </form>
    </div>
<jsp:include page="../footer.jsp" /> 

<script>

function nothangleid() {
    // 아이디 입력 필드의 값을 가져옵니다.
    var idField = document.getElementById("id_input");
    var id = idField.value;

    // 정규 표현식을 사용하여 한글이 포함되어 있는지 확인합니다.
    var pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    if (pattern.test(id)) {
        // 한글이 포함되어 있으면 경고창을 표시합니다.
        alert("아이디에는 한글을 사용할 수 없습니다.");
        // 입력 필드를 초기화합니다.
        idField.value = "";
        // 입력 필드로 포커스를 돌려줍니다.
        idField.focus();
    }
    
    
    // 정규 표현식을 사용하여 특수문자가 포함되어 있는지 확인합니다.
    var pattern = /[!@#%^&*()_+|~\-+=]/; // 원하는 특수문자 패턴을 추가하세요

    if (pattern.test(id)) {
        // 특수문자가 포함되어 있으면 경고창을 표시합니다.
        alert("아이디에 특수문자를 사용할 수 없습니다.");
        // 입력 필드를 초기화합니다.
        idField.value = "";
        // 입력 필드로 포커스를 돌려줍니다.
        idField.focus();
    }
    
    
}



/*1차*/
function isValidId(id) {
    // 아이디 형식 검증을 위한 정규 표현식
    var idPattern = /^[a-zA-Z0-9]{4,12}$/;
    return idPattern.test(id);
}

/* 2차 특수문자 검증 추가 
function isValidId(id) {
    // 아이디 형식 및 특수문자 검증을 위한 정규 표현식
    var idPattern = /^[a-zA-Z0-9!@#%^&*()_+|~\-+=]{4,12}$/;
    return idPattern.test(id);
}
*/

/* 3차 빈 공백 추가 
function isValidId(id) {
    var idPattern = /^[a-zA-Z0-9!@#%^&*()_+|~\-+=\s]{4,12}$/;
    return idPattern.test(id);
}
*/

function isValidEmail(email) {
    // 간단한 이메일 형식 검증 로직 (개선 가능)
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailPattern.test(email);
}

//비밀번호 조건  8자리 이상/숫자 포함/영대 문자 포함/영소 문자 포함/특수문자 포함
function pwValid(password){
    var pwpat = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	return pwpat.test(password);
}
</script>


<script>
//함수를 별도로 정의하여 아이디 유효성 검증 및 중복 검사에 사용
function validateId() {
    var mid = $('.id_input').val();
    
    
    // 0. 공백 검증
    if (mid.includes(' ')) {
        $('.id_input_re_1').css("display", "none");
        $('.id_input_re_2').css("display", "none");
        $('.id_input_re_3').css("display", "none");
        $('.id_input_re_4').css("display", "none");
        $('.id_input_re_5').css("display", "inline-block");
        return;
    }
    // 1. 아이디 길이 검증
    if (mid.length < 4) {
        $('.id_input_re_1').css("display", "none");
        $('.id_input_re_2').css("display", "none");
        $('.id_input_re_3').css("display", "inline-block");
        $('.id_input_re_4').css("display", "none");
        $('.id_input_re_5').css("display", "none");
        return;
    }else if(mid.length >12){
    	$('.id_input_re_1').css("display", "none");
    	$('.id_input_re_2').css("display", "none");
    	$('.id_input_re_3').css("display", "none");
        $('.id_input_re_4').css("display", "inline-block");
        $('.id_input_re_5').css("display", "none");

        return;
    }

    // 2. 아이디 유효성 검증
    if (!isValidId(mid)) {
        $('.id_input_re_1').css("display", "none");
        $('.id_input_re_2').css("display", "inline-block");
        $('.id_input_re_3').css("display", "none");
        $('.id_input_re_4').css("display", "none");
        return;
    }

    // 3. 아이디 중복 여부 검사 (Ajax 요청)
    var data = { mid: mid };
    $.ajax({
        type: "post",
        url: "/member/memberIdChk",
        data: data,
        success: function (result) {
            if (result != 'fail') {
                $('.id_input_re_1').css("display", "inline-block");
                $('.id_input_re_2').css("display", "none");
                $('.id_input_re_3').css("display", "none");
                $('.id_input_re_4').css("display", "none");
                $('.id_input_re_5').css("display", "none");
               
                
            } else {
                $('.id_input_re_1').css("display", "none");
                $('.id_input_re_2').css("display", "inline-block");
                $('.id_input_re_3').css("display", "none");
                $('.id_input_re_4').css("display", "none");
                $('.id_input_re_5').css("display", "none");
               
                
            }
        }
    });
}
function write_check() {
    var mid = document.forms["join_form"]["mid"].value;
    var mpw = document.forms["join_form"]["mpw"].value;
    var mname = document.forms["join_form"]["mname"].value;
    var memail = document.forms["join_form"]["memail"].value;
    
    if (mid === "") {
        alert("아이디를 입력하세요.");
        return false;
    }
    
    // 아이디 형식 검증 (4~12자, 영문 대/소문자와 숫자로만 구성)
    if (!isValidId(mid)) {
        alert("올바른 아이디 형식을 입력하세요.");
        return false;
    }
        
    if (mpw === "") {
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호 형식 검증
    if(!pwValid(mpw)){
    	alert("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
    	return false;
    }
   

    if (mname === "") {
        alert("이름을 입력하세요.");
        return false;
    }

    if (memail === "") {
        alert("이메일을 입력하세요.");
        return false;
    }

    // 이메일 형식 검증
    if (!isValidEmail(memail)) {
        alert("올바른 이메일 주소를 입력하세요.");
        return false;
    }

    
    // 특수문자 검증 
     if (!idPattern.test(id)) {
        // 아이디에 특수문자가 포함되어 있으면 경고창 표시
        alert("아이디에 특수문자를 사용할 수 없습니다.");
        return false;
    }
    
   
    return true;
     
    
    
    
}



// 이벤트 리스너를 등록하여 입력란 변경 시 validateId 함수 호출
$('.id_input').on("propertychange change keyup paste input", function () {
    validateId();
});


</script>

</body>
</html>