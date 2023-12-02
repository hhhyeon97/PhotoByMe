<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<%
    String mname = request.getParameter("mname"); // 여기에서 mname 값을 얻어옴, 예를 들어 request.getParameter("mname");
%>
<div class="container">
        <h1>회원가입 ⌯'▾'⌯</h1>
        <form action="join_ok" id="join_form" method="post" onsubmit="return write_check();">
            <div class="neu-input">
                <input type="text" class="id_input" id="mid" name="mid" placeholder="아이디">
                        <input type="button" value="아이디중복체크"
						class="input_b" onclick="id_check();"><br /> <span
						id="idcheck"></span>
            
            </div>
            
            
            
            
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
            <span class="id_input_re_3">아이디가 짧습니다.(4자 이상 필수)</span>
            <span class="id_input_re_4">아이디 형식을 초과했습니다.(4~12자 사이)</span>
            <span class="id_input_re_5">공백이 들어가면 안 됩니다.</span>
            <div class="neu-input">
                <input type="password" class="password_input" id="mpw" name="mpw" placeholder="비밀번호 (대문자/특수문자 포함 8자 이상)">
            </div>
            <div class="neu-input">
                <input type="text" name="mname" placeholder="이름">
            </div>
            
            <!-- 메일 부분 시작 -->
             <div class="neu-input" style="display: flex; align-items: center;">
    			<input type="text" size="14" name="memail" id="memail" class="input_box" placeholder="이메일">
    			<span>@</span>
    			<input type="text" name="memail2" id="memail2" size="18" class="input_box" placeholder="도메인"/>
    		<%-- <select name="mail_list" onchange="domain_list();">
        		<c:forEach var="mail" items="${email}">
            <option value="${mail}">${mail}</option>
        		</c:forEach>
    		</select> --%>
				</div>
           
 <!--            <div class="mail_check_wrap">
            	<div class="mail_check_input_box" id="mail_check_input_box_false">
            	<input class="mail_check_input_box" disabled="disabled" placeholder="인증번호 입력">
            	</div>
            <div class="mailbutton">
            	<button>인증번호 전송</button>
            </div>
            <div class="clearfix"></div>
            </div>
            </div> -->
            <!-- 메일 부분 끝  -->
            
            <div class="neu-button">
                <input type="submit" size="10" class="join_button" id="join_Button" value="가입하기">
                <input type="reset" value="취소" onclick="$('#mid').focus();" />
            </div>

            
            
        </form>
    </div>
<jsp:include page="../footer.jsp" /> 

<script>
<%-- document.addEventListener("DOMContentLoaded", function() {
    var join_Button = document.getElementById("join_Button");
    var mname = '<%= mname %>';
    console.log('mname:', mname);

    join_Button.addEventListener("click", function() {
        var welcomeMessage = mname ? mname + '님, 회원가입을 축하합니다!' : '회원가입을 축하합니다!';
        alert(welcomeMessage);
    });
});
 --%>

//정규표현식
function validate_userid($mid)
{
	var idPattern = /^[a-zA-Z0-9]{4,12}$/;//아이디를 영문소문
  //자와 숫자 와 _조합으로 처리
	return idPattern.test(mid);
};





<!-- //중복아이디 검색
function id_check(){
 /* copy begin */
	$("#idcheck").hide();
	//아이디 영역을 숨김
	var $mid = $.trim($("#mid").val());
	
	//1.입력글자 길이 체크
	if($mid.length < 4){
		$newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mid").val('').focus();
		return false;
	};
	if($mid.length > 12){
		$newtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
		$("#idcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#idcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#idcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mid").val('').focus();
		return false;
	};
	//2.입력글자 확인
	if(!(validate_userid($mid))){
		$newtext='<font color="red" size="3"><b>아이디는 영문소문자,숫자,_조합만 가능합니다.</b></font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append($newtext);
		$("#mid").val('').focus();
		return false;
	};
	//아이디 중복확인
    $.ajax({//$는 jQuery란 뜻. $.ajax 뜻은 jQuery 내의 아작스 실행
        type:"POST",//데이터를 서버로 보내는 방법
       //url:"./member/member_idcheck.jsp",    
        url: "/memberIdChk", //url 패턴 매핑주소 경로
        data: {"mid":$mid},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 자료형
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
        	//서버 데이터를 data변수에 저장
      	  if(data==1){//중복 아이디가 있다면
      		$newtext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
      		$("#idcheck").text('');
        	$("#idcheck").show();
        	$("#idcheck").append($newtext);          		
          	$("#mid").val('').focus();
          	return false;
	     
      	  }else{//중복 아이디가 아니면
      		$newtext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append($newtext);
      		$("#mpw").focus();
      	  }  	    	  
        },
    	  error:function(){//비동기식 아작스로 서버DB 데이터를
    		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
    		  alert("data error");
    	  }
      });//$.ajax
 /* end */	
}
</script> -->

<!-- <script>
// 메일 주소 선택과 직접 입력
function domain_list() {
    var num = m.mail_list.selectedIndex; // 선택한 목록 항목 번호
    if (num == -1) { // 목록이 선택되지 않았을때 실행
        return true;
    }

    // 도메인 입력란과 도메인 선택 목록 가져오기
    var domainInput = m.memail2;
    var selectedDomain = m.mail_list.value;

    if (selectedDomain == "직접입력") {
        domainInput.value = "";
        domainInput.readOnly = false; // 쓰기 가능
        domainInput.focus(); // 입력박스로 포커스 이동
    } else {
        domainInput.value = m.mail_list.options[num].value; // 수정된 부분
        domainInput.readOnly = true; // 읽기 전용
    }
}
</script> -->

</body>
</html>