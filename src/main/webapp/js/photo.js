/**
 * 
 */
function write_check(){
	if($.trim($("#ptitle").val())==""){
		alert("사진 제목을 입력하세요!");
		$("#ptitle").val("").focus();
		return false;
	}
}