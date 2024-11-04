$('#sign_up').on('click', function(event) {
    event.preventDefault(); // 기본 폼 제출 방지
	console.log("AJAX 요청 실행");
	
    $.ajax({
        url: 'join.do',
        type: 'post',
        dataType: 'json',
        data: {
            'user_id': $('#user_id').val(),
            'password': $('#password').val(),
            'name': $('#name').val(),
            'birthday': $('#birthday').val(),
            'gender': $('#gender').val(),
            'phone_number': $('#phone_number').val()
        },
        success: function(res) {
            // 요청이 성공했을 때 실행되는 함수
            console.log(res); // 서버의 응답을 콘솔에 출력
            alert("회원가입이 완료되었습니다."); // 성공 메시지 표시
        },
        error: function(xhr, status, error) {
            alert("회원가입 실패! 아이디가 중복입니다.")
        }
    });
});