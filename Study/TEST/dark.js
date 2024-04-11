let darkmode_switch = true

$(".darkmode_btn").on("click", function () {
    count = !count;
    if (count === true) {
        $(".white-box").removeClass("dark");
        $(".contact_icon").removeClass("dark");
        $(".darkmode_span").html("🌗 다크 모드로 보기");
    } else {
        $(".white-box").addClass("dark");
        $(".contact_icon").addClass("dark");
        $(".darkmode_span").html("☀️ 일반 모드로 보기");
    }
});