<template>
  <section class="services-hero">
    <div class="services-hero__inner">
      <div class="services-hero__left">
        <h2 class="headline">Our Services</h2>

        <div class="eyebrow">
          <span class="eyebrow__bar"></span>
          <span class="eyebrow__line"></span>
          <span class="eyebrow__text">EXPERTS IN EVERY SUBJECT</span>
        </div>

        <p class="lead">
          At our core, we are committed to nurturing the academic, emotional, and developmental
          needs of every child. Our range of specialized services ensures that students receive
          personalized support tailored to their individual goals, learning styles, and challenges.
        </p>
      </div>

      <div class="services-hero__right">
        <article class="benefit-card">
          <header class="benefit-card__header">
            <span class="benefit-card__icon">➜</span>
            <h3>Benefits For Parents</h3>
          </header>
          <ul class="benefit-card__list">
            <li>Verified educators</li>
            <li>Flexible scheduling</li>
            <li>Affordable plans</li>
          </ul>
        </article>

        <article class="benefit-card">
          <header class="benefit-card__header">
            <span class="benefit-card__icon">➜</span>
            <h3>Benefits For Students</h3>
          </header>
          <ul class="benefit-card__list">
            <li>One-on-one attention</li>
            <li>Improved academic performance</li>
            <li>Emotional support</li>
          </ul>
        </article>
      </div>
    </div>

    <div class="services-hero__curve" aria-hidden="true"></div>
  </section>
</template>

<script>
export default { name: "OurServices" };
</script>

<style scoped>


.services-hero {
  position: relative;
  padding: 80px 24px 110px 24px;
  background: #fff;
  overflow: hidden;
}
.services-hero__inner {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1.1fr 1fr;
  gap: 56px;
  align-items: start;
}
.headline {
  font-size: 56px;
  line-height: 1.1;
  color: var(--ink);
  letter-spacing: 0.5px;
  margin: 0 0 24px;
  font-weight: 700;
}
.eyebrow {
  display: flex;
  align-items: center;
  gap: 0px;
  margin: 6px 0 26px;
}
.eyebrow__bar {
  width: 52px;
  height: 10px;
  background: var(--orange);
  border-radius: 2px;
  display: inline-block;
}
.eyebrow__line {
  height: 2px;
  width: 150px;
  background: var(--orange);
  display: inline-block;
  border-radius: 1px;
}
.eyebrow__text {
  font-size: 16px;
  letter-spacing: 1.6px;
  color: #ef6a13;
  font-weight: 700;
}
.lead {
  color: var(--muted);
  font-size: 18px;
  line-height: 1.9;
  max-width: 680px;
}

.services-hero__right {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 26px;
  align-items: start;
  padding-top: 28px;
}
.benefit-card {
  background: #fff;
  border-radius: 18px;
  box-shadow: var(--card-shadow);
  padding: 28px 26px;
  position: relative;
}
.benefit-card::after {
  content: "";
  position: absolute;
  inset: -14px;
  border-radius: 22px;
  pointer-events: none;
  box-shadow: 0 24px 50px rgba(2, 8, 23, 0.06);
  opacity: 0.5;
  z-index: -1;
}
.benefit-card__header {
  display: flex;
  align-items: center;
  gap: 14px;
  margin-bottom: 14px;
}
.benefit-card__icon {
  display: inline-grid;
  place-items: center;
  width: 36px;
  height: 36px;
  border-radius: 999px;
  background: var(--orange-200);
  color: var(--orange);
  font-weight: 900;
  font-size: 18px;
}
.benefit-card h3 {
  color: #0f253e;
  font-size: 20px;
  margin: 0;
}
.benefit-card__list {
  margin: 14px 0 0;
  padding-left: 20px;
  color: #3b4453;
  line-height: 2;
  font-size: 16px;
}

.services-hero__curve {
  position: absolute;
  right: -20%;
  bottom: -30%;
  width: 1100px;
  height: 520px;
  /* background: radial-gradient(1200px 420px at 40% 0%, #eaf2fb 0%, transparent 60%); */
  pointer-events: none;
  z-index: 0;
}

@media (max-width: 1024px) {
  .services-hero__inner {
    grid-template-columns: 1fr;
  }
  .services-hero__right {
    grid-template-columns: 1fr 1fr;
  }
}
@media (max-width: 640px) {
  .headline { font-size: 40px; }
  .services-hero__right { grid-template-columns: 1fr; }
}
</style>
