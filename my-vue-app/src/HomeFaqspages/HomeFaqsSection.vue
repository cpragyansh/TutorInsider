<template>
  <section class="faq-section" aria-labelledby="faq-title">
    <div class="wrap">
      <header class="faq-header">
        <h1 id="faq-title" class="title">Frequently Asked Questions</h1>
        <div class="eyebrow">
          <span class="eyebrow-bar"></span>
          <span class="eyebrow-text">FAQ</span>
        </div>
      </header>

      <div class="faq-grid">
        <!-- left column -->
        <div class="col">
          <div
            v-for="(item, idx) in leftFaqs"
            :key="item.id"
            class="faq-card"
          >
            <div
              class="faq-toggle"
              role="button"
              :tabindex="0"
              @click="toggle(item.id)"
              @keydown.enter.prevent="toggle(item.id)"
              @keydown.space.prevent="toggle(item.id)"
              :aria-expanded="isOpen(item.id)"
              :aria-controls="'panel-'+item.id"
            >
              <div class="question">
                <strong>{{ item.q }}</strong>
              </div>

              <div class="icon" :class="{ open: isOpen(item.id) }" aria-hidden>
                <svg viewBox="0 0 24 24" width="18" height="18">
                  <circle cx="12" cy="12" r="10" :fill="--orange" />
                  <path v-if="!isOpen(item.id)" d="M8 12h8" stroke="#fff" stroke-width="2.2" stroke-linecap="round"/>
                  <g v-else stroke="#fff" stroke-width="2.2" stroke-linecap="round"><path d="M8 12h8"/><path d="M12 8v8"/></g>
                </svg>
              </div>
            </div>

            <div
              class="panel"
              :id="'panel-'+item.id"
              :aria-hidden="!isOpen(item.id)"
              ref="panels"
              :style="panelStyle(item.id)"
            >
              <p class="answer">{{ item.a }}</p>
            </div>
          </div>
        </div>

        <!-- right column -->
        <div class="col">
          <div
            v-for="(item, idx) in rightFaqs"
            :key="item.id"
            class="faq-card"
          >
            <div
              class="faq-toggle"
              role="button"
              :tabindex="0"
              @click="toggle(item.id)"
              @keydown.enter.prevent="toggle(item.id)"
              @keydown.space.prevent="toggle(item.id)"
              :aria-expanded="isOpen(item.id)"
              :aria-controls="'panel-'+item.id"
            >
              <div class="question">
                <strong>{{ item.q }}</strong>
              </div>

              <div class="icon" :class="{ open: isOpen(item.id) }" aria-hidden>
                <svg viewBox="0 0 24 24" width="18" height="18">
                  <circle cx="12" cy="12" r="10" :fill="--orange" />
                  <path v-if="!isOpen(item.id)" d="M8 12h8" stroke="#fff" stroke-width="2.2" stroke-linecap="round"/>
                  <g v-else stroke="#fff" stroke-width="2.2" stroke-linecap="round"><path d="M8 12h8"/><path d="M12 8v8"/></g>
                </svg>
              </div>
            </div>

            <div
              class="panel"
              :id="'panel-'+item.id"
              :aria-hidden="!isOpen(item.id)"
              ref="panels"
              :style="panelStyle(item.id)"
            >
              <p class="answer">{{ item.a }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "FaqSection",
  data() {
    // Sample FAQ data, split into left/right arrays for the two-column layout.
    // IDs unique across both columns
    return {
      faqs: [
        { id: "q1", q: "Q1. How do I find the right tutor or counselor?", a: "Simply post your requirement and we’ll suggest suitable educators based on your needs." },
        { id: "q2", q: "Q2. Are the Tutors verified?", a: "Yes — we run identity checks and basic verification for tutors who join our platform." },
        { id: "q3", q: "Q3. Is there a fee to post a requirement?", a: "Posting a requirement is free. We may offer premium matching services for a fee in the future." },
        { id: "q4", q: "Q4. Can I ask for a trial class before finalizing?", a: "Yes, you are entitled to a demo class before making a final decision. This allows you to assess the tutor’s teaching style." },
        { id: "q5", q: "Q5. How are payments handled?", a: "Payments are processed securely through our payment gateway. Details and receipts are available in your dashboard." },
        { id: "q6", q: "Q6. Do you provide support for special children?", a: "Yes — we have special educators and resources to support children with special needs." },
        { id: "q7", q: "Q7. Can I use your services in small towns or only in metro cities?", a: "Our services are available nationwide. Tutor availability may vary by location, and we actively onboard tutors from smaller towns." },
      ],
      openIds: new Set(["q1", "q4"]), // default opened items (matching screenshot: left first and right first open)
    };
  },
  computed: {
    leftFaqs() {
      // take alternating faqs for left column (or choose first half)
      // here we'll take indexes 0,1,2 for left to match screenshot ordering
      return this.faqs.slice(0, 3);
    },
    rightFaqs() {
      // the remaining on right (we'll place q4..q6..q7 etc)
      return this.faqs.slice(3);
    },
  },
  methods: {
    isOpen(id) {
      return this.openIds.has(id);
    },
    toggle(id) {
      if (this.openIds.has(id)) this.openIds.delete(id);
      else this.openIds.add(id);
      // ensure reactivity by creating a new Set reference
      this.openIds = new Set(this.openIds);
      this.$nextTick(() => {
        // optional: scroll opened panel into view if needed
        const panel = document.getElementById("panel-" + id);
        if (panel && this.isOpen(id)) {
          // smooth ensure visible
          panel.scrollIntoView({ behavior: "smooth", block: "nearest" });
        }
      });
    },
    panelStyle(id) {
      // Use max-height transition technique: compute actual scrollHeight when open
      if (this.isOpen(id)) {
        const el = document.getElementById("panel-" + id);
        if (el) {
          return { maxHeight: el.scrollHeight + "px" };
        }
        // fallback large
        return { maxHeight: "500px" };
      } else {
        return { maxHeight: "0px" };
      }
    },
  },
};
</script>

<style scoped>
/* fonts */
@import url("https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Inter:wght@300;400;600&display=swap");

/* color tokens */
:root {
  --accent-orange: #ff8a2b;
  --soft-blue-glow: rgba(30, 90, 140, 0.06);
  --card-bg: #fff;
  --text: #24323a;
}

/* outer section */
.faq-section {
  padding: 44px 18px 80px;
  background: #fff;
  color: var(--text);
  font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
}

.wrap {
  max-width: 1180px;
  margin: 0 auto;
}

/* header */
.faq-header {
  margin-bottom: 22px;
}

.title {
  font-family: "Montserrat", sans-serif;
  font-size: 48px;
  margin: 0 0 8px;
  color: #2b3740;
}

/* eyebrow small orange line + text */
.eyebrow {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-top: 10px;
  font-size: 12px;
  color: var(--accent-orange);
}
.eyebrow-bar {
  width: 36px;
  height: 6px;
  background: var(--accent-orange);
  border-radius: 3px;
  display: inline-block;
  box-shadow: 0 0 0 4px rgba(255,138,43,0.03);
}

/* two-column grid */
.faq-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 26px 36px;
  align-items: start;
}

/* individual card */
.faq-card {
  background: transparent;
}

/* toggle row (clickable) */
.faq-toggle {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 22px;
  background: var(--card-bg);
  border-radius: 10px;
  cursor: pointer;
  box-shadow:
    0 10px 30px rgba(14,30,40,0.04),
    0 0 30px rgba(100,160,220,0.06); /* soft blue glow */
  border: 1px solid rgba(30,90,140,0.02);
  transition: transform .12s ease, box-shadow .14s ease;
  user-select: none;
}

.faq-toggle:focus {
  outline: none;
  box-shadow: 0 0 0 4px rgba(255,138,43,0.08);
}

/* slight raise on hover */
.faq-toggle:hover {
  transform: translateY(-4px);
  box-shadow:
    0 16px 40px rgba(14,30,40,0.06),
    0 0 40px rgba(100,160,220,0.08);
}

/* question text */
.question strong {
  font-size: 15px;
  color: #233;
}

/* icon */
.icon {
  width: 40px;
  height: 40px;
  flex: 0 0 40px;
  display: grid;
  place-items: center;
  transition: transform .18s ease;
}
.icon.open { transform: rotate(180deg); }

/* panel (answer) with animated max-height */
.panel {
  overflow: hidden;
  transition: max-height 320ms cubic-bezier(.2,.9,.2,1);
  max-height: 0;
  background: transparent;
}

/* panel content card style */
.answer {
  margin: 14px 0 0 0;
  padding: 18px 22px 22px;
  background: #fff;
  border-radius: 8px;
  box-shadow:
    0 18px 40px rgba(100,160,220,0.06);
  color: #5a6a6f;
  line-height: 1.85;
  font-size: 14px;
}

/* small FAQ items (collapsed) have reduced padding — handled above */

/* Responsive */
@media (max-width: 980px) {
  .faq-grid { grid-template-columns: 1fr; gap: 16px; }
  .title { font-size: 40px; }
}

/* very small screens */
@media (max-width: 520px) {
  .title { font-size: 28px; }
  .faq-toggle { padding: 16px; }
  .answer { padding: 14px; font-size: 13px; }
}
</style>
