import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

import { WORLDS, repoRootFrom, worldLessons } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);
const worldSlugs = Object.keys(WORLDS);
const lessonsByWorld = worldSlugs.map((slug) => ({ slug, lessons: worldLessons(repoRoot, slug) }));
const allLessons = lessonsByWorld.flatMap(({ slug, lessons }) => lessons.map((lesson) => ({ ...lesson, slug })));
const byUrl = new Map(allLessons.map((lesson) => [lesson.url, lesson]));
const body = (lesson) => readFileSync(join(repoRoot, 'academy/worlds', lesson.slug, lesson.file), 'utf8');

test('ders içi ders linkleri kanonik adı taşır', () => {
  for (const lesson of allLessons) {
    for (const [, text, url] of body(lesson).matchAll(/\[([^\]]+)\]\((\/worlds\/[^)]+)\)/g)) {
      const target = byUrl.get(url);
      assert.ok(target, `${lesson.file}: bilinmeyen ders linki ${url}`);
      assert.equal(text.replace(/\s+/g, ' '), target.title, `${lesson.file}: "${url}" linkinin metni kanonik ad değil`);
    }
  }
});

test('son ders dışında her ders sonraki derse link verir', () => {
  for (const { slug, lessons } of lessonsByWorld) {
    for (const [i, lesson] of lessons.entries()) {
      const next = lessons[i + 1];
      const text = body({ ...lesson, slug });
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
  }
});

test('her ders kendi oyununun inceleme çağrısıyla biter', () => {
  for (const { slug, lessons } of lessonsByWorld) {
    const { game } = WORLDS[slug];
    for (const lesson of lessons) {
      assert.match(
        body({ ...lesson, slug }).replace(/\s+/g, ' '),
        new RegExp(`\\*\\*“${game} ${lesson.number} denememi değerlendir”\\*\\* yaz; kodunu inceleyelim\\.`),
        `${lesson.file}: inceleme çağrısı yok`,
      );
    }
  }
});
