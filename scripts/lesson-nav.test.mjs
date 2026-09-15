import { test } from 'node:test';
import assert from 'node:assert/strict';
import { existsSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

import { WORLDS, pixelArtLessons, repoRootFrom, worldLessons } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);
const body = (lesson) => readFileSync(join(repoRoot, 'academy', `${lesson.url}.md`), 'utf8');

// Her rota kendi adıyla denetlenir; linkler rotalar arasında da çözülebilmeli.
const tracks = [
  ...Object.entries(WORLDS).map(([slug, world]) => ({
    label: world.game,
    subject: 'kodunu',
    lessons: worldLessons(repoRoot, slug),
  })),
  { label: 'Pixel Art', subject: 'çizimini', lessons: pixelArtLessons(repoRoot) },
];
const byUrl = new Map(tracks.flatMap(({ lessons }) => lessons.map((lesson) => [lesson.url, lesson])));

for (const { label, subject, lessons } of tracks) {
  test(`${label}: ders içi ders linkleri kanonik adı taşır`, () => {
    for (const lesson of lessons) {
      for (const [, text, url] of body(lesson).matchAll(/\[([^\]]+)\]\((\/(?:worlds|pixel-art)\/[^)]+)\)/g)) {
        const page = url.split('#')[0];
        // Rehberler ve görseller ders kataloğunun dışında, fakat hedefleri bulunmalı.
        if (!/\/\d{2}-/.test(page)) {
          assert.ok(
            existsSync(join(repoRoot, 'academy', `${page}.md`)) ||
            existsSync(join(repoRoot, 'academy/public', page)),
            `${lesson.file}: bulunamayan destek bağlantısı ${url}`,
          );
          continue;
        }
        const target = byUrl.get(page);
        assert.ok(target, `${lesson.file}: bilinmeyen ders linki ${url}`);
        assert.equal(text.replace(/\s+/g, ' '), target.title, `${lesson.file}: "${url}" linkinin metni kanonik ad değil`);
      }
    }
  });

  test(`${label}: son ders dışında her ders sonraki derse link verir`, () => {
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

  test(`${label}: her ders aynı inceleme çağrısıyla biter`, () => {
    for (const lesson of lessons) {
      assert.match(
        body(lesson).replace(/\s+/g, ' '),
        new RegExp(`\\*\\*“${label} ${lesson.number} denememi değerlendir”\\*\\* yaz; ${subject} inceleyelim\\.`),
        `${lesson.file}: inceleme çağrısı yok`,
      );
    }
  });
}

test('Pixel Art: her derste üç kapalı İpucu bulunur', () => {
  for (const lesson of pixelArtLessons(repoRoot)) {
    const hints = [...body(lesson).matchAll(/^::: details (İpucu [123])(?: — [^\n]+)?\s*$/gm)];
    assert.deepEqual(hints.map((hint) => hint[1]), ['İpucu 1', 'İpucu 2', 'İpucu 3'], lesson.file);
    assert.doesNotMatch(body(lesson), /<details\b[^>]*\bopen\b/, lesson.file);
  }
});
