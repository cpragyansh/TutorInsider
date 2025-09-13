<!--
WhyChooseUs.vue
Vue 3 single-file component that recreates the "Why Choose Us?" section shown in the uploaded image.

How to use:
1. Save this file as `src/components/WhyChooseUs.vue`.
2. Import and use it inside any view or layout, e.g.
   import WhyChooseUs from '@/components/WhyChooseUs.vue'
   components: { WhyChooseUs }
   <WhyChooseUs />

Notes:
- The component is self-contained (fonts imported inside the <style> block).
- It's responsive: 3 columns on desktop, 2 columns on medium screens, 1 column on small screens.
- Icons are embedded SVGs and colored to match the sample.
- You can customize text, colors, spacing from the `features` array in the <script> section.
-->

<template>
  <section class="why-section">
    <div class="wrap">
      <h2 class="heading">Why Choose Us?</h2>

      <div class="features-grid">
        <article v-for="(f, i) in features" :key="i" class="feature">
          <div class="icon-wrap" :style="{ '--bg': f.bg, '--ring': f.ring }">
            <div class="icon-inner" v-html="f.svg"></div>
          </div>

          <h3 class="feature-title">{{ f.title }}</h3>
          <p class="feature-desc">{{ f.desc }}</p>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'WhyChooseUs',
  data() {
    return {
      features: [
        {
          title: 'Learn At Home',
          desc:
            'Study from the comfort of your home with our flexible online learning programs. Learn anytime, anywhere — at your own pace.',
          bg: '#0b85ff',
          ring: 'rgba(11,133,255,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M3 11.5L12 4l9 7.5" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M9 22V12h6v10" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`
        },
        {
          title: 'Female Tutor for Female Students',
          desc:
            'Get guidance from expert female tutors who understand the unique needs of female students. Our tutors provide a comfortable and encouraging learning environment tailored for academic and personal growth.',
          bg: '#ff6f8c',
          ring: 'rgba(255,111,140,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <circle cx="12" cy="7" r="3" fill="white" />
              <path d="M6 21c0-3 4-5 6-5s6 2 6 5" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`
        },
        {
          title: 'Real Time Discussions',
          desc:
            'Engage in live discussions with tutors and peers. Get instant answers to your questions and enjoy interactive, collaborative learning.',
          bg: '#b97bff',
          ring: 'rgba(185,123,255,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" stroke="white" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`
        },
        {
          title: 'Strong Base of Skilled Tutors',
          desc:
            "We pride ourselves on a powerful network of highly skilled and passionate educators. Whether it's academics, extracurriculars, or life skills — our community helps learners grow in every direction.",
          bg: '#7ed9f6',
          ring: 'rgba(126,217,246,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M17 21v-2a4 4 0 0 0-4-4H11a4 4 0 0 0-4 4v2" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              <circle cx="12" cy="7" r="4" fill="white" opacity="0.12"/>
              <circle cx="12" cy="7" r="2.2" fill="white" />
            </svg>`
        },
        {
          title: 'Expert Tutors',
          desc:
            'Learn from highly qualified and experienced tutors who provide personalized guidance and are dedicated to your success.',
          bg: '#f7d36b',
          ring: 'rgba(247,211,107,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 17l-5 3 1-5-4-3 5-1 2-5 2 5 5 1-4 3 1 5z" fill="white"/>
            </svg>`
        },
        {
          title: 'Learn All Skills, Not Just Subjects',
          desc:
            'We go beyond traditional academics. Our tutors offer training in coding, arts, music, communication, creative writing, public speaking, life skills, and more — empowering students to excel in all areas of life.',
          bg: '#9bdc98',
          ring: 'rgba(155,220,152,0.12)',
          svg: `
            <svg width="34" height="34" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <rect x="3" y="7" width="18" height="11" rx="2" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
              <path d="M8 10v-2a2 2 0 0 1 2-2h4" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>`
        }
      ]
    }
  }
}
</script>

<style scoped>
/* Google fonts (matches the design) */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;700&family=Open+Sans:wght@300;400&display=swap');

:root{
  --container: 1180px;
}

.why-section{
  background: #ffffff;
  padding: 64px 18px 84px;
}

.wrap{
  max-width: 60vw;
  margin: 0 auto;
  padding: 0 20px;
}

.heading{
  font-family: 'Poppins', sans-serif;
  font-size: 48px;
  color: #193045;
  text-align: center;
  margin-bottom: 52px;
}

.features-grid{
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 48px 64px;
}

.feature{
  text-align: left;
  min-height: 220px;
}

.icon-wrap{
  width: 84px;
  height: 84px;
  border-radius: 50%;
  margin-bottom: 22px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 0; /* align left within column */
  box-shadow: 0 6px 18px rgba(34,34,34,0.04);
  border: 6px solid rgba(255,255,255,0.85);
  /* background color from inline style --bg */
  background: var(--bg, #0b85ff);
}

.icon-inner svg{ display:block; }

.feature-title{
  font-family: 'Poppins', sans-serif;
  font-size: 16px;
  font-weight: 700;
  color: #142433;
  margin: 0 0 12px;
}

.feature-desc{
  font-family: 'Open Sans', sans-serif;
  font-size: 14px;
  line-height: 1.8;
  color: #6b6f72;
  margin: 0;
}

/* center the icon within the column like the reference — use a small left offset on larger screens */
@media (min-width: 1000px){
  .feature{ padding-left: 12px; }
  .icon-wrap{ margin-left: 32px; }
}

/* Responsiveness */
@media (max-width: 992px){
  .features-grid{ grid-template-columns: repeat(2, 1fr); gap: 36px 40px; }
  .heading{ font-size: 40px; margin-bottom: 40px; }
  .icon-wrap{ width:72px; height:72px; }
}

@media (max-width: 640px){
  .features-grid{ grid-template-columns: 1fr; gap: 28px 20px; }
  .heading{ font-size: 32px; }
  .icon-wrap{ margin-left: 0; }
}

</style>
