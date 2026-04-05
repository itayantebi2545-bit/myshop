<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Rigged Color Wheel</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      min-height: 100vh;
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #111827, #1f2937);
      color: white;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .container {
      width: 100%;
      max-width: 1100px;
      display: grid;
      grid-template-columns: 1fr 320px;
      gap: 30px;
      align-items: center;
    }

    .wheel-section {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .pointer {
      width: 0;
      height: 0;
      border-left: 22px solid transparent;
      border-right: 22px solid transparent;
      border-top: 38px solid #ffffff;
      margin-bottom: -8px;
      z-index: 2;
      filter: drop-shadow(0 4px 8px rgba(0,0,0,0.4));
    }

    .wheel-wrap {
      position: relative;
      width: min(80vw, 500px);
      height: min(80vw, 500px);
    }

    #wheel {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      border: 10px solid white;
      box-shadow: 0 10px 30px rgba(0,0,0,0.35);
      transform: rotate(0deg);
      transition: transform 5s cubic-bezier(0.17, 0.67, 0.18, 1);
      background: #222;
    }

    .center-cap {
      position: absolute;
      inset: 50%;
      transform: translate(-50%, -50%);
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background: white;
      border: 8px solid #d1d5db;
      box-shadow: 0 4px 14px rgba(0,0,0,0.25);
      z-index: 3;
    }

    .panel {
      background: rgba(255,255,255,0.08);
      border: 1px solid rgba(255,255,255,0.12);
      border-radius: 18px;
      padding: 22px;
      backdrop-filter: blur(10px);
      box-shadow: 0 10px 30px rgba(0,0,0,0.25);
    }

    h1 {
      margin: 0 0 10px;
      font-size: 28px;
    }

    p {
      margin: 0 0 16px;
      color: #d1d5db;
      line-height: 1.5;
    }

    .colors {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 10px;
      margin-bottom: 18px;
    }

    .color-btn {
      border: none;
      border-radius: 12px;
      padding: 14px 12px;
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: transform 0.15s ease, opacity 0.15s ease, outline 0.15s ease;
      outline: 3px solid transparent;
    }

    .color-btn:hover {
      transform: translateY(-2px);
      opacity: 0.95;
    }

    .color-btn.active {
      outline: 3px solid #fff;
      box-shadow: 0 0 0 4px rgba(255,255,255,0.15);
    }

    .spin-btn,
    .random-btn {
      width: 100%;
      border: none;
      border-radius: 14px;
      padding: 14px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      margin-top: 10px;
      transition: transform 0.15s ease, opacity 0.15s ease;
    }

    .spin-btn {
      background: #22c55e;
      color: white;
    }

    .random-btn {
      background: #374151;
      color: white;
    }

    .spin-btn:hover,
    .random-btn:hover {
      transform: translateY(-2px);
      opacity: 0.96;
    }

    .spin-btn:disabled,
    .random-btn:disabled {
      opacity: 0.6;
      cursor: not-allowed;
      transform: none;
    }

    .status {
      margin-top: 18px;
      padding: 14px;
      border-radius: 12px;
      background: rgba(255,255,255,0.06);
      color: #f3f4f6;
      min-height: 54px;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      font-weight: bold;
    }

    .small {
      margin-top: 14px;
      color: #9ca3af;
      font-size: 14px;
      line-height: 1.5;
    }

    @media (max-width: 900px) {
      .container {
        grid-template-columns: 1fr;
      }

      .panel {
        max-width: 500px;
        width: 100%;
        margin: 0 auto;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="wheel-section">
      <div class="pointer"></div>
      <div class="wheel-wrap">
        <canvas id="wheel" width="500" height="500"></canvas>
        <div class="center-cap"></div>
      </div>
    </div>

    <div class="panel">
      <h1>Color Wheel</h1>
      <p>Choose the winning color, then spin the wheel.</p>

      <div class="colors" id="colorButtons"></div>

      <button class="random-btn" id="randomWinnerBtn">Pick Random Winner</button>
      <button class="spin-btn" id="spinBtn">Spin Wheel</button>

      <div class="status" id="status">Selected winner: <span id="selectedText" style="margin-left:6px;">Red</span></div>

      <div class="small">
        Upload this file as <b>index.html</b> to your GitHub repository and enable GitHub Pages.
      </div>
    </div>
  </div>

  <script>
    const slices = [
      { name: "Red", color: "#ef4444" },
      { name: "Blue", color: "#3b82f6" },
      { name: "Green", color: "#22c55e" },
      { name: "Yellow", color: "#eab308" },
      { name: "Purple", color: "#a855f7" },
      { name: "Orange", color: "#f97316" },
      { name: "Pink", color: "#ec4899" },
      { name: "Cyan", color: "#06b6d4" }
    ];

    const canvas = document.getElementById("wheel");
    const ctx = canvas.getContext("2d");
    const colorButtons = document.getElementById("colorButtons");
    const spinBtn = document.getElementById("spinBtn");
    const randomWinnerBtn = document.getElementById("randomWinnerBtn");
    const selectedText = document.getElementById("selectedText");
    const status = document.getElementById("status");

    const size = canvas.width;
    const center = size / 2;
    const radius = center - 10;
    const sliceAngle = (Math.PI * 2) / slices.length;

    let selectedWinnerIndex = 0;
    let currentRotation = 0;
    let isSpinning = false;

    function drawWheel() {
      ctx.clearRect(0, 0, size, size);

      for (let i = 0; i < slices.length; i++) {
        const startAngle = i * sliceAngle - Math.PI / 2;
        const endAngle = startAngle + sliceAngle;

        ctx.beginPath();
        ctx.moveTo(center, center);
        ctx.arc(center, center, radius, startAngle, endAngle);
        ctx.closePath();
        ctx.fillStyle = slices[i].color;
        ctx.fill();

        ctx.save();
        ctx.translate(center, center);
        ctx.rotate(startAngle + sliceAngle / 2);
        ctx.textAlign = "right";
        ctx.fillStyle = "white";
        ctx.font = "bold 24px Arial";
        ctx.shadowColor = "rgba(0,0,0,0.4)";
        ctx.shadowBlur = 4;
        ctx.fillText(slices[i].name, radius - 25, 8);
        ctx.restore();
      }
    }

    function createColorButtons() {
      colorButtons.innerHTML = "";

      slices.forEach((slice, index) => {
        const btn = document.createElement("button");
        btn.className = "color-btn";
        btn.textContent = slice.name;
        btn.style.background = slice.color;

        if (index === selectedWinnerIndex) {
          btn.classList.add("active");
        }

        btn.addEventListener("click", () => {
          if (isSpinning) return;
          selectedWinnerIndex = index;
          updateSelectedUI();
        });

        colorButtons.appendChild(btn);
      });
    }

    function updateSelectedUI() {
      const allBtns = document.querySelectorAll(".color-btn");
      allBtns.forEach((btn, i) => {
        btn.classList.toggle("active", i === selectedWinnerIndex);
      });

      selectedText.textContent = slices[selectedWinnerIndex].name;
      status.innerHTML = `Selected winner: <span id="selectedText" style="margin-left:6px;">${slices[selectedWinnerIndex].name}</span>`;
    }

    function spinWheel() {
      if (isSpinning) return;
      isSpinning = true;

      spinBtn.disabled = true;
      randomWinnerBtn.disabled = true;

      const targetIndex = selectedWinnerIndex;

      // Each slice center angle in degrees:
      const sliceSizeDeg = 360 / slices.length;
      const sliceCenterDeg = targetIndex * sliceSizeDeg + sliceSizeDeg / 2;

      // Pointer is at the top, so winning slice center should end at 0/top.
      // We rotate wheel so the chosen slice aligns with the pointer.
      const targetDeg = 360 - sliceCenterDeg;

      // Add extra spins for effect
      const extraSpins = 360 * (5 + Math.floor(Math.random() * 3));

      // Add a tiny random offset so it still feels natural but stays in the same slice
      const safeOffset = (Math.random() * (sliceSizeDeg * 0.5)) - (sliceSizeDeg * 0.25);

      const finalRotation = currentRotation + extraSpins + targetDeg - (currentRotation % 360) + safeOffset;

      canvas.style.transform = `rotate(${finalRotation}deg)`;
      currentRotation = finalRotation;

      setTimeout(() => {
        isSpinning = false;
        spinBtn.disabled = false;
        randomWinnerBtn.disabled = false;
        status.innerHTML = `Winner: <span style="margin-left:6px;">${slices[selectedWinnerIndex].name}</span>`;
      }, 5000);
    }

    randomWinnerBtn.addEventListener("click", () => {
      if (isSpinning) return;
      selectedWinnerIndex = Math.floor(Math.random() * slices.length);
      updateSelectedUI();
    });

    spinBtn.addEventListener("click", spinWheel);

    drawWheel();
    createColorButtons();
    updateSelectedUI();
  </script>
</body>
</html>
