const canvas = document.getElementById('wheelCanvas');
const ctx = canvas.getContext('2d');
const nameInput = document.getElementById('nameInput');
const spinBtn = document.getElementById('spinBtn');

const colors = ['#f87171', '#fbbf24', '#34d399', '#60a5fa', '#818cf8', '#fb7185'];
let segments = [];

function updateWheel() {
    segments = nameInput.value.split('\n').filter(s => s.trim() !== "");
    draw();
}

function draw() {
    const size = canvas.width;
    const center = size / 2;
    const arc = (Math.PI * 2) / segments.length;

    ctx.clearRect(0, 0, size, size);

    segments.forEach((text, i) => {
        const angle = i * arc;
        ctx.fillStyle = colors[i % colors.length];
        ctx.beginPath();
        ctx.moveTo(center, center);
        ctx.arc(center, center, center, angle, angle + arc);
        ctx.fill();

        ctx.save();
        ctx.translate(center, center);
        ctx.rotate(angle + arc / 2);
        ctx.textAlign = 'right';
        ctx.fillStyle = 'white';
        ctx.font = 'bold 20px sans-serif';
        ctx.fillText(text, center - 20, 10);
        ctx.restore();
    });
}

let rotation = 0;
spinBtn.onclick = () => {
    const extra = Math.floor(Math.random() * 360) + 1800;
    rotation += extra;
    canvas.style.transition = 'transform 4s cubic-bezier(0.1, 0, 0.2, 1)';
    canvas.style.transform = `rotate(${rotation}deg)`;

    setTimeout(() => {
        const actualRotation = rotation % 360;
        const index = Math.floor((360 - actualRotation) / (360 / segments.length)) % segments.length;
        document.getElementById('winnerDisplay').innerText = segments[index];
        document.getElementById('winModal').style.display = 'flex';
    }, 4000);
};

nameInput.oninput = updateWheel;
updateWheel();
