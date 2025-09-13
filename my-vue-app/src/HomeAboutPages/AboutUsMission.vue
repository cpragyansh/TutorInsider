<!--
MissionSection.vue
Vue 3 single-file component that reproduces the provided "Mission" design section.

How to use:
1. Save this file as `src/components/MissionSection.vue`.
2. Add the mission image to `src/assets/mission-photo.png` (or update the <img> src path in the template).
   - Example: place the provided image from the conversation at `src/assets/mission-photo.png`.
3. Import & use in any view: `import MissionSection from '@/components/MissionSection.vue'` then add `<MissionSection/>`.

Notes:
- The component is responsive: two-column layout on large screens, stacked on small screens.
- Fonts (Poppins + Merriweather) are imported in the style block to match the sample.
- The top and bottom background waves are SVGs positioned absolutely to mimic the curved shapes from the design.
- Tweak CSS variables at the top of the style block to change colors/spacing.
-->

<template>
  <section class="mission-section">
    <!-- decorative top wave -->
    <svg class="wave top-wave" viewBox="0 0 1440 200" preserveAspectRatio="none" aria-hidden="true">
      <path d="M0,64 C220,180 440,10 720,48 C1000,86 1220,180 1440,96 L1440 0 L0 0 Z" fill="#f6f7f7"></path>
    </svg>

    <div class="container">
      <div class="grid">
        <!-- Left: heading + paragraphs + image -->
        <div class="left">
          <h2 class="title">Mission</h2>

          <div class="lead">
            <p>
              To create a seamless and trusted connection between families and educators, fostering a nurturing environment where children can grow academically, emotionally, and socially.
            </p>

            <p>
              We aim to empower every learner by providing access to skilled mentors who support not only subject learning but also essential life skills — ensuring well-rounded and confident individuals for the future.
            </p>
          </div>

          <div class="photo-wrap" aria-hidden="true">
            <!-- Update src to point to your local asset if needed -->
            <img src="https://tutorinsider.com/wp-content/uploads/2025/05/Mission.png" alt="Teacher and students reading together" class="photo" />
          </div>
        </div>

        <!-- Right: floating card -->
        <aside class="belief-card" aria-labelledby="beliefs-title">
          <h3 id="beliefs-title" class="card-title">What We Believe</h3>

          <ul class="belief-list">
            <li>Every child deserves quality education</li>
            <li>Every child learns differently</li>
            <li>Support should be accessible, inclusive, and safe</li>
          </ul>
        </aside>
      </div>
    </div>

    <!-- decorative bottom wave -->
    <svg class="wave bottom-wave" viewBox="0 0 1440 200" preserveAspectRatio="none" aria-hidden="true">
      <path d="M0,96 C200,10 420,170 720,140 C1020,110 1240,10 1440,96 L1440 200 L0 200 Z" fill="#f6f7f7" opacity="1"></path>
    </svg>
  </section>
</template>

<script>
export default {
  name: 'MissionSection'
};
</script>

<style scoped>
/* fonts */
@import url('https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400&family=Poppins:wght@600;700&display=swap');

:root{
  --container: 1180px;
  --bg: #ffffff;
  --muted-bg: #f6f7f7;
  --heading-color: #142433;
  --text-color: #56606a;
  --card-shadow: 0 10px 30px rgba(20,40,50,0.07);
  --accent-orb: #f7941d;
}

.mission-section{
  position: relative;
  background: var(--bg);
  overflow: hidden;
  padding: 64px 18px 120px; /* extra bottom space so bottom wave doesn't overlap content */
}

/* waves */
.wave{
  position: absolute;
  left: 0;
  width: 100%;
  height: 160px;
  pointer-events: none;
}
.top-wave{ top: -58px; transform: translateZ(0); }
.bottom-wave{ bottom: -40px; transform: translateZ(0); }

.container{
  max-width:50vw;
  margin: 0 auto;
  padding: 0 20px;
}

.grid{
  display: grid;
  grid-template-columns: 1fr 420px; /* left flexible, right fixed width to match sample card */
  gap: 36px 48px;
  align-items: start;
}

/* LEFT */
.left{
  padding-right: 18px;
}

.title{
  font-family: 'Poppins', sans-serif;
  font-size: 56px;
  line-height: 1;
  margin: 6px 0 22px;
  color: var(--heading-color);
}

.lead p{
  font-family: 'Merriweather', serif;
  font-size: 15.5px;
  color: var(--text-color);
  line-height: 1.85;
  margin: 0 0 16px;
}

.photo-wrap{
  margin-top: 22px;
  display: flex;
}

.photo{
  width: 520px; /* large image width like sample */
  max-width: 100%;
  height: auto;
  display: block;
  border-radius: 4px;
  box-shadow: 0 12px 36px rgba(20,40,50,0.06);
}

/* RIGHT: floating card */
.belief-card{
  background: #fff;
  border-radius: 12px;
  padding: 26px 30px;
  box-shadow: var(--card-shadow);
  border: 1px solid rgba(18,42,60,0.04);
  transform: translateY(-28px); /* float slightly up like the sample */
}

.card-title{
  font-family: 'Poppins', sans-serif;
  font-size: 18px;
  margin: 4px 0 18px;
  color: var(--heading-color);
}

.belief-list{
  list-style: disc;
  padding: 0;
  margin: 0;
}
.belief-list li::marker {
  color: orange; /* set bullet color */
  font-size: 1.2em; /* optional: adjust bullet size */
}

.belief-list li{
  position: relative;
  padding-left: 18px;
  margin-bottom: 14px;
  font-family: 'Merriweather', serif;
  color: var(--text-color);
  font-size: 14px;
  line-height: 1.9;
}

/* orange dot */
.belief-list li::before{
  content: '';
  position: absolute;
  left: 0;
  top: 10px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--accent-orb);
}

/* Responsive adjustments */
@media (max-width: 1100px){
  .grid{ grid-template-columns: 1fr 360px; }
  .photo{ width: 440px; }
}

@media (max-width: 880px){
  .grid{ grid-template-columns: 1fr; }
  .belief-card{ transform: none; margin-top: 22px; }
  .photo{ width: 100%; max-width: 540px; }
  .title{ font-size: 44px; }
}

@media (max-width: 560px){
  .mission-section{ padding: 36px 12px 80px; }
  .title{ font-size: 34px; }
  .lead p{ font-size: 15px; }
  .photo{ width: 100%; }
  .belief-card{ padding: 20px; }
}

</style>
