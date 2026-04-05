<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Wheel of Names Style</title>
  <style>
    * {
      box-sizing: border-box;
    }

    html, body {
      margin: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      font-family: Arial, Helvetica, sans-serif;
      background: #0b0b0f;
      color: white;
    }

    body {
      position: relative;
    }

    .top-glow {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 8px;
      background: linear-gradient(90deg, #4f7bff, #7a0f1e, #c4152a);
      box-shadow: 0 0 20px rgba(255, 0, 60, 0.25);
      z-index: 1;
    }

    .app {
      position: relative;
      width: 100%;
      height: 100%;
      display: flex;
      z-index: 2;
    }

    .wheel-area {
      position: relative;
      flex: 1;
      min-width: 0;
      background:
        radial-gradient(circle at 25% 10%, rgba(64, 93, 170, 0.35), transparent 30%),
        radial-gradient(circle at 85% 8%, rgba(139, 14, 26, 0.35), transparent 28%),
        linear-gradient(180deg, #131822, #060606 68%);
      overflow: hidden;
    }

    .edit-fab {
      position: absolute;
      top: 18px;
      left: 18px;
      width: 34px;
      height: 34px;
      border: none;
      border-radius: 50%;
      background: #4a7cff;
      color: white;
      font-size: 16px;
      cursor: pointer;
      box-shadow: 0 0 12px rgba(74, 124, 255, 0.4);
      z-index: 5;
    }

    .wheel-wrap {
      position: absolute;
      left: 50%;
      top: 52%;
      transform: translate(-50%, -50%);
      width: min(72vw, 780px);
      height: min(72vw, 780px);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .pointer {
      position: absolute;
      right: -8px;
      top: 50%;
      transform: translateY(-50%);
      width: 0;
      height: 0;
      border-top: 26px solid transparent;
      border-bottom: 26px solid transparent;
      border-left: 54px solid #cf1829;
      filter: drop-shadow(0 0 8px rgba(0, 0, 0, 0.45));
      z-index: 6;
    }

    .pointer::after {
      content: "";
      position: absolute;
      top: -18px;
      left: -52px;
      border-top: 18px solid transparent;
      border-bottom: 18px solid transparent;
      border-left: 38px solid #f04a5d;
      opacity: 0.55;
    }

    canvas#wheel {
      width: 100%;
      height: 100%;
      border-radius: 50%;
      transform: rotate(0deg);
      transition: transform 6s cubic-bezier(0.12, 0.8, 0.18, 1);
      filter:
        drop-shadow(0 14px 28px rgba(0, 0, 0, 0.55))
        drop-shadow(0 0 18px rgba(255, 255, 255, 0.08));
      background: transparent;
    }

    .hub {
      position: absolute;
      width: 130px;
      height: 130px;
      border-radius: 50%;
      background: #f0f0f0;
      box-shadow:
        inset 0 2px 4px rgba(255,255,255,0.8),
        0 3px 12px rgba(0,0,0,0.35);
      z-index: 4;
    }

    .spin-control {
      position: absolute;
      bottom: 24px;
      left: 50%;
      transform: translateX(-50%);
      z-index: 7;
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      justify-content: center;
    }

    .spin-control button {
      border: none;
      border-radius: 10px;
      padding: 12px 18px;
      font-size: 15px;
      font-weight: 700;
      cursor: pointer;
      color: white;
      background: #4a7cff;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.35);
    }

    .spin-control button.secondary {
      background: #272c36;
    }

    .side-panel {
      width: 420px;
      background: rgba(28, 28, 30, 0.96);
      border-left: 1px solid rgba(255,255,255,0.08);
      display: flex;
      flex-direction: column;
      padding: 14px 14px 12px;
      box-shadow: -8px 0 24px rgba(0,0,0,0.25);
    }

    .panel-tabs {
      display: flex;
      gap: 22px;
      padding: 4px 4px 14px;
      font-weight: 700;
      font-size: 15px;
      color: #dcdcdc;
    }

    .panel-tabs span {
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .panel-tabs .badge {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 18px;
      height: 18px;
      padding: 0 5px;
      border-radius: 999px;
      background: rgba(255,255,255,0.15);
      font-size: 11px;
    }

    .toolbar {
      display: flex;
      gap: 8px;
      align-items: center;
      flex-wrap: wrap;
      margin-bottom: 12px;
    }

    .tool-btn {
      border: none;
      border-radius: 8px;
      background: #4a7cff;
      color: white;
      font-weight: 700;
      font-size: 13px;
      padding: 10px 14px;
      cursor: pointer;
    }

    .tool-btn.dark {
      background: #2a2f39;
    }

    .check-wrap {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-left: auto;
      font-size: 13px;
      color: #e6e6e6;
    }

    .entries-box {
      flex: 1;
      border: 1px solid rgba(255,255,255,0.18);
      border-radius: 4px;
      background: #171717;
      padding: 14px;
      display: flex;
      flex-direction: column;
      min-height: 0;
    }

    #entriesInput {
      width: 100%;
      height: 100%;
      resize: none;
      background: transparent;
      color: white;
      border: none;
      outline: none;
      font-size: 18px;
      line-height: 1.55;
      font-family: Arial, Helvetica, sans-serif;
    }

    .bottom-actions {
      display: flex;
      align-items: center;
      gap: 10px;
      padding-top: 12px;
    }

    .beta {
      font-size: 12px;
      color: #f3db66;
      margin-right: -4px;
    }

    .add-wheel {
      border: none;
      border-radius: 8px;
      background: #4a7cff;
      color: white;
      font-weight: 700;
      font-size: 15px;
      padding: 12px 16px;
      cursor: pointer;
    }

    .arrow-drop {
      border: none;
      border-radius: 8px;
      background: #3d65d8;
      color: white;
      font-weight: 700;
      font-size: 15px;
      padding: 12px 14px;
      cursor: pointer;
    }

    .winner-modal {
      position: absolute;
      inset: 0;
      display: none;
      align-items: center;
      justify-content: center;
      z-index: 20;
      background: rgba(0,0,0,0.12);
    }

    .winner-modal.show {
      display: flex;
    }

    .winner-card {
      width: min(640px, calc(100vw - 40px));
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 20px 60px rgba(0,0,0,0.45);
      background: #1e1e1f;
    }

    .winner-header {
      background: #4471e0;
      color: white;
      font-weight: 700;
      font-size: 20px;
      padding: 18px 18px;
    }

    .winner-body {
      background: #1c1c1e;
      padding: 32px 28px 18px;
      text-align: center;
    }

    .winner-name {
      font-size: clamp(34px, 6vw, 54px);
      letter-spacing: 1px;
      color: #f3f3f3;
      font-weight: 300;
      margin-bottom: 30px;
      word-break: break-word;
    }

    .winner-actions {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .winner-actions button {
      border: none;
      border-radius: 8px;
      padding: 12px 16px;
      font-weight: 700;
      font-size: 15px;
      cursor: pointer;
    }

    .close-btn {
      background: transparent;
      color: white;
    }

    .remove-btn {
      background: #5b84f2;
      color: white;
    }

    .confetti {
      position: absolute;
      width: 8px;
      height: 16px;
      top: -20px;
      opacity: 0.95;
      animation: fall linear forwards;
      z-index: 19;
      pointer-events: none;
    }

    @keyframes fall {
      0% {
        transform: translateY(-30px) rotate(0deg);
      }
      100% {
        transform: translateY(110vh) rotate(720deg);
      }
    }

    @media (max-width: 1100px) {
      .side-panel {
        width: 340px;
      }
    }

    @media (max-width: 880px) {
      .app {
        flex-direction: column;
      }

      .side-panel {
        width: 100%;
        height: 42vh;
      }

      .wheel-area {
        height: 58vh;
      }

      .wheel-wrap {
        width: min(86vw, 580px);
        height: min(86vw, 580px);
      }

      .pointer {
        right: 10px;
      }
    }
  </style>
</head>
<body>
  <div class="top-glow"></div>

  <div class="app">
    <section class="wheel-area">
      <button class="edit-fab">✎</button>

      <div class="wheel-wrap">
        <div class="pointer"></div>
        <canvas id="wheel" width="900" height="900"></canvas>
        <div class="hub"></div>
      </div>

      <div class="spin-control">
        <button id="spinBtn">Spin</button>
        <button id="pickWinnerBtn" class="secondary">Pick Winner: FUELLING</button>
      </div>
    </section>

    <aside class="side-panel">
      <div class="panel-tabs">
        <span>Entries <span class="badge" id="entriesCount">2</span></span>
        <span>Results <span class="badge" id="resultsCount">0</span></span>
      </div>

      <div class="toolbar">
        <button class="tool-btn dark" id="shuffleBtn">Shuffle</button>
        <button class="tool-btn dark" id="sortBtn">Sort</button>
        <button class="tool-btn dark">Add image</button>

        <label class="check-wrap">
          <input type="checkbox" />
          Advanced
        </label>
      </div>

      <div class="entries-box">
        <textarea id="entriesInput" spellcheck="false">FUELLING
CHAT</textarea>
      </div>

      <div class="bottom-actions">
        <span class="beta">Beta</span>
        <button class="add-wheel">＋ Add wheel</button>
        <button class="arrow-drop">▼</button>
      </div>
    </aside>
  </div>

  <div class="winner-modal" id="winnerModal">
    <div class="winner-card">
      <div class="winner-header">We have a winner!</div>
      <div class="winner-body">
        <div class="winner-name" id="winnerName">FUELLING</div>
        <div class="winner-actions">
          <button class="close-btn" id="closeModalBtn">Close</button>
          <button class="remove-btn" id="removeWinnerBtn">Remove</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    const canvas = document.getElementById("wheel");
    const ctx = canvas.getContext("2d");
    const entriesInput = document.getElementById("entriesInput");
    const entriesCount = document.getElementById("entriesCount");
    const resultsCount = document.getElementById("resultsCount");
    const spinBtn = document.getElementById("spinBtn");
    const pickWinnerBtn = document.getElementById("pickWinnerBtn");
    const shuffleBtn = document.getElementById("shuffleBtn");
    const sortBtn = document.getElementById("sortBtn");
    const winnerModal = document.getElementById("winnerModal");
    const winnerName = document.getElementById("winnerName");
    const closeModalBtn = document.getElementById("closeModalBtn");
    const removeWinnerBtn = document.getElementById("removeWinnerBtn");

    const wheelColors = [
      { fill: "#4e82ff", glow: "rgba(110,160,255,0.45)" },
      { fill: "#e31832", glow: "rgba(255,80,90,0.35)" },
      { fill: "#13b96c", glow: "rgba(60,220,150,0.35)" },
      { fill: "#f59e0b", glow: "rgba(255,180,60,0.35)" },
      { fill: "#8b5cf6", glow: "rgba(170,130,255,0.35)" },
      { fill: "#06b6d4", glow: "rgba(80,220,255,0.35)" }
    ];

    let forcedWinnerIndex = 0;
    let currentRotation = 0;
    let spinning = false;
    let results = 0;
    let latestWinnerText = "";

    function getEntries() {
      return entriesInput.value
        .split("\n")
        .map(v => v.trim())
        .filter(Boolean);
    }

    function updateCounts() {
      const entries = getEntries();
      entriesCount.textContent = entries.length;
      resultsCount.textContent = results;
      if (entries.length === 0) {
        pickWinnerBtn.textContent = "Pick Winner: None";
      } else {
        forcedWinnerIndex = Math.min(forcedWinnerIndex, entries.length - 1);
        pickWinnerBtn.textContent = "Pick Winner: " + entries[forcedWinnerIndex];
      }
    }

    function drawWheel() {
      const entries = getEntries();
      const size = canvas.width;
      const center = size / 2;
      const radius = 390;

      ctx.clearRect(0, 0, size, size);

      if (entries.length === 0) {
        ctx.beginPath();
        ctx.arc(center, center, radius, 0, Math.PI * 2);
        ctx.fillStyle = "#2c2c2c";
        ctx.fill();
        return;
      }

      const sliceAngle = (Math.PI * 2) / entries.length;

      for (let i = 0; i < entries.length; i++) {
        const start = i * sliceAngle - Math.PI / 2;
        const end = start + sliceAngle;
        const color = wheelColors[i % wheelColors.length];

        const grad = ctx.createRadialGradient(
          center - 100, center - 120, 60,
          center, center, radius
        );
        grad.addColorStop(0, lighten(color.fill, 0.25));
        grad.addColorStop(0.55, color.fill);
        grad.addColorStop(1, darken(color.fill, 0.18));

        ctx.beginPath();
        ctx.moveTo(center, center);
        ctx.arc(center, center, radius, start, end);
        ctx.closePath();

        ctx.fillStyle = grad;
        ctx.shadowBlur = 18;
        ctx.shadowColor = color.glow;
        ctx.fill();
        ctx.shadowBlur = 0;

        const textAngle = start + sliceAngle / 2;
        ctx.save();
        ctx.translate(center, center);
        ctx.rotate(textAngle);

        ctx.fillStyle = "rgba(255,255,255,0.92)";
        ctx.font = `${Math.max(34, Math.min(56, 680 / entries.length))}px Arial`;
        ctx.textAlign = "center";
        ctx.textBaseline = "middle";

        const maxWidth = radius * 0.72;
        fitText(entries[i], maxWidth);

        ctx.translate(radius * 0.62, 0);
        ctx.rotate(Math.PI / 2);
        ctx.fillText(entries[i], 0, 0);
        ctx.restore();
      }

      ctx.beginPath();
      ctx.arc(center, center, radius, 0, Math.PI * 2);
      ctx.strokeStyle = "rgba(255,255,255,0.14)";
      ctx.lineWidth = 2;
      ctx.stroke();
    }

    function fitText(text, maxWidth) {
      let fontSize = 60;
      while (fontSize > 18) {
        ctx.font = `${fontSize}px Arial`;
        if (ctx.measureText(text).width <= maxWidth) break;
        fontSize -= 2;
      }
      ctx.font = `${fontSize}px Arial`;
    }

    function lighten(hex, amount) {
      const [r, g, b] = hexToRgb(hex);
      return `rgb(${mix(r, 255, amount)}, ${mix(g, 255, amount)}, ${mix(b, 255, amount)})`;
    }

    function darken(hex, amount) {
      const [r, g, b] = hexToRgb(hex);
      return `rgb(${mix(r, 0, amount)}, ${mix(g, 0, amount)}, ${mix(b, 0, amount)})`;
    }

    function mix(a, b, amount) {
      return Math.round(a + (b - a) * amount);
    }

    function hexToRgb(hex) {
      const clean = hex.replace("#", "");
      const bigint = parseInt(clean, 16);
      const r = (bigint >> 16) & 255;
      const g = (bigint >> 8) & 255;
      const b = bigint & 255;
      return [r, g, b];
    }

    function spinWheel() {
      const entries = getEntries();
      if (spinning || entries.length < 2) return;

      spinning = true;
      spinBtn.disabled = true;
      pickWinnerBtn.disabled = true;

      forcedWinnerIndex = Math.min(forcedWinnerIndex, entries.length - 1);

      const sliceDeg = 360 / entries.length;
      const sliceCenterDeg = forcedWinnerIndex * sliceDeg + sliceDeg / 2;

      const pointerDeg = 90;
      const targetDeg = pointerDeg - sliceCenterDeg;

      const extraSpins = 360 * (6 + Math.floor(Math.random() * 2));
      const safeOffset = (Math.random() * (sliceDeg * 0.35)) - (sliceDeg * 0.175);

      const finalRotation =
        currentRotation +
        extraSpins +
        targetDeg -
        (currentRotation % 360) +
        safeOffset;

      canvas.style.transform = `rotate(${finalRotation}deg)`;
      currentRotation = finalRotation;

      setTimeout(() => {
        latestWinnerText = entries[forcedWinnerIndex];
        winnerName.textContent = latestWinnerText;
        winnerModal.classList.add("show");
        createConfetti();
        results += 1;
        updateCounts();

        spinning = false;
        spinBtn.disabled = false;
        pickWinnerBtn.disabled = false;
      }, 6000);
    }

    function createConfetti() {
      for (let i = 0; i < 80; i++) {
        const piece = document.createElement("div");
        piece.className = "confetti";
        piece.style.left = Math.random() * 100 + "vw";
        piece.style.animationDuration = 2.5 + Math.random() * 2 + "s";
        piece.style.background = randomConfettiColor();
        piece.style.transform = `rotate(${Math.random() * 360}deg)`;
        piece.style.opacity = 0.7 + Math.random() * 0.3;
        document.body.appendChild(piece);
        setTimeout(() => piece.remove(), 5000);
      }
    }

    function randomConfettiColor() {
      const colors = ["#ffcc00", "#29cc7a", "#4a7cff", "#ff4b5f", "#ffffff", "#9a6cff"];
      return colors[Math.floor(Math.random() * colors.length)];
    }

    function cycleWinner() {
      const entries = getEntries();
      if (!entries.length) return;
      forcedWinnerIndex = (forcedWinnerIndex + 1) % entries.length;
      updateCounts();
      drawWheel();
    }

    function removeWinner() {
      const entries = getEntries();
      if (!latestWinnerText) return;

      const filtered = entries.filter((entry, index) => {
        if (entry !== latestWinnerText) return true;
        if (entry === latestWinnerText) {
          latestWinnerText = "";
          return false;
        }
      });

      entriesInput.value = filtered.join("\n");
      winnerModal.classList.remove("show");
      forcedWinnerIndex = 0;
      drawWheel();
      updateCounts();
    }

    entriesInput.addEventListener("input", () => {
      forcedWinnerIndex = 0;
      drawWheel();
      updateCounts();
    });

    pickWinnerBtn.addEventListener("click", cycleWinner);

    spinBtn.addEventListener("click", spinWheel);

    shuffleBtn.addEventListener("click", () => {
      const entries = getEntries();
      for (let i = entries.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [entries[i], entries[j]] = [entries[j], entries[i]];
      }
      entriesInput.value = entries.join("\n");
      forcedWinnerIndex = 0;
      drawWheel();
      updateCounts();
    });

    sortBtn.addEventListener("click", () => {
      const entries = getEntries().sort((a, b) => a.localeCompare(b));
      entriesInput.value = entries.join("\n");
      forcedWinnerIndex = 0;
      drawWheel();
      updateCounts();
    });

    closeModalBtn.addEventListener("click", () => {
      winnerModal.classList.remove("show");
    });

    removeWinnerBtn.addEventListener("click", removeWinner);

    updateCounts();
    drawWheel();
  </script>
</body>
</html>
