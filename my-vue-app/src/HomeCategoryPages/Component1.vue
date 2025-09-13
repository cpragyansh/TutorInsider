<template>
  <section class="hero-wrap">
    <div class="container">
      <div class="left-col">
        <div class="eyebrow">A POOL OF EXCELLENT TUTORS</div>
        <h1 class="title">
          Choose the Right
          <br />
          Tutor Based on
          <br />
          Your Needs
        </h1>

        <p class="lead">
          Every learner is unique — and so is every tutor. With TutorInsider, you
          can explore a wide range of tutors for academics, skills, hobbies,
          and more. Choose the right tutor who fits your learning style,
          schedule, and goals. Let’s make learning personal and powerful.
        </p>

        <button class="cta">LET'S FIND THE PERFECT TUTOR</button>
      </div>

      <div class="right-col">
        <svg viewBox="0 0 600 600" class="blob-svg" preserveAspectRatio="xMidYMid slice" aria-hidden>
          <defs>
            <clipPath id="blobClip" clipPathUnits="objectBoundingBox">
              <path
                d="M0.500,0.030 C0.640,0.030 0.760,0.080 0.840,0.160 C0.920,0.240 0.980,0.360 0.980,0.500 C0.980,0.640 0.920,0.760 0.840,0.840 C0.760,0.920 0.640,0.970 0.500,0.970 C0.360,0.970 0.240,0.920 0.160,0.840 C0.080,0.760 0.020,0.640 0.020,0.500 C0.020,0.360 0.080,0.240 0.160,0.160 C0.240,0.080 0.360,0.030 0.500,0.030 Z"
              />
            </clipPath>
          </defs>

          <!-- external image link -->
          <image
            href="https://tutorinsider.com/wp-content/uploads/2025/05/CATEGORY-choose-the-right-tutor.png"
            width="100%"
            height="100%"
            preserveAspectRatio="xMidYMid slice"
            :clip-path="'url(#blobClip)'"
          />
        </svg>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'HeroSection',
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700;800&family=Inter:wght@300;400;600&display=swap');

:root {
  --accent: #ff8a2b;
  --text-dark: #333;
  --muted: #6b6b6b;
}

.hero-wrap {
  width: 100%;
  padding: 56px 24px;
  background-color: #fff;
  font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', Arial;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 520px;
  gap: 32px;
  align-items: center;
}

.left-col {
  padding-right: 24px;
}

.eyebrow {
  color: var(--accent);
  font-weight: 600;
  font-size: 12px;
  letter-spacing: 1.4px;
  margin-bottom: 18px;
}

.title {
  font-family: 'Montserrat', sans-serif;
  font-weight: 550;
  font-size: clamp(44px, 6.5vw, 52px);
  color: var(--text-dark);
  line-height: 1.2;
  margin: 0 0 22px 0;
}

.lead {
  color: var(--muted);
  font-size: 16px;
  line-height: 1.8;
  max-width: 540px;
  margin-bottom: 28px;
}

.cta {
  background: #ff7a1a;
  border: none;
  color: white;
  padding: 18px 36px;
  font-weight: 700;
  border-radius: 40px;
  font-size: 14px;
  cursor: pointer;
  box-shadow: 0 18px 40px rgba(255, 138, 43, 0.18);
  transition: transform .14s ease, box-shadow .14s ease;
}

.cta:hover {
  transform: translateY(-4px);
  box-shadow: 0 22px 48px rgba(255, 138, 43, 0.22);
}

.right-col {
  display: flex;
  justify-content: center;
  align-items: center;
}

.blob-svg {
  width: 480px;
  max-width: 100%;
  height: auto;
  filter: drop-shadow(0 18px 40px rgba(0,0,0,0.12));
}

@media (max-width: 860px) {
  .container {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 36px;
  }
  .right-col {
    order: -1;
  }
  .blob-svg {
    width: 320px;
  }
}
</style>
