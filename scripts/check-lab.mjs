import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));
console.log('Memory layout laboratuvarı · Odin compiler kontrolü');
const result = spawnSync('odin', ['check', 'labs/00-memory-layout'], {
  cwd: root,
  stdio: 'inherit',
});

if (result.error) {
  console.error(`Odin çalıştırılamadı: ${result.error.message}`);
  console.error('Odin kurulumunu ve PATH ayarını kontrol et.');
  process.exit(1);
}

if (result.status !== 0) {
  console.error('Compiler kontrolü tamamlanamadı. İlerleme değiştirilmedi.');
  process.exit(result.status ?? 1);
}

console.log('Compiler kontrolü geçti. Bu sonuç ders tamamlanması değildir.');
console.log('World 0 isteğe bağlıdır. İnceleme istersen gözlemini sohbette paylaş; journal zorunlu değil.');
console.log('İlerleme değiştirilmedi.');
