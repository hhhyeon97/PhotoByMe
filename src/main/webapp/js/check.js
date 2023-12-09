/**
 * 
 */
 
function add(){

	if(frm.bname.value.length==0){
		alert("작성자 이름을 입력해주세요!");
		frm.bname.focus();
		return false;
	}
	else if(frm.btitle.value.length==0){
	alert("제목을 입력해주세요!");
	frm.btitle.focus();
	return false;
	}
	else if(frm.bcont.value.length==0){
	alert("내용을 입력해주세요!");
	frm.bcont.focus();
	return false;
	}
	else {
		alert("등록되었습니다!");
		document.frm.submit();
		return true;
	}
}

function res(){
	alert("다시 입력하겠습니다!");
	document.frm.reset();
	frm.bname.focus();
}

