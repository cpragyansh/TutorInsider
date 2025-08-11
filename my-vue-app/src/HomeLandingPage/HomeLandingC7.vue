<template>
  <section class="HLC7-faq-section">
    <h2 class="HLC7-title">Frequently Asked Questions</h2>
    <div
      v-for="(faq, index) in faqs"
      :key="index"
      class="HLC7-faq-item"
    >
      <button class="HLC7-faq-question" @click="toggleFAQ(index)">
        <span>{{ faq.question }}</span>
        <span class="HLC7-icon">
          <svg
            v-if="activeIndex === index"
            xmlns="http://www.w3.org/2000/svg"
            class="HLC7-arrow"
            viewBox="0 0 24 24"
            width="20"
            height="20"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <polyline points="18 15 12 9 6 15"></polyline>
          </svg>
          <svg
            v-else
            xmlns="http://www.w3.org/2000/svg"
            class="HLC7-plus"
            viewBox="0 0 24 24"
            width="20"
            height="20"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <line x1="12" y1="5" x2="12" y2="19"></line>
            <line x1="5" y1="12" x2="19" y2="12"></line>
          </svg>
        </span>
      </button>
      <transition name="HLC7-slide">
        <div v-if="activeIndex === index" class="HLC7-faq-answer">
          {{ faq.answer }}
        </div>
      </transition>
    </div>
  </section>
</template>

<script>
export default {
  name: "FAQSection",
  data() {
    return {
      activeIndex: null,
      faqs: [
        {
          question: "How do I choose the right tutor?",
          answer: "We help you choose a tutor based on your learning needs, preferences, and subject requirements.",
        },
        {
          question: "What subjects do you offer tutoring in?",
          answer: "We offer tutoring for a wide range of subjects, from math and science to languages and test preparation.",
        },
        {
          question: "Are sessions online or in-person?",
          answer: "We offer both online and in-person sessions, depending on your location and preference.",
        },
        {
          question: "What is your cancellation policy?",
          answer: "You can cancel or reschedule a session up to 24 hours in advance without any penalty.",
        },
        {
          question: "How are payments handled?",
          answer: "Payments can be made securely through our online platform using credit/debit cards or PayPal.",
        },
      ],
    };
  },
  methods: {
    toggleFAQ(index) {
      this.activeIndex = this.activeIndex === index ? null : index;
    },
  },
};
</script>

<style scoped>
.HLC7-faq-section {
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem 1rem;
}

.HLC7-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2rem;
  text-align: center;
}

.HLC7-faq-item {
  border-bottom: 1px solid #eee;
}

.HLC7-faq-question {
  background: white;
  border: none;
  width: 100%;
  text-align: left;
  padding: 1rem;
  font-size: 1rem;
  font-weight: 500;
  display: flex;
  justify-content: space-between;
  align-items: center;
  cursor: pointer;
}

.HLC7-icon {
  display: flex;
  align-items: center;
  justify-content: center;
}

.HLC7-plus,
.HLC7-arrow {
  color: #333;
}

.HLC7-faq-answer {
  padding: 0 1rem 1rem;
  font-size: 0.95rem;
  color: #555;
  line-height: 1.5;
}

/* Smooth slide animation */
.HLC7-slide-enter-active,
.HLC7-slide-leave-active {
  transition: all 0.3s ease;
}
.HLC7-slide-enter-from,
.HLC7-slide-leave-to {
  max-height: 0;
  opacity: 0;
  overflow: hidden;
}
.HLC7-slide-enter-to,
.HLC7-slide-leave-from {
  max-height: 200px;
  opacity: 1;
}
</style>
