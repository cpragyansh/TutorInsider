<template>
  <section class="howitworks-section">
    <div class="howitworks-container">
      <!-- Section Title -->
      <h2 class="section-title">How It Works</h2>

      <!-- Steps Grid -->
      <div class="steps-wrapper">
        <!-- Dotted Line Connector -->
        <div class="steps-connector"></div>

        <!-- Step Items -->
        <div
          v-for="(step, index) in steps"
          :key="index"
          class="step-item"
        >
          <!-- Icon in Circle -->
          <div class="step-icon-wrapper">
            <img :src="step.icon" alt="icon" class="step-icon" />
            <!-- Number Badge -->
            <span class="step-number">
              {{ index + 1 }}
            </span>
          </div>

          <!-- Step Title -->
          <h3 class="step-title">{{ step.title }}</h3>
          <!-- Step Description -->
          <p class="step-description">{{ step.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "HowItWorks",
  data() {
    return {
      steps: [
        {
          icon: "https://tutorinsider.com/wp-content/uploads/2025/05/icon1.png",
          title: "Tell Us What You Need",
          description: "Share your child's learning requirements.",
        },
        {
          icon: "https://tutorinsider.com/wp-content/uploads/2025/05/icon2.png",
          title: "We Find The Right Match",
          description: "Get connected to trusted educators in your area or online.",
        },
        {
          icon: "https://tutorinsider.com/wp-content/uploads/2025/05/icon3.png",
          title: "Schedule A Demo Class",
          description: "Schedule sessions and help your child grow confidently.",
        },
        {
          icon: "https://tutorinsider.com/wp-content/uploads/2025/05/icon4.png",
          title: "Start Learning",
          description: "Help your child learn better with expert tutors and engaging lessons.",
        },
      ],
    };
  },
};
</script>

<style scoped>
/* Section Styles */
.howitworks-section {
  padding: 4rem 0;
  background-color: #ffffff;
}

.howitworks-container {
  max-width: 80%;
  margin: 0 auto;
  padding: 0 1rem;
  text-align: center;
}

/* Title */
.section-title {
  font-size: 2.5rem;
  font-weight: bold;
  margin-bottom: 3rem;
}

/* Steps Wrapper */
.steps-wrapper {
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
}

/* Connector Line */
.steps-connector {
  position: absolute;
  top: 6rem;
  left: 0;
  right: 0;
  border-top: 2px dotted #60a5fa; /* blue-400 */
  z-index: 0;
}

/* Step Item */
.step-item {
  width: 43%;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 0 1rem;
  position: relative;
  z-index: 10;
}

/* Icon Wrapper */
.step-icon-wrapper {
  position: relative;
  width: 12rem;
  height: 12rem;
  background-color: #ffffff;
  border-radius: 50%;
  box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6vw;
  margin-bottom: 4vw;
}

.step-icon {
  width: 13rem;
  height: 13rem;
  object-fit: contain;
}

/* Number Badge */
.step-number {
  position: absolute;
  bottom: -3vw;
  background-color: #f97316; /* orange */
  color: #ffffff;
  font-weight: bold;
  width: 3rem;
  height: 3rem;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  font-size: 1rem;
}

/* Step Title */
.step-title {
  margin-top: 1.5rem;
  font-size: 1.125rem;
  font-weight: bold;
  text-transform: uppercase;
  transition: color 0.3s;
}

.step-title:hover {
  color: #f97316;
}

/* Step Description */
.step-description {
  margin-top: 0.5rem;
  color: #4b5563; /* gray-600 */
  font-size: 0.95rem;
  line-height: 1.5;
}
</style>
