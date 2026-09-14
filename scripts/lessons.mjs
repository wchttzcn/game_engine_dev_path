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

export const PIXEL_ART = { idPrefix: 'pixel-art', label: "Pixel Art · 8×8 oyun asset'leri" };

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

export function readLessons(dir, idPrefix, urlBase) {
  const worldSlug = dir.split('/').filter(Boolean).pop();
  const base = urlBase ?? `/worlds/${worldSlug}`;
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
        url: `${base}/${slug}`,
      };
    });
}

export function worldLessons(repoRoot, worldSlug) {
  const world = WORLDS[worldSlug];
  if (!world) throw new Error(`Bilinmeyen dünya: ${worldSlug}`);
  return readLessons(join(repoRoot, 'academy/worlds', worldSlug), world.idPrefix);
}

// Yalnız oyun rotası; Pixel Art ayrı progress kataloğunda kalır.
export function allLessons(repoRoot) {
  return Object.entries(WORLDS).flatMap(([worldSlug, world]) =>
    worldLessons(repoRoot, worldSlug).map((lesson) => ({ ...lesson, world: world.label })),
  );
}

export function pixelArtLessons(repoRoot) {
  return readLessons(join(repoRoot, 'academy/pixel-art'), PIXEL_ART.idPrefix, '/pixel-art')
    .map((lesson) => ({ ...lesson, world: PIXEL_ART.label }));
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

// Rotanın progress kataloğu ile frontmatter arasındaki ad/url/bölüm farkları.
export function progressDrift(lessons, progress) {
  const drift = [];
  const entries = new Map(progress.lessons.map((lesson) => [lesson.id, lesson]));
  for (const lesson of lessons) {
    const entry = entries.get(lesson.id);
    if (!entry) {
      drift.push({ id: lesson.id, field: 'lesson', expected: lesson.title, actual: '(kayıt yok)' });
      continue;
    }
    const fields = [['title', lesson.title], ['url', lesson.url]];
    if (lesson.world !== undefined) fields.push(['world', lesson.world]);
    for (const [field, expected] of fields) {
      if (entry[field] !== expected) drift.push({ id: lesson.id, field, expected, actual: entry[field] ?? '(boş)' });
    }
  }
  const known = new Set(lessons.map((lesson) => lesson.id));
  for (const entry of progress.lessons) {
    if (!known.has(entry.id)) drift.push({ id: entry.id, field: 'lesson', expected: '(ders dosyası yok)', actual: entry.title });
  }
  return drift;
}

// Ders gövdesi: frontmatter ve fenced kod blokları çıkarılmış satırlar.
// Dil denetimleri yalnız bu satırlarda çalışır; kod dokunulmaz kalır.
export function bodyLines(source) {
  const lines = source.split(/\r?\n/);
  const body = [];
  let i = 0;
  if (lines[0] === '---') {
    i = 1;
    while (i < lines.length && lines[i] !== '---') i += 1;
    i += 1;
  }
  let inFence = false;
  for (; i < lines.length; i += 1) {
    if (/^\s*```/.test(lines[i])) {
      inFence = !inFence;
      continue;
    }
    if (!inFence) body.push({ number: i + 1, text: lines[i] });
  }
  return body;
}

// Satırdaki inline kod span'leri; dil denetimleri span içini okumaz.
export function codeSpans(line) {
  return [...line.matchAll(/`[^`]*`/g)].map((match) => ({
    start: match.index,
    end: match.index + match[0].length,
    text: match[0],
  }));
}
