<template>
  <section class="categories-wrap">
    <div class="container">
      <!-- By Class -->
      <div class="section-block">
        <h3 class="section-title">By Class</h3>
        <div class="icons-grid">
          <div v-for="(item, i) in sections.class" :key="'class-'+i" class="icon-card" @click="select(item)">
            <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
            <div class="icon-label">{{ item.label }}</div>
          </div>
        </div>
      </div>

      <!-- By Subject -->
      <div class="section-block">
        <h3 class="section-title">By Subject</h3>
        <div class="icons-grid">
          <div v-for="(item, i) in sections.subject" :key="'sub-'+i" class="icon-card" @click="select(item)">
            <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
            <div class="icon-label">{{ item.label }}</div>
          </div>
        </div>
      </div>

      <!-- Board / Goal two-column block -->
      <div class="section-block two-col">
        <div class="col left-col">
          <h3 class="section-title small">By Board</h3>
          <div class="icons-grid board-grid">
            <div v-for="(item,i) in sections.board" :key="'board-'+i" class="icon-card" @click="select(item)">
              <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
              <div class="icon-label">{{ item.label }}</div>
            </div>
          </div>
        </div>

        <div class="col right-col">
          <h3 class="section-title small">By Goal</h3>
          <div class="icons-grid goal-grid">
            <div v-for="(item,i) in sections.goal" :key="'goal-'+i" class="icon-card" @click="select(item)">
              <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
              <div class="icon-label">{{ item.label }}</div>
            </div>
          </div>
        </div>
      </div>

      <!-- By Special Need -->
      <div class="section-block">
        <h3 class="section-title">By Special Need</h3>
        <div class="icons-grid">
          <div v-for="(item,i) in sections.special" :key="'spec-'+i" class="icon-card" @click="select(item)">
            <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
            <div class="icon-label">{{ item.label }}</div>
          </div>
        </div>
      </div>

      <!-- By Mode -->
      <div class="section-block">
        <h3 class="section-title">By Mode</h3>
        <div class="icons-grid">
          <div v-for="(item,i) in sections.mode" :key="'mode-'+i" class="icon-card" @click="select(item)">
            <div class="icon-square"><img :src="item.icon" :alt="item.label" @error="imgError" /></div>
            <div class="icon-label">{{ item.label }}</div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "CategoriesExact",
  data() {
    const tempImg = "https://tutorinsider.com/wp-content/uploads/2025/05/Arts.png";
    return {
      sections: {
        class: [
          { label: "Pre-Primary", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Pre-Primary.png" },
          { label: "Primary", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Primary-1.png" },
          { label: "Middle", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Middle.png" },
          { label: "Secondary", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Secondry.png" },
          { label: "Competitive Exam", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Competittive-Exam.png" },
        ],
        subject: [
          { label: "English", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/englishh.png" },
          { label: "Hindi", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Hindi.png" },
          { label: "Mathematics", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Mathematics.png" },
          { label: "Social Studies", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Social-Studies.png" },
          { label: "Science", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/STATE-BOARD.png"},
          { label: "Computer", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Computer.png" },
          { label: "Arts", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Arts.png" },
          { label: "Music", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Music.png" },
          { label: "Dance", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/dancesub.png" },
          { label: "More", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/More.png" },
        ],
        board: [
          { label: "CBSE", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/CBSE.png"},
          { label: "ICSE", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/ICSE.png" },
          { label: "State Board", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/STATE-BOARD.png" },
          { label: "IB", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/IB.png" },
          { label: "CAMBRIDGE", icon:"https://tutorinsider.com/wp-content/uploads/2025/05/CAMBRIDGE.png" },
        ],
        goal: [
          { label: "JEE/NEET", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/JEE_NEET.png" },
          { label: "Career Counselling", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Career-Couseliing-1.png" },
        ],
        special: [
          { label: "Special Educators", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Special-Educators.png" },
          { label: "Public Speaking", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Public-Speaking.png" },
          { label: "Shadow Teacher", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Shadow-Teacher.png" },
        ],
        mode: [
          { label: "Home Tuition", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Homee-Tuitionn.png" },
          { label: "Online", icon: "https://tutorinsider.com/wp-content/uploads/2025/05/Online.png" },
        ],
      },
    };
  },
  methods: {
    select(item) {
      this.$emit("select-category", item);
    },
    imgError(e) {
      e.target.src =
        "data:image/svg+xml;utf8," +
        encodeURIComponent(
          `<svg xmlns='http://www.w3.org/2000/svg' width='120' height='120'><rect width='100%' height='100%' fill='#fff'/><text x='50%' y='50%' text-anchor='middle' dy='.3em' fill='#999' font-size='12'>icon</text></svg>`
        );
    },
  },
};
</script>


<style scoped>
/* fonts */
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap");

.categories-wrap {
  padding: 28px 20px;
  font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
  color: #24323a;
}

.container {
  max-width: 60vw;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  gap: 2vw;
}

/* section spacing */
.section-block {
  margin-bottom: 28px;
}

/* headings */
.section-title {
  font-size: 1.2vw;
  font-weight: 600;
  color: #24323a;
  margin: 6px 0 12px;
}
.section-title.small {
  margin-bottom: 0.8vw;
}

/* grid shared */
.icons-grid {
  display: grid;
  grid-template-columns: repeat(5, 1fr); /* wide screens - plenty of columns to control spacing */
  gap: 18px 28px;
  align-items: center;
}

/* board and goal specific smaller grids */
.board-grid { grid-template-columns: repeat(3, 1fr); }
.goal-grid { grid-template-columns: repeat(2, 1fr); }

/* icon card */
.icon-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 120px;
  cursor: pointer;
  user-select: none;
}

/* white rounded square with inner and drop shadows */
.icon-square {
  width: 10vw;
  height: 8vw;
  border-radius: 10px;
  background: #ffffff;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow:
    0 8px 18px rgba(36,50,58,0.08),
    inset 0 3px 6px rgba(0,0,0,0.03);
  transition: transform .14s ease, box-shadow .14s ease;
}

/* image */
.icon-square img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}

/* label */
.icon-label {
  margin-top: 8px;
  font-size: 1vw;
  color: black;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  width: 100%;
}

/* hover effect */
.icon-card:hover .icon-square {
  transform: translateY(-8px);
  box-shadow: 0 22px 40px rgba(36,50,58,0.12);
}

/* two column layout for boards/goals */
.two-col {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 18px 40px;
  align-items: start;
}
.two-col .col { min-height: 1px; }

/* responsive adjustments */
@media (max-width: 1100px) {
  .icons-grid { grid-template-columns: repeat(8, 1fr); gap: 16px 22px; }
  .board-grid { grid-template-columns: repeat(3, 1fr); }
  .goal-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 860px) {
  .container { padding: 0 12px; }
  .icons-grid { grid-template-columns: repeat(4, 1fr); gap: 14px 18px; }
  .two-col { grid-template-columns: 1fr; }
  .icon-square { width: 72px; height: 72px; }
  .icon-square img { width: 42px; height: 42px; }
}

@media (max-width: 520px) {
  .icons-grid { grid-template-columns: repeat(3, 1fr); gap: 12px; }
  .icon-square { width: 66px; height: 66px; }
  .icon-square img { width: 36px; height: 36px; }
  .icon-label { font-size: 11px; }
}
</style>
