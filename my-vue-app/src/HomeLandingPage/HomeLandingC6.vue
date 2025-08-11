<template>
  <section class="HLC6-testimonial-section">
    <h2 class="HLC6-title">What Our Students Say</h2>
    <div class="HLC6-testimonial-cards">
      <div
        v-for="(testimonial, index) in testimonials"
        :key="index"
        class="HLC6-testimonial-card"
        :class="{ 'HLC6-highlighted': testimonial.highlighted }"
      >
        <img :src="testimonial.image" :alt="testimonial.name" class="HLC6-avatar" />
        <p class="HLC6-quote">
          <span class="HLC6-quote-icon">99</span>{{ testimonial.text }}
        </p>
        <p class="HLC6-name">{{ testimonial.name }}</p>
        <p class="HLC6-role">{{ testimonial.role }}</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "TestimonialSection",
  data() {
    return {
      testimonials: [
        {
          image: "/assets/Images/HomeLandingPageAssets/section-6-pp.png", // replace with actual paths
          text: "My grades have improved dramatically since I started using this service. The personalized approach made all the difference!",
          name: "Sarah J.",
          role: "High School Student",
          highlighted: false,
        },
        {
          image: "/assets/Images/HomeLandingPageAssets/section-6-pp.png", // replace with actual paths
          text: "The tutors are incredibly knowledgeable and supportive. I finally understood calculus thanks to their clear explanations.",
          name: "David K.",
          role: "University Student",
          highlighted: true,
        },
        {
          image: "/assets/Images/HomeLandingPageAssets/section-6-pp.png", // replace with actual paths
          text: "Highly recommend for anyone struggling with a subject. The platform is easy to use, and the results speak for themselves.",
          name: "Emily R.",
          role: "Parent",
          highlighted: false,
        },
        {
          image: "/assets/Images/HomeLandingPageAssets/section-6-pp.png", // replace with actual paths
          text: "My son regained his confidence in math. The tutor made learning fun and engaging, which was crucial for him.",
          name: "Michael B.",
          role: "Parent",
          highlighted: false,
        },
      ],
    };
  },
};
</script>

<style scoped>
.HLC6-testimonial-section {
  padding: 3rem 1rem;
  text-align: center;
  max-width: 1600px;
  margin: 0 auto;
}

.HLC6-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2.5rem;
}

.HLC6-testimonial-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  justify-content: center;
}

.HLC6-testimonial-card {
  background: white;
  border-radius: 12px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.06);
  padding: 1.5rem;
  max-width: 260px;
  text-align: center;
  transition: transform 0.3s ease, border 0.3s ease;
}

.HLC6-testimonial-card:hover {
  transform: translateY(-5px);
}

.HLC6-highlighted {
  border: 2px solid #cfc3ff;
}

.HLC6-avatar {
  width: 8vw;
  /* height: 4vw; */
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 1rem;
}

.HLC6-quote {
  font-size: 0.95rem;
  color: #333;
  margin-bottom: 1.2rem;
}

.HLC6-quote-icon {
  color: #2d9cdb;
  font-weight: bold;
  font-size: 1.1rem;
  margin-right: 0.3rem;
}

.HLC6-name {
  font-weight: 700;
  margin-bottom: 0.3rem;
}

.HLC6-role {
  font-size: 0.85rem;
  color: #777;
}

/* Responsive */
@media (max-width: 900px) {
  .HLC6-testimonial-cards {
    flex-direction: column;
    align-items: center;
  }
}
</style>
