function toggleRec() {
    const recContainer = document.getElementById("rec-container");
    const CpostContainer = document.getElementById("Cpost-container");
    const recButton = document.getElementById("spot-recommend");
    const CpostButton = document.getElementById("free-board");

    if (recContainer.classList.contains("hidden")) {
        recContainer.classList.remove("hidden");
        recContainer.classList.add("visible");
        CpostContainer.classList.add("hidden");
        CpostContainer.classList.remove("visible");
        recButton.classList.add("active");
        CpostButton.classList.remove("active");
    } else {
        recContainer.classList.add("hidden");
        recContainer.classList.remove("visible");
        recButton.classList.remove("active");
    }
}

function toggleCpost() {
    const recContainer = document.getElementById("rec-container");
    const CpostContainer = document.getElementById("Cpost-container");
    const recButton = document.getElementById("spot-recommend");
    const CpostButton = document.getElementById("free-board");

    if (CpostContainer.classList.contains("hidden")) {
        CpostContainer.classList.remove("hidden");
        CpostContainer.classList.add("visible");
        recContainer.classList.add("hidden");
        recContainer.classList.remove("visible");
        CpostButton.classList.add("active");
        recButton.classList.remove("active");
    } else {
        CpostContainer.classList.add("hidden");
        CpostContainer.classList.remove("visible");
        CpostButton.classList.remove("active");
    }
}

