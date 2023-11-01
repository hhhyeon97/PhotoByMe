/**
 * join.js : 회원가입 유효성 검증 11/02
 */
 

function write_check(){
   if($.trim($("#mid").val())==""){
      alert("아이디를 입력하세요!");
      $("#mid").val("").focus();
      return false;
   }
   if($.trim($("#mpw").val())==""){
      alert("비밀번호를 입력하세요!");
      $("#mpw").val("").focus();
      return false;
   }
   if($.trim($("#mname").val())==""){
      alert("이름을 입력하세요!");
      $("#mname").val("").focus();
      return false;
   }
    if($.trim($("#memail").val())==""){
      alert("이메일을 입력하세요!");
      $("#memail").val("").focus();
      return false;
   }

}

   
   