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
        text: 'World 1 · Pong',
        items: [
          { text: 'Bölüm', link: '/worlds/01-pong/' },
          { text: '1.1 · İlk raketi çiz', link: '/worlds/01-pong/01-first-paddle' },
          { text: '1.2 · Game state', link: '/worlds/01-pong/02-game-state' },
          { text: '1.3 · Player input', link: '/worlds/01-pong/03-player-input' },
          { text: '1.4 · Delta time', link: '/worlds/01-pong/04-delta-time' },
          { text: '1.5 · Ball velocity', link: '/worlds/01-pong/05-ball-velocity' },
          { text: '1.6 · Duvar sekmesi', link: '/worlds/01-pong/06-wall-bounce' },
          { text: '1.7 · Paddle collision', link: '/worlds/01-pong/07-paddle-collision' },
          { text: '1.8 · Collision response', link: '/worlds/01-pong/08-collision-response' },
          { text: '1.9 · Rakip AI', link: '/worlds/01-pong/09-opponent-ai' },
          { text: '1.10 · Skor ve servis', link: '/worlds/01-pong/10-score-and-reset' },
          { text: "1.11 · Servis state'i", link: '/worlds/01-pong/11-serve-state' },
          { text: '1.12 · Maç sonu ve restart', link: '/worlds/01-pong/12-match-over' },
          { text: '1.13 · Update / render', link: '/worlds/01-pong/13-update-render' },
          { text: '1.14 · Debug overlay', link: '/worlds/01-pong/14-debug-overlay' },
          { text: "1.15 · Collision shape'lerini çiz", link: '/worlds/01-pong/15-collision-shapes' },
        ],
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
