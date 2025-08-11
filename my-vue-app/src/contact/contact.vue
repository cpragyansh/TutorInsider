<template>
  <section class="HLC-contact-section">
    <!-- Title -->
    <h2 class="HLC-contact-title">Your Path to Smarter Learning</h2>
    <p class="HLC-contact-subtitle">
      Connecting students with expert tutors and providing intuitive management
      tools for a seamless educational journey.
    </p>

    <!-- Cards -->
    <div class="HLC-contact-card-container">
      <div class="HLC-contact-card" v-for="(item, index) in cards" :key="index">
        <div class="HLC-contact-icon" v-html="item.icon"></div>
        <h3 class="HLC-contact-card-title">{{ item.title }}</h3>
        <p class="HLC-contact-card-text">{{ item.text }}</p>
        <button class="HLC-contact-btn-primary">Login</button>
        <button class="HLC-contact-btn-secondary">Signup</button>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "SmarterLearningSection",
  data() {
    return {
      cards: [
        {
          icon: `<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="#3B82F6" stroke-width="2" viewBox="0 0 24 24" width="40" height="40"><path stroke-linecap="round" stroke-linejoin="round" d="M5.121 17.804A3 3 0 017 17h10a3 3 0 012.879 2.804M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>`,
          title: "For Parents",
          text: "Find qualified tutors, track your child’s progress, and manage schedules with ease.",
        },
        {
          icon: `<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="#3B82F6" stroke-width="2" viewBox="0 0 24 24" width="40" height="40"><path stroke-linecap="round" stroke-linejoin="round" d="M12 14l9-5-9-5-9 5 9 5z"/><path stroke-linecap="round" stroke-linejoin="round" d="M12 14l6.16-3.422a12.083 12.083 0 01.34 6.593A11.947 11.947 0 0112 20.055a11.947 11.947 0 01-6.5-2.884 12.083 12.083 0 01.34-6.593L12 14z"/></svg>`,
          title: "For Tutors",
          text: "Connect with students, share your expertise, and grow your tutoring business.",
        },
        {
          icon: `<svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="#3B82F6" stroke-width="2" viewBox="0 0 24 24" width="40" height="40"><path stroke-linecap="round" stroke-linejoin="round" d="M9 17v-6a2 2 0 012-2h2a2 2 0 012 2v6m4 0V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10m14 0H5"/></svg>`,
          title: "For CRM & Admins",
          text: "Manage users, monitor platform activity, and access comprehensive reports.",
        },
      ],
    };
  },
};
</script>

<style scoped>
.HLC-contact-section {
  text-align: center;
  padding: 3rem 1rem;
  max-width: 1100px;
  margin: 0 auto;
}

.HLC-contact-title {
  font-size: 2rem;
  font-weight: 700;
}

.HLC-contact-subtitle {
  max-width: 650px;
  margin: 0.5rem auto 2rem;
  font-size: 1rem;
  color: #555;
}

.HLC-contact-card-container {
  display: flex;
  gap: 1.5rem;
  flex-wrap: wrap;
  justify-content: center;
}

.HLC-contact-card {
  background: #fff;
  padding: 1.5rem;
  border-radius: 10px;
  width: 300px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
  text-align: center;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.HLC-contact-icon {
  margin-bottom: 0.5rem;
}

.HLC-contact-card-title {
  font-weight: 600;
  font-size: 1.2rem;
}

.HLC-contact-card-text {
  font-size: 0.95rem;
  color: #666;
  flex-grow: 1;
}

.HLC-contact-btn-primary {
  background: #3b82f6;
  color: white;
  border: none;
  padding: 0.6rem;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.95rem;
  transition: background 0.3s;
}

.HLC-contact-btn-primary:hover {
  background: #2563eb;
}

.HLC-contact-btn-secondary {
  background: white;
  color: #3b82f6;
  border: 1px solid #ddd;
  padding: 0.6rem;
  border-radius: 6px;
  cursor: pointer;
  font-size: 0.95rem;
  transition: background 0.3s, border 0.3s;
}

.HLC-contact-btn-secondary:hover {
  background: #f9f9f9;
  border-color: #ccc;
}
</style>
