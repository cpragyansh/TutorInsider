<template>
  <section class="HLC4-pricing-section">
    <h2 class="HLC4-pricing-title">Flexible Plans for Every Student</h2>
    <div class="HLC4-pricing-cards">
      <div
        class="HLC4-pricing-card"
        v-for="(plan, index) in plans"
        :key="index"
        :class="{ 'HLC4-highlighted': plan.highlighted }"
      >
        <h3 class="HLC4-plan-name">{{ plan.name }}</h3>
        <p class="HLC4-plan-price">
          <span class="HLC4-price-amount">${{ plan.price }}</span
          ><span class="HLC4-price-duration">/month</span>
        </p>
        <ul class="HLC4-plan-features">
          <li v-for="(feature, fIndex) in plan.features" :key="fIndex">
            <span class="HLC4-check-icon">✔</span> {{ feature }}
          </li>
        </ul>
        <button class="HLC4-get-started-btn">Get Started</button>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "PricingSection",
  data() {
    return {
      plans: [
        {
          name: "Basic Learner",
          price: 49,
          features: [
            "2 hours/month private sessions",
            "Access to basic study materials",
            "Email support",
            "Monthly progress reports",
          ],
          highlighted: false,
        },
        {
          name: "Accelerated Growth",
          price: 99,
          features: [
            "5 hours/month private sessions",
            "Premium study resources",
            "Priority email/chat support",
            "Personalized learning plan",
            "Bi-weekly progress calls",
          ],
          highlighted: false,
        },
        {
          name: "Mastery Program",
          price: 189,
          features: [
            "10 hours/month private sessions",
            "All premium features",
            "24/7 dedicated tutor support",
            "Exclusive workshop access",
            "Guaranteed progress tracking",
          ],
          highlighted: true,
        },
      ],
    };
  },
};
</script>

<style scoped>
.HLC4-pricing-section {
  text-align: center;
  padding: 3rem 1rem;
  max-width: 1200px;
  margin: 0 auto;
}

.HLC4-pricing-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2.5rem;
}

.HLC4-pricing-cards {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem;
  justify-content: center;
}

.HLC4-pricing-card {
  background: white;
  border-radius: 12px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.06);
  padding: 1.5rem;
  width: 100%;
  max-width: 320px;
  text-align: left;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  transition: transform 0.3s ease;
}

.HLC4-pricing-card:hover {
  transform: translateY(-5px);
}

.HLC4-highlighted {
  border: 2px solid #cfc3ff;
}

.HLC4-plan-name {
  font-size: 1.2rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.HLC4-plan-price {
  font-size: 1.4rem;
  font-weight: bold;
  margin-bottom: 1rem;
}

.HLC4-price-amount {
  font-size: 2rem;
}

.HLC4-price-duration {
  font-size: 1rem;
  font-weight: 400;
  color: #555;
}

.HLC4-plan-features {
  list-style: none;
  padding: 0;
  margin: 0 0 1.5rem 0;
}

.HLC4-plan-features li {
  font-size: 0.95rem;
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
}

.HLC4-check-icon {
  color: #2d9cdb;
  font-weight: bold;
  margin-right: 0.5rem;
}

.HLC4-get-started-btn {
  background-color: #0077b6;
  color: white;
  border: none;
  padding: 0.7rem;
  border-radius: 6px;
  font-size: 0.95rem;
  cursor: pointer;
  text-align: center;
  transition: background-color 0.3s ease;
}

.HLC4-get-started-btn:hover {
  background-color: #005f86;
}

/* Responsive */
@media (max-width: 768px) {
  .HLC4-pricing-cards {
    flex-direction: column;
    align-items: center;
  }
}
</style>
