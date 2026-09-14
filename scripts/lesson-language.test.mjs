// Ders gövdesinin Türkçe yazım kuralları. Frontmatter ve kod blokları kapsam
// dışıdır; denetim yalnız okunan metne bakar.
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

import { bodyLines, codeSpans, pixelArtLessons, repoRootFrom, worldLessons } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);
const lessons = [...worldLessons(repoRoot, '01-pong'), ...pixelArtLessons(repoRoot)];
const lessonBody = (lesson) =>
  bodyLines(readFileSync(join(repoRoot, 'academy', `${lesson.url}.md`), 'utf8'));

const SUFFIX_START = /[A-Za-zÇĞİÖŞÜçğıöşü]/;

test("kod span'ine gelen Türkçe ek kesme işaretiyle bağlanır", () => {
  const missing = [];
  for (const lesson of lessons) {
    for (const { number, text } of lessonBody(lesson)) {
      for (const span of codeSpans(text)) {
        const after = text[span.end];
        if (after && SUFFIX_START.test(after)) {
          missing.push(`${lesson.file}:${number}: ${span.text}${text.slice(span.end).match(/^\S*/)[0]}`);
        }
      }
    }
  }
  assert.deepEqual(missing, [], `kesme işareti eksik:\n${missing.join('\n')}`);
});

test('gövde metni düz tırnak yerine kıvrık tırnak kullanır', () => {
  const straight = [];
  for (const lesson of lessons) {
    for (const { number, text } of lessonBody(lesson)) {
      // HTML attribute'ları yazı değildir; etiketler arasındaki metin denetlenir.
      const prose = text.replace(/<[^>]*>/g, '');
      const spans = codeSpans(prose);
      const outsideCode = [...prose.matchAll(/"/g)].some(
        (match) => !spans.some((span) => match.index >= span.start && match.index < span.end),
      );
      if (outsideCode) straight.push(`${lesson.file}:${number}: ${text.trim()}`);
    }
  }
  assert.deepEqual(straight, [], `düz tırnak kaldı:\n${straight.join('\n')}`);
});
