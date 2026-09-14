<script setup lang="ts">
import { computed } from 'vue';
import { withBase } from 'vitepress';
import gameProgress from '../../../progress/current.json';
import pixelArtProgress from '../../../progress/pixel-art.json';

const props = defineProps<{ track?: 'game' | 'pixel-art' }>();
// Her rota kendi kaydını okur; varsayılan rota oyun geliştirme.
const progress = computed(() => props.track === 'pixel-art' ? pixelArtProgress : gameProgress);
const current = computed(() => progress.value.lessons.find((lesson) => lesson.id === progress.value.currentLessonId));
</script>

<template>
  <div v-if="current" class="current-lesson-callout">
    <p class="eyebrow">ŞİMDİ</p>
    <p class="callout-title">
      <a :href="withBase(current.url)">{{ current.title }}</a>
      <span class="world-tag">{{ current.world }}</span>
    </p>
    <p class="callout-desc">{{ current.description }}</p>
  </div>
</template>

<style scoped>
.current-lesson-callout {
  margin: 24px 0;
  padding: 20px 22px;
  border: 1px solid var(--vp-c-brand-1);
  border-radius: 12px;
  background: linear-gradient(120deg, var(--vp-c-brand-soft), transparent);
}
.current-lesson-callout .eyebrow {
  margin: 0;
  font-size: 11px;
  letter-spacing: 0.14em;
  font-weight: 650;
  color: var(--vp-c-brand-1);
}
.callout-title {
  margin: 8px 0 6px;
  font-size: 19px;
  font-weight: 600;
  letter-spacing: -0.02em;
}
.callout-title a {
  color: var(--vp-c-text-1);
  text-decoration: underline;
  text-underline-offset: 5px;
  text-decoration-color: var(--vp-c-brand-1);
}
.callout-title a:hover { color: var(--vp-c-brand-1); }
.world-tag {
  margin-left: 10px;
  font-size: 12px;
  font-weight: 400;
  color: var(--vp-c-text-2);
}
.callout-desc {
  margin: 0;
  font-size: 14px;
  line-height: 1.7;
  color: var(--vp-c-text-2);
}
</style>
