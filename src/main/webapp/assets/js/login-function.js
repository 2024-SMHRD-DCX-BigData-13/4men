		function showSignUp(event) {
			if (event)
				event.preventDefault(); // 기본 동작 방지
			document.getElementById("login-container").classList.add("hidden");
			document.getElementById("signup-layout").classList.remove("hidden");
			document.getElementById("findid-layout").classList.add("hidden");
		}

		function showFindID(event) {
			if (event)
				event.preventDefault(); // 기본 동작 방지
			document.getElementById("login-container").classList.add("hidden");
			document.getElementById("signup-layout").classList.add("hidden");
			document.getElementById("findid-layout").classList.remove("hidden");
		}

		function showLogin() {
			document.getElementById("signup-layout").classList.add("hidden");
			document.getElementById("findid-layout").classList.add("hidden");
			document.getElementById("login-container").classList
					.remove("hidden");
		}
		document.addEventListener("DOMContentLoaded", function () {
		    const spotRecommend = document.getElementById("spot-recommend");
		    const freeBoard = document.getElementById("free-board");
		    const hoverMessage = document.getElementById("login-required");

		    function showMessage() {
		        hoverMessage.classList.remove("hidden");
		        hoverMessage.classList.add("visible");
		    }

		    function hideMessage() {
		        hoverMessage.classList.remove("visible");
		        hoverMessage.classList.add("hidden");
		    }

		    spotRecommend.addEventListener("mouseenter", showMessage);
		    spotRecommend.addEventListener("mouseleave", hideMessage);
		    freeBoard.addEventListener("mouseenter", showMessage);
		    freeBoard.addEventListener("mouseleave", hideMessage);
		});