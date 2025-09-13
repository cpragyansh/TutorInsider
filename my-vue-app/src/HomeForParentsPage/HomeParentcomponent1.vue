<template>
  <section class="hero-wrap">
    <div class="container">
      <!-- Left Content -->
      <div class="hero-left">
        <div class="sub-heading">
          <span class="line"></span>
          <span class="text">
FOR PARENTS</span>
        </div>

        <h1 class="title">Find the Right Support for Your Child</h1>

        <p class="desc">
         Discover tailored support to help your child thrive academically and emotionally. From expert guidance to personalized learning plans, we provide the resources your child needs to succeed in school and beyond. Empower their future with the right support today
        </p>

        <div class="buttons">
          <button class="btn orange">Free Consultation</button>
          <button class="btn blue">Browse Tutors</button>
        </div>
      </div>

      <!-- Right Image -->
      <div class="hero-right">
        <img
          src="https://tutorinsider.com/wp-content/uploads/2025/05/FOR-PARENTSS.png"
          alt="Tutor"
        />
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "HeroSection",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap");

.hero-wrap {
  padding: 10px 20px;
  font-family: "Inter", sans-serif;
  background: #fff;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 40px;
}

.hero-left {
  flex: 1;
}

.sub-heading {
  display: flex;
  align-items: center;
  margin-bottom: 12px;
  font-size: 12px;
  font-weight: 600;
  color: #f97316; /* orange */
  letter-spacing: 1px;
  text-transform: uppercase;
}

.sub-heading .line {
  width: 40px;
  height: 2px;
  background: #f97316;
  margin-right: 8px;
}

.title {
  font-size: 44px;
  font-weight: 700;
  line-height: 1.2;
  color: #f97316; /* orange */
  margin-bottom: 20px;
}

.desc {
  font-size: 16px;
  line-height: 1.6;
  color: #24323a;
  margin-bottom: 28px;
  max-width: 600px;
}

.buttons {
  display: flex;
  gap: 16px;
}

.btn {
  padding: 14px 28px;
  border-radius: 999px;
  font-weight: 600;
  font-size: 14px;
  letter-spacing: 0.5px;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #fff;
  box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
}

.btn.orange {
  background: linear-gradient(135deg, #f97316, #fca311);
}

.btn.orange:hover {
  background: linear-gradient(135deg, #f96300, #ff9900);
}

.btn.blue {
  background: linear-gradient(135deg, #2563eb, #1d4ed8);
}

.btn.blue:hover {
  background: linear-gradient(135deg, #1d4ed8, #1e40af);
}

.hero-right {
  flex: 1;
  display: flex;
  justify-content: center;
}

.hero-right img {
  max-width: 60%;
  height: auto;
  border-radius: 8px;
}

/* Responsive */
@media (max-width: 900px) {
  .container {
    flex-direction: column;
    text-align: center;
  }
  .hero-left {
    order: 2;
  }
  .hero-right {
    order: 1;
  }
  .title {
    font-size: 32px;
  }
  .desc {
    font-size: 14px;
  }
  .buttons {
    justify-content: center;
  }
}
</style>
