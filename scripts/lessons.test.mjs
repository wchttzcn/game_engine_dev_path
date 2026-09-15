import { test } from 'node:test';
import assert from 'node:assert/strict';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

import { WORLDS, allLessons, parseFrontmatter, pixelArtLessons, readLessons, worldLessons, progressDrift } from './lessons.mjs';

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
  for (const [slug, world] of Object.entries(WORLDS)) {
    for (const lesson of worldLessons(repoRoot, slug)) {
      assert.equal(lesson.number, `${world.chapter}.${lesson.index}`, `${lesson.file} numarası başlıkla uyuşmuyor`);
      assert.ok(lesson.name.length > 0, `${lesson.file} adsız`);
      assert.ok(lesson.section, `${lesson.file} section frontmatter'ı yok`);
    }
  }
  for (const lesson of pixelArtLessons(repoRoot)) {
    assert.equal(lesson.number, `1.${lesson.index}`, `${lesson.file} numarası başlıkla uyuşmuyor`);
    assert.ok(lesson.name.length > 0, `${lesson.file} adsız`);
    assert.ok(lesson.section, `${lesson.file} section frontmatter'ı yok`);
  }
});

test('progress catalogue titles match the lesson frontmatter', async () => {
  const progress = JSON.parse(await (await import('node:fs/promises')).readFile(join(repoRoot, 'progress/current.json'), 'utf8'));
  assert.deepEqual(progressDrift(allLessons(repoRoot), progress), []);
});

test('Pixel Art uses a separate route, namespace and progress catalogue', async () => {
  const lessons = pixelArtLessons(repoRoot);
  const progress = JSON.parse(await (await import('node:fs/promises')).readFile(join(repoRoot, 'progress/pixel-art.json'), 'utf8'));
  assert.equal(lessons.length, 86);
  assert.equal(lessons[0].id, 'pixel-art-01-silhouette');
  assert.equal(lessons[0].url, '/pixel-art/01-silhouette');
  assert.deepEqual(progressDrift(lessons, progress), []);
  assert.ok(lessons.some((lesson) => lesson.id === progress.currentLessonId));
  const gameIds = new Set(allLessons(repoRoot).map((lesson) => lesson.id));
  assert.ok(lessons.every((lesson) => !gameIds.has(lesson.id)));
  assert.ok(allLessons(repoRoot).every((lesson) => lesson.url.startsWith('/worlds/')));
});

test('Pixel Art drift catches titles, URLs, pack labels and foreign entries', () => {
  const lesson = pixelArtLessons(repoRoot)[0];
  const progress = { lessons: [{ ...lesson, title: 'Eski ad', url: '/old', world: 'Eski bölüm' }] };
  assert.deepEqual(progressDrift([lesson], progress).map((item) => item.field), ['title', 'url', 'world']);
  progress.lessons.push(allLessons(repoRoot)[0]);
  assert.ok(progressDrift([lesson], progress).some((item) => item.field === 'lesson' && item.id.startsWith('pong-')));
});
