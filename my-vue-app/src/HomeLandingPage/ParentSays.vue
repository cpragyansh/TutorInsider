<template>
  <section class="tms">
    <div class="tms__inner">
      <h2 class="headline">What Parents Say</h2>

      <div class="eyebrow">
        <span class="eyebrow__bar"></span>
        <span class="eyebrow__line"></span>
        <span class="eyebrow__text">REAL EXPERIENCES. TRUSTED FEEDBACK. PROVEN RESULTS</span>
      </div>

      <div class="tms__grid">
        <article class="tms-card">
          <!-- <img class="tms-card__avatar" src="/assets/avatars/parent-1.jpg" alt="" /> -->
          <p class="tms-card__quote">
            This platform helped me find the perfect home tutor for my daughter. Her grades and
            confidence have improved!
          </p>
          <h4 class="tms-card__name">Shalini Gupta</h4>
          <div class="tms-card__role">Parent</div>
        </article>

        <article class="tms-card">
          <!-- <img class="tms-card__avatar" src="/assets/avatars/parent-2.jpg" alt="" /> -->
          <p class="tms-card__quote">
            We found a wonderful special educator for our child with learning difficulties. We’ve
            seen great improvement in academics and confidence.
          </p>
          <h4 class="tms-card__name">Srushti Iyer</h4>
          <div class="tms-card__role">Parent</div>
        </article>

        <article class="tms-card">
          <!-- <img class="tms-card__avatar" src="/assets/avatars/parent-3.jpg" alt="" /> -->
          <p class="tms-card__quote">
            Very thankful for the shadow teacher support. My son feels more included and supported
            in class now.
          </p>
          <h4 class="tms-card__name">Suresh Rao</h4>
          <div class="tms-card__role">Parent</div>
        </article>
      </div>
    </div>
  </section>
</template>

<script>
export default { name: "Testimonials" };
</script>

<style scoped>
:root{ --ink:#0f172a; --orange:#f97316; --card:#0b1324; --shadow:0 24px 50px rgba(2,8,23,.25); }
.tms{ padding: 56px 24px 90px; background:#fff; position:relative; }
.tms__inner{ max-width:1200px; margin:0 auto; }

.headline{ font-size:56px; color:var(--ink); margin:0 0 10px; font-weight:700; }
.eyebrow{ display:flex; align-items:center; gap:14px; margin-bottom:28px; }
.eyebrow__bar{ width:52px; height:8px; background:var(--orange); border-radius:2px; }
.eyebrow__line{ height:2px; width:150px; background:#e5e7eb; border-radius:1px; }
.eyebrow__text{ font-size:12px; letter-spacing:1.6px; color:#ef6a13; font-weight:700; }

.tms__grid{
  display:grid;
  grid-template-columns: repeat(3, 1fr);
  gap:28px;
}
.tms-card{
  background: var(--card);
  color:#f8fafc;
  border-radius:18px;
  padding:34px 28px 30px;
  text-align:center;
  box-shadow: var(--shadow);
}
.tms-card__avatar{
  width:110px; height:110px; border-radius:999px; object-fit:cover; display:block; margin:0 auto 18px;
}
.tms-card__quote{ line-height:2; font-size:16px; opacity:.95; }
.tms-card__name{ color: var(--orange); margin:22px 0 2px; font-size:20px; }
.tms-card__role{ opacity:.85; }

@media (max-width: 1100px){ .tms__grid{ grid-template-columns: 1fr; } }
</style>
