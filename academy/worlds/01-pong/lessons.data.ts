import { defineLoader } from 'vitepress';

// @ts-expect-error - düz Node modülü, tip bildirimi taşımaz.
import { lessonSections, repoRootFrom, worldLessons } from '../../../scripts/lessons.mjs';

export interface LessonSection {
  text: string;
  items: { id: string; title: string; url: string }[];
}

declare const data: LessonSection[];
export { data };

const repoRoot = repoRootFrom(import.meta.url, 3);

export default defineLoader({
  watch: ['./*.md'],
  load(): LessonSection[] {
    return lessonSections(worldLessons(repoRoot, '01-pong'));
  },
});
