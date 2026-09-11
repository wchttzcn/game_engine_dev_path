import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = fileURLToPath(new URL('../', import.meta.url));
console.log('Bellek laboratuvarı · Odin derleyici kontrolü');
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
  console.error('Derleyici kontrolü tamamlanamadı. İlerleme değiştirilmedi.');
  process.exit(result.status ?? 1);
}

console.log('Derleyici kontrolü geçti. Bu sonuç ders tamamlanması değildir.');
console.log('journal/00-memory-layout.md içinde yalnızca mevcut dersin bölümünü tamamla.');
console.log('Ardından mentor değerlendirmesi iste. İlerleme değiştirilmedi.');
