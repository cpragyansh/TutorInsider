<template>
  <section class="svc-grid">
    <div class="svc-grid__inner">
      <article class="svc-card">
        <img class="svc-card__img" src="https://tutorinsider.com/wp-content/uploads/2025/05/Hobby-Classes.png" alt="">
        <h3>Home Tuition</h3>
        <p>
          Personalized academic support from expert tutors delivered at your doorstep, focusing on
          subject mastery, confidence building and consistent academic progress.
        </p>
      </article>

      <article class="svc-card">
        <img class="svc-card__img" src="https://tutorinsider.com/wp-content/uploads/2025/05/Home-Tuition.png" alt="">
        <h3>Shadow Teaching</h3>
        <p>
          Inclusive education support for children with special needs, with dedicated shadow
          teachers who assist in mainstream classrooms to encourage independence and active learning.
        </p>
      </article>

      <article class="svc-card">
        <img class="svc-card__img" src="https://tutorinsider.com/wp-content/uploads/2025/05/Shadow-Teching.png" alt="">
        <h3>Counselling</h3>
        <p>
          Professional guidance for emotional and academic well-being through one-on-one sessions
          with trained counselors.
        </p>
      </article>

      <article class="svc-card">
        <img class="svc-card__img" src="https://tutorinsider.com/wp-content/uploads/2025/05/Counselling.png" alt="">
        <h3>Hobby Classes</h3>
        <p>
          Engaging activities like music, art and reading that foster self-expression, relieve
          stress and support cognitive development.
        </p>
      </article>
    </div>
  </section>
</template>

<script>
export default { name: "ServicesGrid" };
</script>

<style scoped>
:root {
  --blue-bg: #e6f0ff;
  --ink: #0f172a;
  --card-shadow: 0 10px 30px rgba(2, 8, 23, 0.08);
}
.svc-grid { padding: 40px 24px 90px; background: #fff; }
.svc-grid__inner {
  max-width: 1230px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 36px;
}
.svc-card {
  background: var(--blue-bg);
  border-radius: 22px;
  padding: 46px 30px 36px;
  text-align: left;
  box-shadow: var(--card-shadow);
}
.svc-card__img {
  width: 240px;
  height: 180px;
  object-fit: contain;
  display: block;
  margin: 0 auto 12px;
}
.svc-card h3 {
  font-size: 28px;
  color: var(--ink);
  margin: 8px 0 14px;
}
.svc-card p {
  color: #334155;
  line-height: 2;
  font-size: 16px;
}

@media (max-width: 1200px) {
  .svc-grid__inner { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 640px) {
  .svc-grid__inner { grid-template-columns: 1fr; }
  .svc-card__img { width: 200px; height: 150px; }
}
</style>
