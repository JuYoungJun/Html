const remainingMin = document.getElementById("remaining__min");
const remainingSec = document.getElementById("remaining__sec");
const completeBtn = document.getElementById("complete");

// 굳이 ms로 변경할 필요가 없다. 계산하기 더 불편하고 할 이유가 없다.
// 항상 상황에 따라서 달라진다.

let time = 180;
const takeTarget = () => {
  setInterval(function () {
    if (time > 0) { // >= 0 으로하면 -1까지 출력된다.
      time = time - 1; // 여기서 빼줘야 3분에서 3분 또 출력되지 않고, 바로 2분 59초로 넘어간다.
      let min = Math.floor(time / 60);
      let sec = String(time % 60).padStart(2, "0");
      remainingMin.innerText = min;
      remainingSec.innerText = sec;
      // time = time - 1
    } else {
      completeBtn.disabled = true;
    }
  }, 1000);
};