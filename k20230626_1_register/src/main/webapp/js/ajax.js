//	비밀번호가 일치하는가 확인하는 함수
function passwordCheckFunction() {
	let userPassword1 = $('#userPassword1').val();
	let userPassword2 = $('#userPassword2').val();
	if(userPassword1 != userPassword2) {
		$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');

	} else {
		$('#passwordCheckMessage').html('');
	
	}
}
