// Ders biçimi sözleşmesi: bölüm sırası, kelime bütçesi, ipucu sayısı.
// Kod blokları bütçeye girmez — `bodyLines` onları zaten ayıklar, çünkü ders
// gövdesindeki struct ve imzalar bilinçli olarak oradadır.
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

import { bodyLines, repoRootFrom, worldLessons } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);

// Biçim 3.8'de başlıyor. Yalnız buradaki ders numaraları denetlenir; eski
// biçimdeki dersler dokunulmadan kalır. Bir ders yeni biçime çevrildiğinde
// numarası bu listeye eklenir — liste, biçimin nereye kadar yayıldığının kaydı.
const SHAPED = { '03-breakout': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] };

const REQUIRED = ['Görev', 'Ne zaman bitti?', 'Elindekiler', 'Sınırlar', 'Kaynak'];
const OPTIONAL_LAST = 'Daha derine';
const FORBIDDEN = ['Bilmen gereken küçük parça', 'Birincil kaynak', 'Deep Dive'];

const WORD_CAP = {
  'Görev': 60,
  'Elindekiler': 150,
  'Sınırlar': 60,
  'İpucu 1': 80,
  'İpucu 2': 80,
  'İpucu 3': 80,
  'Daha derine': 200,
};
const TOTAL_CAP = 600;
const DONE_BULLET_CAP = 7;

const shaped = Object.entries(SHAPED).flatMap(([slug, numbers]) =>
  worldLessons(repoRoot, slug).filter((lesson) => numbers.includes(lesson.index)),
);

// Dersi bölümlere ayırır: `## Başlık` ve `::: details Başlık` birer bölümdür.
// Başlık/işaret satırları kendi bölümlerinin kelime sayısına dahil edilmez.
function sections(source) {
  const found = [];
  let section = null;
  let outer = null;
  for (const { text } of bodyLines(source)) {
    const heading = /^##\s+(.+?)\s*$/.exec(text);
    const details = /^:::\s*details\s+(.+?)\s*$/.exec(text);
    if (heading) {
      section = { name: heading[1], words: 0, bullets: 0, details: 0 };
      outer = section;
      found.push(section);
      continue;
    }
    if (details) {
      if (outer) outer.details += 1;
      section = { name: details[1], words: 0, bullets: 0, details: 0 };
      found.push(section);
      continue;
    }
    if (/^:::\s*$/.test(text)) {
      section = outer;
      continue;
    }
    const words = text.trim().split(/\s+/).filter(Boolean).length;
    if (section) {
      section.words += words;
      if (/^\s*[-*]\s+/.test(text)) section.bullets += 1;
    } else {
      // Başlıktan önceki metin: H1 ve **Hedef:** satırı.
      found.push({ name: '(giriş)', words, bullets: 0, details: 0 });
    }
  }
  return found;
}

// `İpucu 2 — Doğurma olasılığı` gibi başlıkları bütçe anahtarına indirger.
const capKey = (name) => name.split('—')[0].trim();

const lessonSections = (lesson) =>
  sections(readFileSync(join(repoRoot, 'academy', `${lesson.url}.md`), 'utf8'));

test('zorunlu bölümler doğru sırada', () => {
  const problems = [];
  for (const lesson of shaped) {
    const headings = lessonSections(lesson)
      .map((section) => section.name)
      .filter((name) => REQUIRED.includes(name) || name === OPTIONAL_LAST);
    const expected = [...REQUIRED];
    if (headings.includes(OPTIONAL_LAST)) expected.push(OPTIONAL_LAST);
    if (headings.join(' > ') !== expected.join(' > ')) {
      problems.push(`${lesson.file}: beklenen "${expected.join(' > ')}", bulunan "${headings.join(' > ')}"`);
    }
  }
  assert.deepEqual(problems, [], `bölüm sırası bozuk:\n${problems.join('\n')}`);
});

test('eski biçimin başlıkları kalmamış', () => {
  const problems = [];
  for (const lesson of shaped) {
    for (const { name } of lessonSections(lesson)) {
      if (FORBIDDEN.some((bad) => name.startsWith(bad))) problems.push(`${lesson.file}: "${name}"`);
    }
  }
  assert.deepEqual(problems, [], `eski biçim başlığı:\n${problems.join('\n')}`);
});

test('tam üç ipucu var, numaraları sırayla', () => {
  const problems = [];
  for (const lesson of shaped) {
    const hints = lessonSections(lesson)
      .map((section) => section.name)
      .filter((name) => name.startsWith('İpucu'));
    const numbers = hints.map((name) => capKey(name));
    if (numbers.join(',') !== 'İpucu 1,İpucu 2,İpucu 3') {
      problems.push(`${lesson.file}: bulunan "${numbers.join(', ') || '(yok)'}"`);
    }
  }
  assert.deepEqual(problems, [], `ipucu sayısı/sırası yanlış:\n${problems.join('\n')}`);
});

test('bölüm kelime tavanları aşılmamış', () => {
  const problems = [];
  for (const lesson of shaped) {
    for (const section of lessonSections(lesson)) {
      const cap = WORD_CAP[capKey(section.name)];
      if (cap !== undefined && section.words > cap) {
        problems.push(`${lesson.file}: "${section.name}" ${section.words} kelime (tavan ${cap})`);
      }
    }
  }
  assert.deepEqual(problems, [], `bölüm tavanı aşıldı:\n${problems.join('\n')}`);
});

test('ders toplamı bütçe içinde', () => {
  const problems = [];
  for (const lesson of shaped) {
    const total = lessonSections(lesson).reduce((sum, section) => sum + section.words, 0);
    if (total > TOTAL_CAP) problems.push(`${lesson.file}: ${total} kelime (tavan ${TOTAL_CAP})`);
  }
  assert.deepEqual(problems, [], `ders toplamı aşıldı — dersi ikiye bölmek gerekir:\n${problems.join('\n')}`);
});

test('kabul koşulu madde sayısı sınırlı', () => {
  const problems = [];
  for (const lesson of shaped) {
    for (const section of lessonSections(lesson)) {
      if (section.name === 'Ne zaman bitti?' && section.bullets > DONE_BULLET_CAP) {
        problems.push(`${lesson.file}: ${section.bullets} madde (tavan ${DONE_BULLET_CAP})`);
      }
    }
  }
  assert.deepEqual(problems, [], `kabul koşulu çok uzun:\n${problems.join('\n')}`);
});
