import { test } from 'node:test';
import assert from 'node:assert/strict';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

import { parseFrontmatter, readLessons, worldLessons, progressDrift } from './lessons.mjs';

const repoRoot = join(dirname(fileURLToPath(import.meta.url)), '..');

test('parseFrontmatter reads quoted and bare values', () => {
  const fm = parseFrontmatter(['---', 'title: "1.1 — İlk raketi çiz"', 'section: Temel hareket', 'next: false', '---', '', '# Body'].join('\n'));
  assert.equal(fm.title, '1.1 — İlk raketi çiz');
  assert.equal(fm.section, 'Temel hareket');
  assert.equal(fm.next, 'false');
});

test('parseFrontmatter returns empty object without frontmatter', () => {
  assert.deepEqual(parseFrontmatter('# Başlık\n'), {});
});

test('readLessons orders lessons by file number and derives id, url, name', () => {
  const lessons = readLessons(join(repoRoot, 'academy/worlds/01-pong'), 'pong');
  assert.ok(lessons.length >= 15);
  assert.deepEqual(
    lessons.map((lesson) => lesson.index),
    lessons.map((_, i) => i + 1),
  );
  const third = lessons[2];
  assert.equal(third.id, 'pong-03-player-input');
  assert.equal(third.url, '/worlds/01-pong/03-player-input');
  assert.equal(third.title, `${third.number} — ${third.name}`);
});

test('every lesson title carries its own number and a section', () => {
  for (const lesson of worldLessons(repoRoot, '01-pong')) {
    assert.equal(lesson.number, `1.${lesson.index}`, `${lesson.file} numarası başlıkla uyuşmuyor`);
    assert.ok(lesson.name.length > 0, `${lesson.file} adsız`);
    assert.ok(lesson.section, `${lesson.file} section frontmatter'ı yok`);
  }
});

test('progress catalogue titles match the lesson frontmatter', async () => {
  const progress = JSON.parse(await (await import('node:fs/promises')).readFile(join(repoRoot, 'progress/current.json'), 'utf8'));
  assert.deepEqual(progressDrift(worldLessons(repoRoot, '01-pong'), progress), []);
});
