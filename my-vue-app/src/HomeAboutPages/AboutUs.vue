<!--
AboutTutoring.vue
Single-file Vue component (Vue 3) that reproduces the provided design.

How to use:
1. Save this file as `src/components/AboutTutoring.vue` in your Vue project.
2. Put the provided image file into `src/assets/tutor.png` (or update the <img> src to your path).
   The original image from this chat is available at: /mnt/data/a78a6ff3-fd51-4c13-8785-577da44292bf.png
3. This component uses Google Fonts (Poppins + Merriweather) — it already imports them in the <style> block.
4. It's responsive: on large screens it shows two columns (text left, image right); on small screens it stacks.

If you want a Tailwind version instead, tell me and I'll convert it.
-->

<template>
  <section class="about-section">
    <div class="inner">
      <div class="grid">
        <!-- LEFT: text content -->
        <div class="col text-col">
          <div class="kicker">
            <span class="kicker-bar"></span>
            <span class="kicker-bar2"></span>
            <span class="kicker-label">ABOUT</span>
          </div>

          <h2 class="title">About Our Tutoring</h2>

          <div class="body-copy">
            <p>At Tutor Insider, we believe every child deserves a tutor who truly understands them. We connect students with qualified, caring tutors—online or at home—who make learning personalized, engaging, and stress-free.</p>

            <p>From interactive online lessons to focused one-on-one home tutoring, we cater to every learner's needs. Our diverse team brings subject expertise and cultural understanding, ensuring academic excellence.</p>

            <p>Whether it's schoolwork, homework help, or exam prep, our tutors work closely with parents to track progress and adapt learning plans. Parents trust us. Students love us.</p>

            <p>Because real learning happens when tutoring feels like home</p>
          </div>

          <div class="actions">
            <button class="btn btn-orange">BOOK A FREE DEMO</button>
            <button class="btn btn-blue">LEARN MORE</button>
          </div>
        </div>

        <!-- RIGHT: image -->
        <div class="col image-col" aria-hidden="true">
          <!-- If your build pipeline supports importing images, you can import in script and bind :src to the import. -->
          <img src="https://tutorinsider.com/wp-content/uploads/2025/05/ABOUT-OUR-TUTORING-1.png" alt="Tutor with student" class="hero-img" />
          <!-- wooden table effect under the image -->
          <div class="table-strip" />
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'AboutTutoring'
};
</script>

<style scoped>
/* Fonts (Google) */
@import url('https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&family=Poppins:wght@400;600;700&display=swap');

:root{
  --bg: #f6f7f7;
  --text: #2b2b2b;
  --muted: #666d6d;
  --accent: #f7941d; /* orange */
  --accent-dark: #ea7a14;
  --blue: #2f90f6;
  --container: 1180px;
}

/* Section background and vertical spacing */
.about-section{
  background: var(--bg);
  padding: 56px 20px 80px; /* top, sides, bottom */
}

.inner{
  max-width: 60vw;
  margin: 0 auto;
  padding: 0 28px;
}

/* Grid layout */
.grid{
  display: grid;
  grid-template-columns: 1fr;
  gap: 28px 48px;
  align-items: center;
}

@media (min-width: 992px){
  /* on large screens, two columns: text left (narrower), image right (wider) */
  .grid{
    grid-template-columns: 48% 52%;
    gap: 24px 48px;
  }
}

/* TEXT COLUMN */
.text-col{
  max-width: 640px;
}

.kicker{
  display:flex;
  align-items:center;
  gap:12px;
  margin-bottom: 18px;
}
.kicker-bar{
  width:44px;
  height:6px;
  background: #ff8831;
  border-radius:3px;
  display:inline-block;
  box-shadow: 0 0 0 6px rgba(247, 148, 61, 0.06);
}

.kicker-bar2{
  width:4vw;
  height:2px;
  background: #ff8831;
  border-radius:3px;
  display:inline-block;
  margin-left: -1vw;
  box-shadow: 0 0 0 6px rgba(247, 148, 61, 0.06);
}
.kicker-label{
  color: #ff8831;
  font-family: 'Poppins', sans-serif;
  font-weight:700;
  font-size:12px;
  letter-spacing:2px;
}

.title{
  font-family: 'Poppins', sans-serif;
  font-weight:600;
  font-size:1.3vw;
  color: var(--text);
  margin: 0 0 20px;
}

.body-copy p{
  font-family: 'Merriweather', serif;
  font-weight: 300;
  font-size:16px;
  line-height:1.85;
  color: var(--muted);
  margin: 16px 0;
  text-align: justify;
}

/* Buttons */
.actions{
  margin-top: 34px;
  display:flex;
  gap:22px;
  align-items:center;
}
.btn{
  border: none;
  cursor: pointer;
  padding: 16px 36px;
  border-radius: 40px;
  text-transform: uppercase;
  font-family: 'Poppins', sans-serif;
  font-weight:700;
  letter-spacing:1.6px;
  box-shadow: 0 18px 35px rgba(44,46,46,0.06);
  transition: transform 180ms ease, box-shadow 180ms ease;
}
.btn:active{ transform: translateY(1px); }

.btn-orange{
  background: #ff8831;
  color: white;
}

.btn-blue{
  background: #2b87da;
  color: white;
}

/* IMAGE COLUMN */
.image-col{
  position: relative;
  display:flex;
  justify-content:flex-end;
  align-items:flex-end;
  min-height: 260px;
}

.hero-img{
  max-width: 640px;
  width: 100%;
  height: auto;
  object-fit: cover;
  display:block;
  border-radius: 6px;
  /* raise it a bit to match the sample */
  transform: translateY(-6px);
  box-shadow: 0 16px 40px rgba(20,20,20,0.06);
}

/* Wooden table strip under the image like in the sample */
.table-strip{
  position: absolute;
  left: 0;
  right: 0;
  bottom: -8px; /* sticks out a bit */
  height: 36px;
  max-width: 740px;
  margin-left: auto;
  margin-right: 0;
  background: linear-gradient(90deg,#b06b2a,#c78a3a);
  box-shadow: 0 8px 18px rgba(0,0,0,0.06);
  border-top-left-radius: 2px;
  border-top-right-radius: 2px;
  z-index: 0;
}

/* make sure image sits above the table-strip */
.hero-img{ z-index: 1; position: relative; }

/* Responsive rules */
@media (max-width: 991px){
  .title{ font-size:30px; }
  .body-copy p{ font-size:15px; }
  .image-col{ justify-content:center; }
  .table-strip{ display:none; }
}

@media (max-width: 600px){
  .about-section{ padding: 28px 12px 36px; }
  .inner{ padding: 0 14px; }
  .title{ font-size:24px; }
  .actions{ flex-direction:column; gap:12px; }
  .btn{ width:100%; padding:14px 22px; }
  .hero-img{ transform:none; max-width:100%; }
  .text-col{ max-width:none; }
}

</style>
