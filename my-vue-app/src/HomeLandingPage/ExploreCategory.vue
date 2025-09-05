<template>
  <section class="cats">
    <div class="cats__inner">
      <h2 class="headline">Explore Categories</h2>

      <div class="eyebrow">
        <span class="eyebrow__bar"></span>
        <span class="eyebrow__line"></span>
        <span class="eyebrow__text">CHOOSE WHAT YOUR CHILD NEEDS MOST.</span>
      </div>

      <div class="cats__grid">
        <article class="cat-card">
          <div class="cat-card__icon">🖥️</div>
          <div>
            <h3>Class-wise Tutors</h3>
            <p>Nursery to 12<sup>th</sup> Standard</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🏅</div>
          <div>
            <h3>Subject Experts</h3>
            <p>Math, Science, English, etc.</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🧑‍🏫</div>
          <div>
            <h3>Board-specific</h3>
            <p>CBSE, ICSE, State Boards, IGCSE</p>
          </div>
        </article>

        <article class="cat-card cat-card--spotlight">
          <div class="cat-card__icon">🧩</div>
          <div>
            <h3>Special Education & Counselling</h3>
            <p>Dyslexia, ADHD, Autism, ADD etc.</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🕺</div>
          <div>
            <h3>Dancing</h3>
            <p>Hip-Hop, Freestyle, Folk Dance, Modern Dance</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🎵</div>
          <div>
            <h3>Music</h3>
            <p>Instrumental, Classical, Vocal, Lo-fi</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🧘</div>
          <div>
            <h3>Yoga</h3>
            <p>Hatha yoga, Ashtanga yoga</p>
          </div>
        </article>

        <article class="cat-card">
          <div class="cat-card__icon">🎨</div>
          <div>
            <h3>Drawing and Painting</h3>
            <p>Cartoon, Figure, Line Drawing</p>
          </div>
        </article>
      </div>

      <div class="cats__cta-wrap">
        <button class="cta">EXPLORE MORE CATEGORIES</button>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: "ExploreCategories" };
</script>

<style scoped>
:root{
  --orange:#f97316; --ink:#0f172a; --muted:#475569; --card:#fff; --shadow:0 14px 35px rgba(2,8,23,.08);
}
.cats{ padding: 60px 24px 90px; background:#fff; position:relative; }
.cats__inner{ max-width: 1200px; margin:0 auto; position:relative; }
.headline{ font-size:56px; color:var(--ink); margin:0 0 10px; font-weight:700; }

.eyebrow{ display:flex; align-items:center; gap:14px; margin-bottom:34px; }
.eyebrow__bar{ width:52px; height:8px; background:var(--orange); border-radius:2px; }
.eyebrow__line{ height:2px; width:150px; background:#e5e7eb; border-radius:1px; }
.eyebrow__text{ font-size:12px; letter-spacing:1.6px; color:#ef6a13; font-weight:700; }

.cats__grid{
  display:grid;
  grid-template-columns: repeat(4,1fr);
  gap:24px 28px;
  position:relative;
}
.cat-card{
  background:var(--card);
  border-radius:18px;
  padding:22px 22px;
  box-shadow:var(--shadow);
  display:flex;
  gap:14px;
  align-items:flex-start;
  position:relative;
  z-index:1;
}
.cat-card__icon{ font-size:28px; line-height:1; }
.cat-card h3{ font-size:20px; margin:2px 0 6px; color:#0f253e; }
.cat-card p{ color:#6b7280; line-height:1.8; font-size:15px; }

.cat-card--spotlight::before{
  content:"";
  position:absolute;
  inset:-20px -16px;
  background:rgba(222,239,255,.9);
  border-radius:42% 58% 55% 45%/44% 45% 55% 56%;
  z-index:-1;
  filter:blur(0.4px);
}

.cats__cta-wrap{ text-align:center; margin-top:36px; }
.cta{
  background:var(--orange);
  color:#fff;
  border:none;
  padding:16px 26px;
  font-weight:700;
  border-radius:28px;
  letter-spacing:.12em;
  cursor:pointer;
}

@media (max-width: 1100px){
  .cats__grid{ grid-template-columns: repeat(2,1fr); }
}
@media (max-width: 640px){
  .headline{ font-size:40px; }
  .cats__grid{ grid-template-columns: 1fr; }
}
</style>
