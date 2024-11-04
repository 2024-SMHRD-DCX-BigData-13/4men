// 이메일 중복체크
// >> 사용자가 입력한 이메일이 DB에 있는지 확인

// 1. 이벤트 걸어주기
const input = $('#user_id');

// change : input 태그 안의 값이 변하면 (radio, checkbox, select태그)
// input : input 태그에 입력 할 때마다

input.on("input", request);
console.log("AJAX 요청 실행");

function request() {
	
	// 2. 요청보내기
	$.ajax({
		url: 'check.do',
		type: 'get',
		data: {
			'user_id': input.val()
		},
		success: function(res) {

			const p = $('#result');

			if (res == 'true') {
				// $('선택자').html('html코드') : 내부 코드 덮어쓰기
				// $('선택자').css('속성명', '속성값') : 스타일 속성 값 조정
				p.html('사용가능한 아이디 입니다.').css('color','green');
			} else {
				p.html('중복된 아이디 입니다.').css('color','red');

			}

		}
	});
}