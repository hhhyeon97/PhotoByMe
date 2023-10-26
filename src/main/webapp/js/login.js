/**
 * 
 */
 
 var id = document.getElementById('userID');
 var pw = document.getElementById('userPW');
 var loginBtn = document.getElementById('loginBtn');
 var joinBtn = document.getElementById('joinBtn');

  // 로그인 유효성 체크 바리데이션
  	function loginChk() {
     	if(!id.value){
         	alert('아이디를 입력해주세요.');
            id.focus();
            return;
           }
        if(!pw.value){
           alert('비밀번호를 입력해주세요.');
           pw.focus();
           return;
          }
        }