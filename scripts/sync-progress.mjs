#!/usr/bin/env node
// Her rotanın ayrı progress kataloğunu ders frontmatter'ından
// tazeler. `--check` yazmaz, yalnız farkı bildirir ve farklıysa 1 döner.
import { readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

import { allLessons, pixelArtLessons, progressDrift, repoRootFrom } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);
const check = process.argv.includes('--check');
const catalogs = [
  { path: 'progress/current.json', lessons: allLessons(repoRoot) },
  { path: 'progress/pixel-art.json', lessons: pixelArtLessons(repoRoot) },
].map((catalog) => {
  const progress = JSON.parse(readFileSync(join(repoRoot, catalog.path), 'utf8'));
  return { ...catalog, progress, drift: progressDrift(catalog.lessons, progress) };
});
const drift = catalogs.flatMap((catalog) => catalog.drift);

if (drift.length === 0) {
  console.log('Oyun ve Pixel Art ders katalogları güncel.');
  process.exit(0);
}

for (const item of drift) {
  console.log(`${item.id}.${item.field}: "${item.actual}" → "${item.expected}"`);
}

if (check) {
  console.error(`\n${drift.length} fark var. Düzeltmek için: npm run academy:sync`);
  process.exit(1);
}

const missing = drift.filter((item) => item.field === 'lesson');
if (missing.length > 0) {
  console.error('\nKatalog ile ders dosyaları eşleşmiyor; bu farkları elle çöz.');
  process.exit(1);
}

for (const catalog of catalogs) {
  if (catalog.drift.length === 0) continue;
  const byId = new Map(catalog.lessons.map((lesson) => [lesson.id, lesson]));
  for (const entry of catalog.progress.lessons) {
    const lesson = byId.get(entry.id);
    entry.title = lesson.title;
    entry.world = lesson.world;
    entry.url = lesson.url;
  }
  writeFileSync(join(repoRoot, catalog.path), `${JSON.stringify(catalog.progress, null, 2)}\n`);
}
console.log(`\n${drift.length} alan güncellendi.`);
