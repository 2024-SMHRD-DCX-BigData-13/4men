
$("#spot-recommend").click(() => {
	if ($(".content-container").css("display") == "none") {
		$(".content-container").fadeIn(200);
		$("#rec-container").fadeIn(200);
		$("#spot-recommend").toggleClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#rec-container").css("display") == "block") {
		$(".content-container").fadeOut(200);
		$("#rec-container").fadeOut(200);
		$("#spot-recommend").removeClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#Cpost-container").css("display") == "block") {
		$(".content-container").fadeOut(200);
		$("#Cpost-container").hide(200);
		$(".content-container").fadeIn(200);
		$("#rec-container").fadeIn(200);
		$("#spot-recommend").toggleClass("active");
		$("#free-board").removeClass("active");
	}
	$(this).toggleClass("active");
	$("#free-board").removeClass("active");
})
$("#free-board").click(() => {
	if ($(".content-container").css("display") == "none") {
		$(".content-container").fadeIn(200);
		$("#Cpost-container").fadeIn(200);
		$("#free-board").toggleClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#Cpost-container").css("display") == "block") {
		$(".content-container").fadeOut(200);
		$("#Cpost-container").fadeOut(200);
		$("#free-board").removeClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#rec-container").css("display") == "block") {
		$(".content-container").fadeOut(200);
		$("#rec-container").hide(200);
		$(".content-container").fadeIn(200);
		$("#Cpost-container").fadeIn(200);
		$("#free-board").toggleClass("active");
		$("#spot-recommend").removeClass("active");
	}

})

$(document).ready(function() {
	
    var pageSize = 10;  // 페이지당 게시글 수 설정

    // 초기 로드 시 첫 페이지 게시글 로드
    loadPosts(1);

    // 페이지네이션 버튼 클릭 이벤트를 동적으로 할당
    $(document).on('click', '.page-button', function(e) {
        e.preventDefault();
        var pageNum = $(this).data('page');
        loadPosts(pageNum);
    });

    // 카테고리 버튼 클릭 이벤트
    $('.category-btn').click(function() {
        var post_type = $(this).data('value');  // 버튼의 data-value 속성에서 post_type 값 가져오기 (팁, 잡담, 건의사항)
        $('#current-post-type').val(post_type); // 현재 post_type을 hidden input에 저장
        $('.category-btn').removeClass('active'); // 모든 카테고리 버튼에서 active 클래스 제거
        $(this).addClass('active'); // 클릭된 카테고리 버튼에 active 클래스 추가
        loadPosts(1);  // 첫 페이지로 이동하여 게시글 로드
    });

    // AJAX로 게시글 로드 함수
function loadPosts(page) {
    var post_type = $('#current-post-type').val();  // 현재 post_type 값 가져오기
    $.ajax({
        url: 'getPosts.do',
        type: 'GET',
        data: { page: page, pageSize: pageSize, post_type: post_type }, // 서버로 현재 페이지, 페이지 크기, post_type을 전송
        dataType: 'json',
        success: function(response) {
            if (response && response.posts) {
                var posts = response.posts;
                var totalPages = response.totalPages || 0;
                var boardListBody = $('#board-list-body');
                boardListBody.empty(); // 기존 게시글 목록 비우기
                
                // 순번 계산
                var startNumber = (page - 1) * pageSize + 1;

                // 새로운 게시글 추가
                if (posts.length > 0) {
                    $.each(posts, function(index, post) {
                        boardListBody.append(
                            '<tr>' +
                                '<td class="th-num">' + (startNumber + index) + '</td>' +
                                '<td class="th-title"><a href="postDetail.do?postIdx=' + post.post_idx + '">' + post.post_title + '</a></td>' +
                                '<td class="th-name">' + post.id + '</td>' +
                                '<td class="th-date">' + post.create_dt + '</td>' +
                                '<td class="th-views">' + post.post_views + '</td>' +
                            '</tr>'
                        );
                    });
                } else {
                    boardListBody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
                }

                // 페이지네이션 버튼 업데이트
                updatePagination(totalPages, page);
            } else {
                console.error('서버 응답이 유효하지 않습니다.');
            }
        },
        error: function(xhr, status, error) {
            console.error('게시글을 가져오는 중 오류 발생:', error);
        }
    });
}


    // 페이지네이션 버튼 업데이트 함수
    function updatePagination(totalPages, currentPage) {
        var pagination = $('.pagination');
        pagination.empty(); // 기존 페이지네이션 버튼 비우기

        if (totalPages > 1) {
            for (var i = 1; i <= totalPages; i++) {
                var activeClass = (i === currentPage) ? 'active' : '';
                pagination.append('<a href="#" class="page-button ' + activeClass + '" data-page="' + i + '">' + i + '</a>');
            }
        }
    }
});
