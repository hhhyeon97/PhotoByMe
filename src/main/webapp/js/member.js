



function join_check(){
	if($.trim($("#mid").val())==""){
		alert("회원아이디를 입력하세요!");
		$("#mid").val("").focus();
		return false;
	}
	else if($.trim($("#mpw").val())==""){
		alert("비번을 입력하세요!");
		$("#mpw").val("").focus();
		return false;
	}
	else if($.trim($("#mname").val())==""){
		alert("회원이름을 입력하세요!");
		$("#mname").val("").focus();
		return false;
	}
	else if($.trim($("#memail").val())==""){
		alert("이메일을 입력하세요!");
		$("#memail").val("").focus();
		return false;
	}
	else if($.trim($("#memail2").val())==""){
		alert("도메인을 입력하세요!");
		$("#memail2").val("").focus();	
		return false;
	}
	else {
		// 중복 아이디 검사가 성공적으로 이루어졌을 때만 폼을 제출
		if ($("#idcheck").text() === '사용 가능한 아이디입니다.') {
			alert("회원가입에 성공하였습니다!");
			document.m.submit();
			return true;
		} else {
			alert("아이디 중복검사를 먼저 진행해주세요.");
			return false;
		}
	}
}
//중복아이디 검색
function id_check(){
	$("#idcheck").hide();
	//아이디 영역을 숨김
	$mid=$.trim($("#mid").val());
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
      url:"idCheck", //url 패턴 매핑주소 경로
      data: {"id":$mid},  //좌측 id 피라미터 이름에 우측 $mid변수값을 저장
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
    		$newtext='<font color="blue" size="3"><b>사용 가능한 아이디입니다.</b></font>';
    		$("#idcheck").text('');
    		$("#idcheck").show();
    		$("#idcheck").append($newtext);
    		$("#mpw").focus();
    	  }  	    	  
      },
  	  error:function(){//비동기식 아작스로 서버디비 데이터를
  		  //못가져와서 에러가 발생했을 때 호출되는 함수이다.
  		  alert("data error");
  	  }
    });//$.ajax
/* end */	
}

//정규표현식
function validate_userid($mid)
{
var pattern= new RegExp(/^[a-z0-9_]+$/);//아이디를 영문소문
//자와 숫자 와 _조합으로 처리
return pattern.test($mid);
};

//userEdit.jsp 유효성 검증
function edit_check(){

	$mpw=$.trim($("#mpw").val());
	$mpw2=$.trim($("#mpw2").val());
	if($mpw == ""){
		alert("비번을 입력하세요!");
		$("#mpw").val("").focus();
		return false;
	}
	if($mpw2 == ""){
		alert("비번확인을 입력하세요!");
		$("#mpw2").val("").focus();
		return false;
	}
	if($mpw != $mpw2){
		alert("비번이 다릅니다!");
		$("#mpw").val("");//비번 입력박스를 초기화
		$("#mpw2").val("");
		$("#mpw").focus();
		return false;
	}
	
	if($.trim($("#mname").val())==""){
		alert("회원이름을 입력하세요!");
		$("#mname").val("").focus();
		return false;
	}
	if($.trim($("#memail").val())==""){
		alert("이메일 아이디를 입력하세요!");
		$("#memail").val("").focus();
		return false;
	}
	if($.trim($("#memail2").val())==""){
		alert("이메일 도메인을 입력하세요!");	
		$("#memail2").val("").focus();	
		return false;
	}
}//edit_check()




