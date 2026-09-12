#!/usr/bin/env node
// progress/current.json ders adlarını ve url'lerini ders frontmatter'ından
// tazeler. `--check` yazmaz, yalnız farkı bildirir ve farklıysa 1 döner.
import { readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

import { allLessons, progressDrift, repoRootFrom } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);
const progressPath = join(repoRoot, 'progress/current.json');
const check = process.argv.includes('--check');

const progress = JSON.parse(readFileSync(progressPath, 'utf8'));
const lessons = allLessons(repoRoot);
const drift = progressDrift(lessons, progress);

if (drift.length === 0) {
  console.log('progress/current.json ders adları güncel.');
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

const byId = new Map(lessons.map((lesson) => [lesson.id, lesson]));
for (const entry of progress.lessons) {
  const lesson = byId.get(entry.id);
  entry.title = lesson.title;
  entry.world = lesson.world;
  entry.url = lesson.url;
}
writeFileSync(progressPath, `${JSON.stringify(progress, null, 2)}\n`);
console.log(`\n${drift.length} alan güncellendi.`);
