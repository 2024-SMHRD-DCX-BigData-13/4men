$('#find_id').on('click', function(event) {
    event.preventDefault(); // 기본 폼 제출 방지
    console.log("AJAX 요청 실행");

    $.ajax({
        url: 'find.do',
        type: 'post',
        dataType: 'json',
        data: {
            'name': $('#name-find').val(),
            'birthday': $('#birthday-find').val(),
            'phone_number': $('#phone_number-find').val()
        },
        success: function(res) {
            console.log(res);  // 서버 응답을 콘솔에 출력
            if (res.result === true) {
                console.log(res.user_id);  // user_id 값을 확인

                // 새 창을 중앙에 위치시키고 열기
                const width = 400;
                const height = 300;
                const left = (window.screen.width - width) / 2;
                const top = (window.screen.height - height) / 2;

                let newWindow = window.open(
                    "goFindId.do?user_id=" + res.user_id,
                    "_blank",
                    `width=${width},height=${height},left=${left},top=${top},resizable=no,scrollbars=no`
                );

                if (!newWindow) {
                    alert("팝업이 차단되었습니다. 팝업을 허용해 주세요.");
                }
            } else {
                alert("해당 정보로 회원을 찾을 수 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("에러 발생:", error);
            alert("아이디 찾기에 실패했습니다. 다시 시도해주세요.");
        }
    });
});