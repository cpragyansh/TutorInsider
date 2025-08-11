<template>
  <section class="HLC3-services-section">
    <h2 class="HLC3-section-title">Comprehensive Tutoring Services</h2>
    <div class="HLC3-services-container">
      <div class="HLC3-service-card" v-for="(card, index) in cards" :key="index">
        <img :src="card.image" :alt="card.title" class="HLC3-service-image" />
        <h3 class="HLC3-service-title">{{ card.title }}</h3>
        <p class="HLC3-service-description">{{ card.description }}</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
//   name: 'TutoringServices',
  data() {
    return {
      cards: [
        {
          title: 'One-on-One Tutoring',
          description: 'Receive undivided attention and customized lessons from an expert tutor dedicated to your success.',
image: '/assets/Images/HomeLandingPageAssets/Section-2-image.png'

        },
        {
          title: 'Group Study Sessions',
          description: 'Collaborate with peers and a tutor in small group settings, fostering interactive learning and shared understanding.',
image: '/assets/Images/HomeLandingPageAssets/Section-2-image.png'
        },
        {
          title: 'Exam Prep Workshops',
          description: 'Master test-taking strategies and content with intensive workshops designed to maximize your exam performance.',
image: '/assets/Images/HomeLandingPageAssets/Section-2-image.png'
        }
      ]
    }
  }
}
</script>

<style scoped>
.HLC3-services-section {
  text-align: center;
  padding: 3rem 1rem;
  max-width: 1600px;
  margin: 0 auto;
}

.HLC3-section-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2rem;
}

.HLC3-services-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  justify-content: center;
}

.HLC3-service-card {
  background-color: white;
  border-radius: 12px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.06);
  width: 100%;
  max-width: 380px;
  padding: 1rem;
  text-align: left;
  transition: transform 0.3s ease;
}

.HLC3-service-card:hover {
  transform: translateY(-5px);
}

.HLC3-service-image {
  width: 100%;
  height: 180px;
  object-fit: cover;
  border-radius: 8px;
  margin-bottom: 1rem;
}

.HLC3-service-title {
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.HLC3-service-description {
  font-size: 0.95rem;
  color: #555;
}

/* Responsive */
@media (max-width: 768px) {
  .HLC3-ervices-container {
    flex-direction: column;
    align-items: center;
  }
}
</style>




