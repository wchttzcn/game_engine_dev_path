import DefaultTheme from 'vitepress/theme';
import type { Theme } from 'vitepress';
import AcademyDashboard from './AcademyDashboard.vue';
import CurrentLesson from './CurrentLesson.vue';
import LessonList from './LessonList.vue';
import './style.css';

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    app.component('AcademyDashboard', AcademyDashboard);
    app.component('CurrentLesson', CurrentLesson);
    app.component('LessonList', LessonList);
  },
} satisfies Theme;
