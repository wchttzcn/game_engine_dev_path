<script setup lang="ts">
import { computed, onBeforeUnmount, ref, watch } from 'vue';

type AnimationFrame = {
  src: string;
  alt: string;
  label: string;
  duration: number;
};

const props = defineProps<{
  title: string;
  frames: AnimationFrame[];
  showNative?: boolean;
}>();

const activeFrame = ref(0);
const isPlaying = ref(false);
let timer: ReturnType<typeof setTimeout> | undefined;

const currentFrame = computed(() => props.frames[activeFrame.value]);

function clearTimer() {
  if (timer !== undefined) {
    clearTimeout(timer);
    timer = undefined;
  }
}

function scheduleNextFrame() {
  clearTimer();
  if (!isPlaying.value || props.frames.length < 2 || !currentFrame.value) return;

  timer = setTimeout(() => {
    activeFrame.value = (activeFrame.value + 1) % props.frames.length;
    scheduleNextFrame();
  }, currentFrame.value.duration);
}

function togglePlayback() {
  isPlaying.value = !isPlaying.value;
  scheduleNextFrame();
}

function selectFrame(index: number) {
  activeFrame.value = index;
  isPlaying.value = false;
  clearTimer();
}

watch(
  () => props.frames,
  () => {
    activeFrame.value = 0;
    isPlaying.value = false;
    clearTimer();
  },
  { deep: true },
);

onBeforeUnmount(clearTimer);
</script>

<template>
  <section v-if="currentFrame" class="pixel-animation" :aria-label="title">
    <div class="pixel-animation__heading">
      <h3>{{ title }}</h3>
      <button type="button" class="pixel-animation__toggle" :aria-pressed="isPlaying" @click="togglePlayback">
        {{ isPlaying ? 'Durdur' : 'Oynat' }}
      </button>
    </div>

    <div class="pixel-animation__stage">
      <img
        class="pixel-animation__image"
        :src="currentFrame.src"
        :alt="currentFrame.alt"
        width="160"
        height="160"
      />
      <img
        v-if="showNative"
        class="pixel-animation__native"
        :src="currentFrame.src"
        :alt="`${currentFrame.alt}; özgün 8 × 8 piksel boyutu`"
        width="8"
        height="8"
      />
    </div>

    <div class="pixel-animation__frames" role="group" aria-label="Animasyon frame'leri">
      <button
        v-for="(frame, index) in frames"
        :key="`${frame.src}-${index}`"
        type="button"
        class="pixel-animation__frame"
        :class="{ 'pixel-animation__frame--active': index === activeFrame }"
        :aria-pressed="index === activeFrame"
        :aria-label="`Frame ${index + 1}: ${frame.label}, ${frame.duration} milisaniye`"
        @click="selectFrame(index)"
      >
        <img :src="frame.src" :alt="frame.alt" width="32" height="32" />
        <span>{{ index + 1 }} · {{ frame.label }}</span>
        <small>{{ frame.duration }} ms</small>
      </button>
    </div>
  </section>
</template>

<style scoped>
.pixel-animation {
  max-width: 390px;
  margin: 24px 0;
  padding: 16px;
  border: 1px solid var(--vp-c-divider);
  border-radius: 12px;
  background: var(--vp-c-bg-soft);
}
.pixel-animation__heading {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
}
.pixel-animation__heading h3 { margin: 0; font-size: 16px; }
.pixel-animation__toggle,
.pixel-animation__frame {
  border: 1px solid var(--vp-c-divider);
  border-radius: 7px;
  background: var(--vp-c-bg);
  color: var(--vp-c-text-1);
  font: inherit;
  cursor: pointer;
}
.pixel-animation__toggle { padding: 6px 10px; font-size: 14px; }
.pixel-animation__stage {
  display: flex;
  align-items: flex-end;
  justify-content: center;
  gap: 14px;
  min-height: 176px;
  margin: 14px 0;
  padding: 8px;
  background: #1c2823;
  border-radius: 8px;
}
.pixel-animation__image,
.pixel-animation__native,
.pixel-animation__frame img { image-rendering: pixelated; }
.pixel-animation__image {
  width: 160px;
  height: 160px;
  margin: 0;
  background-image: linear-gradient(to right, #486452 1px, transparent 1px),
    linear-gradient(to bottom, #486452 1px, transparent 1px);
  background-size: 20px 20px;
  outline: 1px solid #486452;
}
.pixel-animation__native { width: 8px; height: 8px; margin-bottom: 4px; }
.pixel-animation__frames {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(70px, 1fr));
  gap: 8px;
}
.pixel-animation__frame {
  display: grid;
  justify-items: center;
  gap: 3px;
  min-width: 0;
  padding: 7px 4px;
  font-size: 12px;
  line-height: 1.2;
}
.pixel-animation__frame img { width: 32px; height: 32px; margin: 0; background: #1c2823; }
.pixel-animation__frame small { color: var(--vp-c-text-2); font-size: 11px; }
.pixel-animation__frame--active { border-color: var(--vp-c-brand-1); box-shadow: 0 0 0 1px var(--vp-c-brand-1); }
.pixel-animation__toggle:hover,
.pixel-animation__frame:hover { border-color: var(--vp-c-brand-1); }
.pixel-animation__toggle:focus-visible,
.pixel-animation__frame:focus-visible { outline: 3px solid var(--vp-c-brand-1); outline-offset: 2px; }
@media (max-width: 420px) {
  .pixel-animation { padding: 12px; }
  .pixel-animation__image { width: 128px; height: 128px; background-size: 16px 16px; }
  .pixel-animation__stage { min-height: 144px; }
}
</style>
