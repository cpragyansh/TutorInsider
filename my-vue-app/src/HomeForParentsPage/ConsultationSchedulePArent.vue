<template>
  <section class="consultation-hero" aria-labelledby="consultation-title">
    <div class="content">
      <div class="left">
        <h1 id="consultation-title" class="headline">
          Schedule a Free Consultation Today
        </h1>

        <div class="description">
          <p>
            Finding the right tutor for your child starts with the right conversation.
            Book a free 1-on-1 consultation with our team to discuss your child's learning
            needs, challenges, and goals. We'll help you explore the best tutoring options
            tailored to their academic journey.
          </p>

          <p>
            This 15–20 minute session is completely free and gives you a chance to
            understand how TutorInsider works, ask questions, and make an informed decision —
            without any pressure.
          </p>
        </div>
      </div>

      <div class="right">
        <button class="cta">Select a date &amp; time</button>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "ConsultationHero",
};
</script>

<style scoped>
/* Fonts */
@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@700;800&family=Inter:wght@300;400;600&display=swap");

:root{
  --orange:#fb8534; /* main panel color */
  --orange-dark:#f9742a;
  --blue:#2f8ef6;
  --text-dark:#ffffff;
  --muted-white:rgba(255,255,255,0.95);
}

/* Full-bleed rounded panel */
.consultation-hero{
  padding: 36px 28px;
  background: transparent;
}

/* inner content constrained */
.content{
  max-width: 90%;
  margin: 0 auto;
  background: #ff8a2b;
  border-radius: 22px;
  padding: 54px 72px;
  display: grid;
  grid-template-columns: 1fr 300px;
  gap: 24px;
  align-items: center;
  box-sizing: border-box;
  /* subtle shadow to lift off the page */
  box-shadow: 0 10px 30px rgba(0,0,0,0.06);
}

/* Left column: heading + paragraphs */
.left { color: var(--text-dark); }

.headline{
  font-family: "Montserrat", sans-serif;
  font-weight: 800;
  font-size: clamp(28px, 4.2vw, 48px);
  margin: 0 0 22px 0;
  color: white;
  letter-spacing: 0.2px;
}

/* paragraphs styling */
.description {
  max-width: 640px;
  color: white;
  font-weight: 500;

}

.description p {
  margin: 0 0 18px 0;
  color: var(--muted-white);
  line-height: 1.8;
  font-size: 15px;
  font-weight: 300;
}

/* Right column: CTA centered vertically with right alignment */
.right {
  display:flex;
  align-items:center;
  justify-content:flex-end;
}

/* Blue pill CTA */
.cta{
  background: linear-gradient(180deg, #3e9bf7, #2f8ef6);
  color: white;
  border: none;
  padding: 14px 28px;
  border-radius: 999px;
  font-weight: 700;
  letter-spacing: 0.6px;
  cursor: pointer;
  box-shadow: 0 14px 30px rgba(47,142,246,0.18);
  transition: transform .12s ease, box-shadow .18s ease;
  font-size: 13px;
  text-transform: uppercase;
}

/* hover */
.cta:hover{
  transform: translateY(-4px);
  box-shadow: 0 18px 40px rgba(47,142,246,0.22);
}

/* Responsive rules */
@media (max-width: 980px){
  .content{
    grid-template-columns: 1fr 220px;
    padding: 40px;
  }
  .headline { font-size: clamp(26px, 5.2vw, 40px); }
  .description { max-width: 100%; }
}

@media (max-width: 720px){
  .content{
    grid-template-columns: 1fr;
    text-align: left;
    padding: 34px 22px;
  }
  .right{
    justify-content:flex-start;
    margin-top: 18px;
  }
  .cta{ font-size: 14px; padding: 12px 22px; }
}
</style>
