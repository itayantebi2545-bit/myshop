const canvas = document.getElementById('wheelCanvas');
const ctx = canvas.getContext('2d');
const nameInput = document.getElementById('nameInput');
const spinBtn = document.getElementById('spinBtn');

const colors = ['#3369e8', '#d50f25', '#eeb211', '#009925', '#f47b12', '#9b59b6'];
let segments = [];

function updateWheel() {
    segments = nameInput.value.split('\n').filter(s => s.trim() !== "");
    draw();
}

function draw() {
    const size = canvas.width;
    const center = size / 2;
    const radius = center - 10;
    const arc = (Math.PI * 2) / segments.length;

    ctx.clearRect(0, 0, size, size);

    segments.forEach((text, i) => {
        const angle = i * arc;
        
        // Draw segment
        ctx.fillStyle = colors[i % colors.length];
        ctx.beginPath();
        ctx.moveTo(center, center);
        ctx.arc(center, center, radius, angle, angle + arc);
        ctx.fill();
        ctx.stroke();
        ctx.strokeStyle = 'rgba(255,255,255,0.2)';

        // Draw text
        ctx.save();
        ctx.translate(center, center);
        ctx.rotate(angle + arc / 2);
        ctx.textAlign = 'right';
        ctx.fillStyle = 'white';
        ctx.font = 'bold 24px Roboto';
        ctx.fillText(text, radius - 30, 10);
        ctx.restore();
    });
}

let rotation = 0;
let isSpinning = false;

spinBtn.onclick = () => {
    if (isSpinning) return;
    isSpinning = true;
    
    const extra = Math.floor(Math.random() * 360) + 2880; // 8 full spins
    rotation += extra;
    
    canvas.style.transition = 'transform 6s cubic-bezier(0.15, 0, 0.15, 1)';
    canvas.style.transform = `rotate(${rotation}deg)`;

    setTimeout(() => {
        isSpinning = false;
        const actualRotation = rotation % 360;
        // Adjusting index calculation to match visual pointer position
        const index = Math.floor((360 - actualRotation) / (360 / segments.length)) % segments.length;
        
        document.getElementById('winnerDisplay').innerText = segments[index];
        document.getElementById('winModal').style.display = 'flex';
    }, 6000);
};

nameInput.oninput = updateWheel;
updateWheel();
