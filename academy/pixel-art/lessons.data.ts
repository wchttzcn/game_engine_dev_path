import { defineLoader } from 'vitepress';
import type { LessonSection } from '../worlds/01-pong/lessons.data.js';

// @ts-expect-error - düz Node modülü, tip bildirimi taşımaz.
import { lessonSections, pixelArtLessons, repoRootFrom } from '../../scripts/lessons.mjs';

declare const data: LessonSection[];
export { data };

const repoRoot = repoRootFrom(import.meta.url, 2);

export default defineLoader({
  watch: ['./*.md'],
  load(): LessonSection[] {
    return lessonSections(pixelArtLessons(repoRoot));
  },
});
