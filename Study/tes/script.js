$(document).ready(function () {
    // 비밀번호 보이기/숨기기 기능 추가
    $("#togglePassword").click(function () {
        var passwordField = $("#password");
        var confirmPasswordField = $("#confirmPassword");
        var fieldType = passwordField.attr("type");

        // 비밀번호 입력란 타입을 토글하여 보이게 하거나 숨김
        if (fieldType === "password") {
            passwordField.attr("type", "text");
            confirmPasswordField.attr("type", "text");
            $(this).html("👁️");
        } else {
            passwordField.attr("type", "password");
            confirmPasswordField.attr("type", "password");
            $(this).html("👁️");
        }
    });

    // 회원가입 완료 메시지 표시 및 유효성 검사
    $("#signupForm").submit(function (event) {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();

        // 비밀번호와 비밀번호 확인이 일치하는지 확인
        if (password !== confirmPassword) {
            $(".error-message").text("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 확인해주세요.");
            event.preventDefault(); // 폼 제출 방지
        } else {
            // 가입 완료 메시지 표시
            $(".container").append("<div class='success-message'>가입이 완료되었습니다!</div>");
        }
    });
});
