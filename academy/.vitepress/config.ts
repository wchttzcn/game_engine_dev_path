import { defineConfig } from 'vitepress';

// @ts-expect-error - düz Node modülü, tip bildirimi taşımaz.
import { WORLDS, lessonSections, pixelArtLessons, repoRootFrom, worldLessons } from '../../scripts/lessons.mjs';

const repoRoot = repoRootFrom(import.meta.url, 2);

// Sidebar başlıkları ders frontmatter'ındaki `title` alanından gelir; burada
// elle yazılan bir ders adı yok.
function worldSidebar(worldSlug: string) {
  return {
    text: WORLDS[worldSlug].label,
    // `collapsed: true` grubu katlanabilir yapar ve kapalı açar. VitePress aktif
    // link'i içeren grubu kendisi açtığı için okuduğun dünya hep açık gelir.
    collapsed: true,
    items: [
      { text: 'Bölüm', link: `/worlds/${worldSlug}/` },
      ...worldLessons(repoRoot, worldSlug).map((lesson) => ({ text: lesson.title, link: lesson.url })),
    ],
  };
}

export default defineConfig({
  lang: 'tr-TR',
  title: 'Engine Academy',
  description: 'Mücahit için Odin, oyun sistemleri ve motor geliştirme rotası.',
  cleanUrls: true,
  appearance: 'dark',
  lastUpdated: false,
  themeConfig: {
    siteTitle: 'ENGINE ACADEMY',
    nav: [
      { text: 'Çalışma alanı', link: '/' },
      { text: 'Pixel Art', link: '/pixel-art/' },
      { text: 'Yol haritası', link: '/roadmap' },
      { text: 'Nasıl çalışır?', link: '/workflow' },
    ],
    sidebar: {
      '/pixel-art/': [
        {
          text: 'Pixel Art / Aseprite',
          items: [
            { text: 'Çalışma alanı', link: '/pixel-art/' },
            { text: 'Yol haritası', link: '/pixel-art/roadmap' },
            { text: 'Renk seçimi rehberi', link: '/pixel-art/color-guide' },
            { text: 'Klavyeyle renk değiştir', link: '/pixel-art/color-keys' },
            { text: 'Skill fikirleri', link: '/pixel-art/skill-guide' },
            { text: 'Idle RPG görsel seti', link: '/pixel-art/idle-kit' },
          ],
        },
        ...lessonSections(pixelArtLessons(repoRoot)).map((section) => ({
          text: section.text,
          collapsed: true,
          items: section.items.map((lesson) => ({ text: lesson.title, link: lesson.url })),
        })),
      ],
      '/': [
        {
          text: 'Başlangıç',
          collapsed: false,
          items: [
            { text: 'Çalışma düzeni', link: '/workflow' },
            { text: 'Yol haritası', link: '/roadmap' },
          ],
        },
        worldSidebar('01-pong'),
        worldSidebar('02-snake'),
      ],
    },
    outline: { level: [2, 3], label: 'Bu derste' },
    docFooter: { prev: 'Önceki', next: 'Sonraki' },
    darkModeSwitchLabel: 'Görünüm',
    darkModeSwitchTitle: 'Koyu görünüme geç',
    lightModeSwitchTitle: 'Açık görünüme geç',
    sidebarMenuLabel: 'Dersler',
    returnToTopLabel: 'Başa dön',
    search: { provider: 'local' },
    footer: { message: 'Odin ile öğren. Oyunla dene. Ölçerek geliştir.' },
  },
});
