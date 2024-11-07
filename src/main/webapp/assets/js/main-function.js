
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

