// Ders adlarının tek kaynağı: her dersin markdown frontmatter'ındaki `title`.
// Sidebar, bölüm planı ve progress kataloğu adı buradan türetir; hiçbiri ders
// adını elle yazmaz.
import { readFileSync, readdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const LESSON_FILE = /^(\d{2})-([a-z0-9-]+)\.md$/;
const TITLE = /^(\d+\.\d+)\s+—\s+(.+)$/;

export const WORLDS = {
  '01-pong': { idPrefix: 'pong', label: 'World 1 · Pong', chapter: 1 },
};

// Bu modülü kullanan dosyalar repo kökünü kendi konumlarından bulur.
export function repoRootFrom(moduleUrl, up) {
  return join(dirname(fileURLToPath(moduleUrl)), ...Array(up).fill('..'));
}

export function parseFrontmatter(source) {
  const match = /^---\r?\n([\s\S]*?)\r?\n---/.exec(source);
  if (!match) return {};
  const fields = {};
  for (const line of match[1].split(/\r?\n/)) {
    const field = /^([A-Za-z_][\w-]*):\s*(.*)$/.exec(line);
    if (!field) continue;
    fields[field[1]] = field[2].trim().replace(/^["'](.*)["']$/, '$1');
  }
  return fields;
}

export function readLessons(dir, idPrefix) {
  const worldSlug = dir.split('/').filter(Boolean).pop();
  return readdirSync(dir)
    .map((file) => ({ file, match: LESSON_FILE.exec(file) }))
    .filter(({ match }) => match !== null)
    .sort((a, b) => a.file.localeCompare(b.file))
    .map(({ file, match }) => {
      const slug = file.replace(/\.md$/, '');
      const frontmatter = parseFrontmatter(readFileSync(join(dir, file), 'utf8'));
      const title = frontmatter.title ?? '';
      const parts = TITLE.exec(title);
      if (!parts) {
        throw new Error(`${file}: frontmatter title "1.N — Ad" biçiminde değil (bulunan: "${title}")`);
      }
      return {
        id: `${idPrefix}-${slug}`,
        file,
        index: Number(match[1]),
        number: parts[1],
        name: parts[2],
        title,
        description: frontmatter.description ?? '',
        section: frontmatter.section ?? '',
        url: `/worlds/${worldSlug}/${slug}`,
      };
    });
}

export function worldLessons(repoRoot, worldSlug) {
  const world = WORLDS[worldSlug];
  if (!world) throw new Error(`Bilinmeyen dünya: ${worldSlug}`);
  return readLessons(join(repoRoot, 'academy/worlds', worldSlug), world.idPrefix);
}

export function allLessons(repoRoot) {
  return Object.entries(WORLDS).flatMap(([worldSlug, world]) =>
    worldLessons(repoRoot, worldSlug).map((lesson) => ({ ...lesson, world: world.label })),
  );
}

// Bölüm planı için dersleri frontmatter'daki `section` sırasına göre gruplar.
export function lessonSections(lessons) {
  const sections = [];
  for (const lesson of lessons) {
    const last = sections[sections.length - 1];
    if (last && last.text === lesson.section) last.items.push(lesson);
    else sections.push({ text: lesson.section, items: [lesson] });
  }
  return sections;
}

// progress/current.json ile frontmatter arasındaki ad/url farkları.
export function progressDrift(lessons, progress) {
  const drift = [];
  const entries = new Map(progress.lessons.map((lesson) => [lesson.id, lesson]));
  for (const lesson of lessons) {
    const entry = entries.get(lesson.id);
    if (!entry) {
      drift.push({ id: lesson.id, field: 'lesson', expected: lesson.title, actual: '(kayıt yok)' });
      continue;
    }
    for (const [field, expected] of [['title', lesson.title], ['url', lesson.url]]) {
      if (entry[field] !== expected) drift.push({ id: lesson.id, field, expected, actual: entry[field] ?? '(boş)' });
    }
  }
  const known = new Set(lessons.map((lesson) => lesson.id));
  for (const entry of progress.lessons) {
    if (!known.has(entry.id)) drift.push({ id: entry.id, field: 'lesson', expected: '(ders dosyası yok)', actual: entry.title });
  }
  return drift;
}
