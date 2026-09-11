import { defineConfig } from 'vitepress';

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
      { text: 'Yol haritası', link: '/roadmap' },
      { text: 'Nasıl çalışır?', link: '/workflow' },
    ],
    sidebar: [
      {
        text: 'Başlangıç',
        items: [
          { text: 'Çalışma düzeni', link: '/workflow' },
          { text: 'Yol haritası', link: '/roadmap' },
        ],
      },
      {
        text: 'World 0 · Systems',
        items: [
          { text: 'Bölüm planı', link: '/worlds/00-systems/' },
          { text: '0.1 · Bellek yerleşimi', link: '/worlds/00-systems/01-memory-layout' },
          { text: '0.2 · Alan sırasını değiştir', link: '/worlds/00-systems/02-field-order' },
          { text: '0.3 · 100.000 merminin maliyeti', link: '/worlds/00-systems/03-memory-budget' },
        ],
      },
      {
        text: 'Sıradaki dünya',
        items: [{ text: 'World 1 · Pong — plan', link: '/worlds/01-pong/' }],
      },
    ],
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
