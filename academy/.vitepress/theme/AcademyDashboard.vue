<script setup lang="ts">
import { computed } from 'vue';
import { withBase } from 'vitepress';
import progress from '../../../progress/current.json';

const current = computed(() => progress.lessons.find((lesson) => lesson.id === progress.currentLessonId));
const completed = computed(() => progress.lessons.filter((lesson) => lesson.status === 'completed').length);
const lessonLabels: Record<string, string> = {
  not_started: 'Başlamaya hazır', in_progress: 'Çalışılıyor',
  review_needed: 'Değerlendirme bekliyor', completed: 'Tamamlandı',
};
const skillLabels: Record<string, string> = {
  unassessed: 'Henüz değerlendirilmedi', learning: 'Öğreniliyor',
  independent: 'Bağımsız uygulanıyor', revisit: 'Tekrar çalışılacak',
};
</script>

<template>
  <div class="academy-dashboard">
    <header class="academy-intro">
      <p class="eyebrow">MÜCAHİT'İN ÇALIŞMA ALANI · ODIN / macOS</p>
      <h1>Oyun yap.<br /><span>Sistemi anla.</span></h1>
      <p class="intro-copy">İlk frame'den kendi motoruna. Belleği, hareketi ve oyun dünyalarının kurallarını yazarak öğren.</p>
    </header>

    <section v-if="current" class="current-lesson" aria-labelledby="current-heading">
      <div>
        <p class="eyebrow">ŞİMDİKİ ODAK</p>
        <p class="world-label">{{ current.world }}</p>
        <h2 id="current-heading">{{ current.title }}</h2>
        <p>{{ current.description }}</p>
        <a class="academy-button" :href="withBase(current.url)">{{ current.status === 'completed' ? 'Dersi tekrar aç' : 'Derse git' }} <span aria-hidden="true">↗</span></a>
      </div>
      <div class="lesson-aside">
        <span class="status-pill">{{ lessonLabels[current.status] }}</span>
        <div class="memory-blocks" aria-hidden="true"><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i></div>
        <p>TAHMİN → ÖLÇÜM → AÇIKLAMA</p>
      </div>
    </section>

    <section class="academy-stats" aria-label="İlerleme özeti">
      <div><strong>{{ completed }} / {{ progress.lessons.length }}</strong><span>Hazır dersler içinde tamamlanan</span></div>
      <div><strong>{{ progress.reviews.length }}</strong><span>Kaydedilmiş değerlendirme</span></div>
      <div><strong>Kendi hızında</strong><span>Takvim yerine yetkinlik</span></div>
    </section>

    <div class="academy-columns">
      <section class="academy-panel" aria-labelledby="skills-heading">
        <p class="eyebrow">KANITLA İLERLE</p>
        <h2 id="skills-heading">Şu an çalışacağın beceriler</h2>
        <ul class="skill-list">
          <li v-for="skill in progress.skills" :key="skill.id"><span>{{ skill.title }}</span><small>{{ skillLabels[skill.status] }}</small></li>
        </ul>
        <p class="panel-note">Dersi bitirmek ve bir beceriyi bağımsız uygulamak ayrı takip edilir.</p>
      </section>
      <section class="academy-panel" aria-labelledby="routine-heading">
        <p class="eyebrow">ÇALIŞMA DÖNGÜN</p>
        <h2 id="routine-heading">Oku. Yaz. Gözlemle.</h2>
        <ol class="routine-list">
          <li><span>01</span>Sohbette veya burada tek görevi oku.</li>
          <li><span>02</span>Editöründe tahminini ve kodunu yaz.</li>
          <li><span>03</span>Ölç, açıkla, değerlendirme iste.</li>
        </ol>
        <a class="text-link" :href="withBase('/workflow')">Çalışma rehberini aç →</a>
      </section>
    </div>

    <section class="academy-next" aria-labelledby="next-heading">
      <div><p class="eyebrow">BİR SONRAKİ OYNANABİLİR HEDEF</p><h2 id="next-heading">Pong · Bir frame'i anlamak</h2><p>Input, zaman, çarpışma. Ardından vuruş hissi, ses ve görsel tepki.</p></div>
      <a class="text-link" :href="withBase('/worlds/01-pong/')">Bölüm planı →</a>
    </section>
    <p class="academy-footnote">{{ progress.lessons.length }} kısa ders hazır. Sohbet ana mentor kanalın; burası isteğe bağlı ders arşivin.</p>
  </div>
</template>
