// 임시 변수 및 변수 선언
let tmp = 1;
let numbers;

// 숫자 해독 효과 함수
function decryptEffect(element, time) {
    // 일정 시간마다 숫자를 랜덤으로 변경
    const effect = setInterval(() => {
        element.innerText = Math.floor(Math.random() * 44 + 1);
    }, 10);

    // 주어진 시간 후에 랜덤으로 선택된 숫자로 변경
    setTimeout(() => {
        const random = Math.floor(Math.random() * numbers.length);

        clearInterval(effect);
        element.classList.add("done");
        element.innerText = numbers[random];
        numbers.splice(random, 1);
    }, time * 1000 + 1000);
}

// 추첨 함수
function lottery() {
    // 모든 공 요소에 대해 효과 적용
    document.querySelectorAll(".ball").forEach((element, index) => {
        element.classList.remove("done");
        decryptEffect(element, index);
    });
}

// 버튼 클릭 이벤트 핸들러
document.getElementById("btn").addEventListener("click", function () {
    // 추첨이 가능한 경우
    if (tmp === 1) {
        // 숫자 배열 초기화
        numbers = Array.from({ length: 45 }, (_, i) => i + 1);
        tmp = 0;
        // 버튼 숨기기 및 추첨 시작
        btn.classList.add("hide");
        lottery();
        // 추첨 후 일정 시간 이후에 버튼 보이기
        setTimeout(function () {
            (tmp = 1), btn.classList.remove("hide");
        }, 7500);
    }
});
