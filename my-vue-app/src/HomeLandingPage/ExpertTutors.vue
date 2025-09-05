<template>
  <section class="tutors">
    <div class="tutors__inner">
      <div class="tutors__header">
        <h2 class="headline">The Expert Tutors</h2>
        <button class="cta">SCHEDULE A DEMO</button>
      </div>

      <div class="eyebrow">
        <span class="eyebrow__bar"></span>
        <span class="eyebrow__line"></span>
        <span class="eyebrow__text">EXPERIENCED. QUALIFIED. DEDICATED TO STUDENT SUCCESS</span>
      </div>

      <div class="tutors__grid">
        <article class="tutor-card">
          <img class="tutor-card__img" src="/assets/tutors/math.jpg" alt="" />
          <div class="tutor-card__body">
            <h3>Anjali Mehra</h3>
            <div class="muted">7+ Years Experience</div>
            <p>Mathematics (Classes 6-10) | CBSE Curriculum</p>
          </div>
        </article>

        <article class="tutor-card">
          <img class="tutor-card__img" src="/assets/tutors/science.jpg" alt="" />
          <div class="tutor-card__body">
            <h3>Rahul Verma</h3>
            <div class="muted">5+ Years Experience</div>
            <p>Science (Classes 6-10) | CBSE Curriculum</p>
          </div>
        </article>

        <article class="tutor-card">
          <img class="tutor-card__img" src="/assets/tutors/special.jpg" alt="" />
          <div class="tutor-card__body">
            <h3>Nidhi Arora</h3>
            <div class="muted">4+ Years Experience</div>
            <p>Special Educator (Autism, ADHD)</p>
          </div>
        </article>

        <article class="tutor-card">
          <img class="tutor-card__img" src="/assets/tutors/english.jpg" alt="" />
          <div class="tutor-card__body">
            <h3>Manoj Saini</h3>
            <div class="muted">10+ Years Experience</div>
            <p>English & Communication Skills</p>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: "ExpertTutors" };
</script>

<style scoped>
:root{ --ink:#0f172a; --orange:#f97316; --muted:#64748b; --shadow:0 14px 35px rgba(2,8,23,.08); }
.tutors{ padding:60px 24px 90px; background:#fff; }
.tutors__inner{ max-width:1200px; margin:0 auto; }
.tutors__header{
  display:flex; align-items:center; justify-content:space-between; gap:20px; margin-bottom:8px;
}
.headline{ font-size:56px; color:var(--ink); margin:0; font-weight:700; }
.cta{
  background:var(--orange);
  color:#fff; padding:16px 22px; border:none; border-radius:26px; font-weight:700; letter-spacing:.12em; cursor:pointer;
}
.eyebrow{ display:flex; align-items:center; gap:14px; margin:18px 0 26px; }
.eyebrow__bar{ width:52px; height:8px; background:var(--orange); border-radius:2px; }
.eyebrow__line{ height:2px; width:150px; background:#e5e7eb; border-radius:1px; }
.eyebrow__text{ font-size:12px; letter-spacing:1.6px; color:#ef6a13; font-weight:700; }

.tutors__grid{
  display:grid; grid-template-columns: repeat(4,1fr); gap:26px;
}
.tutor-card{
  background:#fff; border-radius:18px; overflow:hidden; box-shadow: var(--shadow);
}
.tutor-card__img{ width:100%; aspect-ratio: 4/5; object-fit: cover; display:block; }
.tutor-card__body{ padding:20px 18px 22px; }
.tutor-card h3{ margin:0 0 6px; font-size:20px; color:#0f253e; }
.muted{ color:var(--muted); margin-bottom:8px; }
.tutor-card p{ color:#374151; }

@media (max-width: 1100px){
  .tutors__grid{ grid-template-columns: repeat(2,1fr); }
}
@media (max-width: 640px){
  .headline{ font-size:40px; }
  .tutors__header{ flex-direction:column; align-items:flex-start; }
  .tutors__grid{ grid-template-columns: 1fr; }
  .cta{ align-self:stretch; text-align:center; }
}
</style>
