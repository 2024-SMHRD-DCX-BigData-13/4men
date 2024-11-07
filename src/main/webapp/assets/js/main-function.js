
$("#spot-recommend").click(() => {
	if ($(".content-container").css("display") == "none") {
		$(".content-container").fadeIn();
		$("#rec-container").fadeIn();
		$("#spot-recommend").toggleClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#rec-container").css("display") == "block") {
		$(".content-container").fadeOut();
		$("#rec-container").fadeOut();
		$("#spot-recommend").removeClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#Cpost-container").css("display") == "block") {
		$(".content-container").fadeOut();
		$("#Cpost-container").hide();
		$(".content-container").fadeIn();
		$("#rec-container").fadeIn();
		$("#spot-recommend").toggleClass("active");
		$("#free-board").removeClass("active");
	}
	$(this).toggleClass("active");
	$("#free-board").removeClass("active");
})
$("#free-board").click(() => {
	if ($(".content-container").css("display") == "none") {
		$(".content-container").fadeIn();
		$("#Cpost-container").fadeIn();
		$("#free-board").toggleClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#Cpost-container").css("display") == "block") {
		$(".content-container").fadeOut();
		$("#Cpost-container").fadeOut();
		$("#free-board").removeClass("active");
	}
	else if ($(".content-container").css("display") == "block" && $("#rec-container").css("display") == "block") {
		$(".content-container").fadeOut();
		$("#rec-container").hide();
		$(".content-container").fadeIn();
		$("#Cpost-container").fadeIn();
	$("#free-board").toggleClass("active");
	$("#spot-recommend").removeClass("active");
	}

})

