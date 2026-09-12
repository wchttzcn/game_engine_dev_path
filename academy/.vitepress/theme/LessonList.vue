<script setup lang="ts">
import { withBase } from 'vitepress';
// Ders adları frontmatter'dan gelir; bu liste hiçbir adı elle taşımaz.
import { data as sections } from '../../worlds/01-pong/lessons.data.js';
</script>

<template>
  <template v-for="section in sections" :key="section.text">
    <h3>{{ section.text }}</h3>
    <ul class="lesson-list">
      <li v-for="lesson in section.items" :key="lesson.id">
        <a :href="withBase(lesson.url)">{{ lesson.title }}</a>
      </li>
    </ul>
  </template>
</template>

<style scoped>
.lesson-list {
  margin: 16px 0;
  padding-left: 0;
  line-height: 2;
  list-style: none;
}
.lesson-list a {
  color: var(--vp-c-text-1);
  text-decoration: underline;
  text-underline-offset: 4px;
  text-decoration-color: var(--vp-c-divider);
}
.lesson-list a:hover { color: var(--vp-c-brand-1); text-decoration-color: var(--vp-c-brand-1); }
</style>
