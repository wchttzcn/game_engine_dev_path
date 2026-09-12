import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

import { worldLessons } from './lessons.mjs';

const repoRoot = join(dirname(fileURLToPath(import.meta.url)), '..');
const lessons = worldLessons(repoRoot, '01-pong');
const body = (lesson) => readFileSync(join(repoRoot, 'academy/worlds/01-pong', lesson.file), 'utf8');
const byUrl = new Map(lessons.map((lesson) => [lesson.url, lesson]));

test('ders içi ders linkleri kanonik adı taşır', () => {
  for (const lesson of lessons) {
    for (const [, text, url] of body(lesson).matchAll(/\[([^\]]+)\]\((\/worlds\/[^)]+)\)/g)) {
      const target = byUrl.get(url);
      assert.ok(target, `${lesson.file}: bilinmeyen ders linki ${url}`);
      assert.equal(text.replace(/\s+/g, ' '), target.title, `${lesson.file}: "${url}" linkinin metni kanonik ad değil`);
    }
  }
});

test('son ders dışında her ders sonraki derse link verir', () => {
  for (const [i, lesson] of lessons.entries()) {
    const next = lessons[i + 1];
    const text = body(lesson);
    if (!next) {
      assert.ok(!/Sonraki adım/.test(text), `${lesson.file}: son derste sonraki adım olmamalı`);
      continue;
    }
    assert.match(
      text.replace(/\s+/g, ' '),
      new RegExp(`Sonraki adım[^.]*\\[${next.title.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\]\\(${next.url}\\)`),
      `${lesson.file}: "Sonraki adım" linki ${next.title} dersine gitmiyor`,
    );
  }
});

test('her ders aynı inceleme çağrısıyla biter', () => {
  for (const lesson of lessons) {
    assert.match(
      body(lesson).replace(/\s+/g, ' '),
      new RegExp(`\\*\\*“Pong ${lesson.number} denememi değerlendir”\\*\\* yaz; kodunu inceleyelim\\.`),
      `${lesson.file}: inceleme çağrısı yok`,
    );
  }
});
