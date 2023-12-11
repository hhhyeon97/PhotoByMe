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


function add2(){

	if(frm2.nname.value.length==0){
		alert("작성자 이름을 입력해주세요!");
		frm2.nname.focus();
		return false;
	}
	else if(frm2.npwd.value.length==0){
	alert("비번을 입력해주세요!");
	frm2.npwd.focus();
	return false;
	}
	
	else if(frm2.ntitle.value.length==0){
	alert("제목을 입력해주세요!");
	frm2.ntitle.focus();
	return false;
	}
	else if(frm2.ncont.value.length==0){
	alert("내용을 입력해주세요!");
	frm2.ncont.focus();
	return false;
	}
	else {
		alert("등록되었습니다!");
		document.frm2.submit();
		return true;
	}
}


function res2(){
	alert("다시 입력하겠습니다!");
	document.frm2.reset();
	frm2.nname.focus();
}
