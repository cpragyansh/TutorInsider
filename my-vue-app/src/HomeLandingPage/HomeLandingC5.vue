<template>
  <section class="HLC5-success-section">
    <div class="HLC5-overlay">
      <h2 class="HLC5-title">Your Success, Our Motivation</h2>
      <p class="HLC5-subtitle">
        We are driven by the success and growth of every student we mentor. Our
        commitment is to provide the best educational support, transforming
        challenges into triumphs.
      </p>
      <div class="HLC5-stats">
        <div class="HLC5-stat-item">
          <span class="HLC5-stat-number">95%</span>
          <span class="HLC5-stat-label">Student Satisfaction</span>
        </div>
        <div class="HLC5-stat-item">
          <span class="HLC5-stat-number">300+</span>
          <span class="HLC5-stat-label">Expert Tutors</span>
        </div>
        <div class="HLC5-stat-item">
          <span class="HLC5-stat-number">10K+</span>
          <span class="HLC5-stat-label">Success Stories</span>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "SuccessSection",
};
</script>

<style scoped>
.HLC5-success-section {
  background-image: url('../assets/Images/HomeLandingPageAssets/section-5-bg-image.png'); /* Replace with actual image path */
  background-size: cover;
  height: 24vw;
  background-position: center;
  /* padding: 4rem 1rem; */
  text-align: center;
  position: relative;
  color: white;
  display: flex;
  justify-content: center;
  align-items: center;

}



.HLC5-title {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 1rem;
}

.HLC5-subtitle {
  max-width: 800px;
  margin: 0 auto 2rem;
  font-size: 1rem;
  line-height: 1.5;
}

.HLC5-stats {
  display: flex;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
}

.HLC5-stat-item {
  text-align: center;
}

.HLC5-stat-number {
  font-size: 2rem;
  font-weight: 700;
  display: block;
}

.HLC5-stat-label {
  font-size: 0.95rem;
  color: #a6d4ff;
}

/* Responsive */
@media (max-width: 768px) {
  .HLC5-stats {
    flex-direction: column;
    gap: 1.5rem;
  }
}
</style>
