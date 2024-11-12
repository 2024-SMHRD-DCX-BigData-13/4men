
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
	console.log("나옴");
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
							var postRow = $(
								'<tr>' +
								'<td class="th-num">' + (startNumber + index) + '</td>' +
								'<td class="th-title"><a href="#" class="post-link" data-id="' + post.post_idx + '" data-title="' + post.post_title + '" data-content="' + post.post_content + '">' + post.post_title + '</a></td>' +
								'<td class="th-name">' + post.id + '</td>' +
								'<td class="th-date">' + post.create_dt + '</td>' +
								'<td class="th-views">' + post.post_views + '</td>' +
								'</tr>'
							);

							// 이벤트 리스너 추가
							postRow.find('.post-link').click(function(e) {
								e.preventDefault(); // 링크 기본 동작 방지

								$('#post_title').text(post.post_title);
								$('#post_author').text('작성자: ' + post.id);
								$('#post_date').text('작성일: ' + post.create_dt);
								$('#post_content').text(post.post_content);
								console.log(post.post_file);

								var basePath = '/assets/css/images/';
								var imageUrl = contextPath + basePath + post.post_file;
								console.log("이미지 URL:", imageUrl); // 디버깅용

								$('#post_image').attr('src', imageUrl); // 이미지 설정

								$('.modal-overlay').show(); // 배경 보이기
								$('.modal').show(); // 모달 표시
							});

							boardListBody.append(postRow);
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

	// 모달 닫기 기능 추가
	$('.modal-overlay').click(function() {
		$('.modal').hide(); // 모달 닫기
		$('.modal-overlay').hide();
	});
});

$(document).on('click', '.post-link', function(e) {
	e.preventDefault(); // 링크의 기본 동작 방지

	var postId = $(this).data('id'); // 게시글의 ID 가져오기
	var $viewElement = $(this).closest('tr').find('.th-views'); // 조회수 표시하는 요소 선택

	console.log("Sending postId:", postId); // 디버깅 로그 추가

	if (!postId) {
		console.error("postId가 유효하지 않습니다.");
		return; // postId가 없으면 함수를 종료
	}

	// 조회수 증가 요청 보내기
	$.ajax({
		url: 'increaseViewCount.do',
		type: 'POST',
		data: { postId: postId },
		success: function(response) {
			console.log("조회수가 증가되었습니다.");

			// 조회수를 바로 업데이트 (예제에서는 기존 조회수에 1을 더함)
			var currentViews = parseInt($viewElement.text(), 10);
			if (!isNaN(currentViews)) {
				$viewElement.text(currentViews + 1); // 조회수를 업데이트
			}
		},
		error: function(xhr, status, error) {
			console.error("조회수 증가 중 오류 발생:", error);
			console.error("응답 상태 코드:", xhr.status); // 상태 코드 확인
			console.error("응답 내용:", xhr.responseText); // 응답 내용 확인
		}
	});

	// 모달창을 띄우기 위해 추가된 코드 (기존 모달창 코드 유지)
	$('#post_title').text($(this).data('title'));
	$('#post_content').text($(this).data('content'));
	$('#post_image').attr('src', $(this).data('image')); // 이미지가 있을 경우
	$('.modal').show();
});


function submitSelection() {
	const selectionForm = document.getElementById('selectionForm');
	const mapDiv = document.getElementById('map');

	// 체크리스트 숨기기
	selectionForm.style.display = 'none';

	// 지도 표시하기
	mapDiv.style.display = 'block';

	// 지도 표시 로직 추가 (예: Google Maps API 활용)
	// 예시: 위치 데이터 가져와서 지도에 표시하기
}


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
    $('category-btn').click(function() {
        var post_type = $(this).data('value');  // 버튼의 data-value 속성에서 post_type 값 가져오기 (팁, 잡담, 건의사항)
        $('#current-post-type').val(post_type); // 현재 post_type을 hidden input에 저장
        $('.category-btn').removeClass('active'); // 모든 카테고리 버튼에서 active 클래스 제거
        $(this).addClass('active'); // 클릭된 카테고리 버튼에 active 클래스 추가
        loadPosts(1);  // 첫 페이지로 이동하여 게시글 로드
    });

    // 모달 닫기 기능 추가
    $('.modal-overlay').click(function() {
        $('.modal').hide(); // 모달 닫기
        $('.modal-overlay').hide();
    });

    // 새로운 검색 함수 추가

});
    function searchPosts() {
        var keyword = $('#search-keyword').val(); // 검색어 입력값 가져오기

        $.ajax({
            url: 'search.do', // 검색을 처리하는 SearchCon으로 요청
            type: 'GET',
            data: { text: keyword }, // 검색어를 서버로 전송
            dataType: 'json',
            success: function(response) {
                if (response) {
                    var boardListBody = $('#board-list-body');
                    boardListBody.empty(); // 기존 게시글 목록 비우기

                    // 새로운 게시글 추가
                    if (response.length > 0) {
                        $.each(response, function(index, post) {
                            var postRow = $(
                                '<tr>' +
                                '<td class="th-num">' + (index + 1) + '</td>' +
                                '<td class="th-title"><a href="#" class="post-link" data-id="' + post.post_idx + '" data-title="' + post.post_title + '" data-content="' + post.post_content + '">' + post.post_title + '</a></td>' +
                                '<td class="th-name">' + post.id + '</td>' +
                                '<td class="th-date">' + post.create_dt + '</td>' +
                                '<td class="th-views">' + post.post_views + '</td>' +
                                '</tr>'
                            );

                            // 이벤트 리스너 추가
                            postRow.find('.post-link').click(function(e) {
                                e.preventDefault(); // 링크 기본 동작 방지

                                $('#post_title').text(post.post_title);
                                $('#post_author').text('작성자: ' + post.id);
                                $('#post_date').text('작성일: ' + post.create_dt);
                                $('#post_content').text(post.post_content);

                                var basePath = '/assets/css/images/';
                                var imageUrl = contextPath + basePath + post.post_file;
                                console.log("이미지 URL:", imageUrl); // 디버깅용

                                $('#post_image').attr('src', imageUrl); // 이미지 설정

                                $('.modal-overlay').show(); // 배경 보이기
                                $('.modal').show(); // 모달 표시
                            });

                            boardListBody.append(postRow);
                        });
                    } else {
                        boardListBody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
                    }
                } else {
                    console.error('서버 응답이 유효하지 않습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('검색 결과를 가져오는 중 오류 발생:', error);
            }
        });
    }

    // 검색 버튼 클릭 이벤트 추가
    $('#search-btn').click(function() {
        searchPosts();  // 검색 함수 호출
    });

$('#search-btn').click(function() {
    console.log('검색 버튼이 클릭되었습니다.'); // 버튼 클릭 확인용 로그
    searchPosts();  // 검색 함수 호출
});
