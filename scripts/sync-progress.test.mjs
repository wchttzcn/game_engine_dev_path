import { test } from 'node:test';
import assert from 'node:assert/strict';
import { copyFileSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { spawnSync } from 'node:child_process';

import { repoRootFrom } from './lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 1);

function fixture(t) {
  const root = mkdtempSync(join(tmpdir(), 'academy-sync-'));
  t.after(() => rmSync(root, { recursive: true, force: true }));
  for (const dir of ['scripts', 'progress', 'academy/worlds/01-pong', 'academy/pixel-art']) {
    mkdirSync(join(root, dir), { recursive: true });
  }
  for (const file of ['lessons.mjs', 'sync-progress.mjs']) {
    copyFileSync(join(repoRoot, 'scripts', file), join(root, 'scripts', file));
  }
  const game = JSON.parse(readFileSync(join(repoRoot, 'progress/current.json'), 'utf8'));
  const art = JSON.parse(readFileSync(join(repoRoot, 'progress/pixel-art.json'), 'utf8'));
  for (const progress of [game, art]) {
    for (const lesson of progress.lessons) {
      copyFileSync(join(repoRoot, 'academy', `${lesson.url}.md`), join(root, 'academy', `${lesson.url}.md`));
    }
  }
  const write = (file, progress) => writeFileSync(join(root, 'progress', file), `${JSON.stringify(progress, null, 2)}\n`);
  const read = (file) => readFileSync(join(root, 'progress', file), 'utf8');
  const run = (...args) => spawnSync(process.execPath, [join(root, 'scripts/sync-progress.mjs'), ...args], { encoding: 'utf8' });
  write('current.json', game);
  write('pixel-art.json', art);
  return { game, art, write, read, run };
}

test('sync checks both tracks and preserves learner state when repairing art metadata', (t) => {
  const { game, art, write, read, run } = fixture(t);
  art.currentLessonId = art.lessons[1].id;
  art.lessons[0].status = 'completed';
  art.lessons[1].status = 'review_needed';
  art.skills = [{ id: 'silhouette', status: 'learning', lessons: [art.lessons[0].id], note: 'Test', lastRecallAt: null }];
  const canonical = structuredClone(art);
  art.lessons[0].title = 'Eski ad';
  art.lessons[0].url = '/old';
  art.lessons[0].world = 'Eski bölüm';
  write('pixel-art.json', art);
  const gameBefore = read('current.json');
  const artBefore = read('pixel-art.json');
  const check = run('--check');
  assert.equal(check.status, 1, check.stderr);
  assert.equal(read('current.json'), gameBefore);
  assert.equal(read('pixel-art.json'), artBefore);
  const sync = run();
  assert.equal(sync.status, 0, sync.stderr);
  assert.equal(read('current.json'), gameBefore);
  assert.deepEqual(JSON.parse(read('current.json')), game);
  assert.deepEqual(JSON.parse(read('pixel-art.json')), canonical);
  assert.equal(run('--check').status, 0);
});

test('sync refuses mixed catalogues before writing either progress file', (t) => {
  const { game, art, write, read, run } = fixture(t);
  game.lessons[0].title = 'Eski oyun adı';
  art.lessons.push(structuredClone(game.lessons[0]));
  write('current.json', game);
  write('pixel-art.json', art);
  const gameBefore = read('current.json');
  const artBefore = read('pixel-art.json');
  const sync = run();
  assert.equal(sync.status, 1);
  assert.match(sync.stderr, /Katalog ile ders dosyaları eşleşmiyor/);
  assert.equal(read('current.json'), gameBefore);
  assert.equal(read('pixel-art.json'), artBefore);
});
