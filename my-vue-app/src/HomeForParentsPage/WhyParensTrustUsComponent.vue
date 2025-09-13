<template>
  <section class="why-join-wrap" aria-labelledby="why-join-title">
    <div class="inner container">
      <!-- Left column -->
      <div class="col left">
        <h2 id="why-join-title" class="big-title">Why Join Us</h2>

        <ul class="feature-list" role="list">
          <li v-for="(f, i) in features" :key="i" class="feature-item">
            <span class="check">
              <!-- simple SVG check circle -->
              <svg viewBox="0 0 24 24" aria-hidden focusable="false">
                <circle cx="12" cy="12" r="10" fill="#ff8a2b" />
                <path d="M7.5 12.5l2.3 2.3 6.7-6.7" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>

            <span class="feature-text">{{ f }}</span>
          </li>
        </ul>
      </div>

      <!-- Right column -->
      <div class="col right">
        <div class="title-row">
          <span class="accent-bar" aria-hidden></span>
          <h2 class="big-title small-gap">Best Suited For</h2>
        </div>

        <p class="lead">
          This platform is designed for passionate and skilled professionals looking to make a
          meaningful impact in the field of education. It provides the tools and flexibility to
          connect with the right learners, deliver personalized support, and grow your professional presence.
        </p>

        <ul class="suit-list">
          <li v-for="(s, idx) in suitedFor" :key="idx">{{ s }}</li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "WhyJoinUs",
  data() {
    return {
      features: [
        "100% free registration",
        "Access to verified leads",
        "Choose your location and availability",
        "Teach offline",
        "Build your professional profile",
      ],
      suitedFor: [
        "Home Tutors",
        "Special Educators",
        "Counselors",
        "Language Trainers",
        "Exam Coaches",
      ],
    };
  },
};
</script>

<style scoped>
/* fonts */
@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Inter:wght@300;400;600&display=swap");

.why-join-wrap {
  padding: 56px 20px;
  background: #ffffff;
  color: #24323a;
  font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
}

/* width container */
.container {
  max-width: 1100px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 40px 60px;
  align-items: start;
}

/* Column basics */
.col { min-width: 0; }

/* Big headings */
.big-title {
  font-family: "Montserrat", sans-serif;
  font-weight: 700;
  font-size: 44px;
  margin: 0 0 22px 0;
  color: #2b3740;
  line-height: 1;
}

/* left features list */
.feature-list {
  list-style: none;
  padding: 0;
  margin: 8px 0 0 0;
}

.feature-item {
  display: flex;
  align-items: center;
  gap: 18px;
  margin: 20px 0;
}

/* check circle */
.check {
  width: 40px;
  height: 40px;
  flex: 0 0 40px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

/* svg inside scales to container */
.check svg { width: 100%; height: 100%; display: block; }

/* feature text */
.feature-text {
  font-size: 15px;
  font-weight: 600;
  color: #24323a;
}

/* Right side title row with accent bar */
.title-row {
  display: flex;
  align-items: center;
  gap: 18px;
  margin-bottom: 8px;
}

.accent-bar {
  width: 8px;
  height: 54px;
  background: #ff8a2b; /* orange */
  border-radius: 4px;
  display: inline-block;
}

/* smaller heading spacing on right */
.small-gap {
  font-size: 40px;
  margin: 0;
}

/* paragraph description on right */
.lead {
  color: #5a6a6f;
  line-height: 1.8;
  font-size: 15px;
  margin-top: 6px;
  max-width: 520px;
}

/* suited list */
.suit-list {
  margin-top: 18px;
  padding-left: 18px;
  color: #2b3740;
  font-size: 15px;
  line-height: 1.9;
}

.suit-list li { margin: 6px 0; }

/* Responsive behavior */
@media (max-width: 920px) {
  .container {
    grid-template-columns: 1fr;
    gap: 28px;
  }

  .big-title {
    font-size: 36px;
  }

  .accent-bar {
    height: 40px;
    width: 6px;
  }
}

/* Small screens */
@media (max-width: 520px) {
  .big-title { font-size: 28px; }
  .feature-text, .lead, .suit-list li { font-size: 14px; }
  .check { width: 36px; height: 36px; }
}
</style>
