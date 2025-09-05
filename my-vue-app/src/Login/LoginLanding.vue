<template>
  <section class="HLC-login-section">
    <!-- Heading -->
    <h1 class="HLC-login-title">Your Path to Smarter Learning</h1>
    <p class="HLC-login-subtitle">
      Connecting students with expert tutors and providing intuitive management
      tools for a seamless educational journey.
    </p>

    <!-- Cards -->
    <div class="HLC-login-cards">
      <!-- Parents Card -->
      <div class="HLC-login-card">
        <div class="HLC-login-icon">👨‍👩‍👦</div>
        <h3>For Parents</h3>
        <p>
          Find qualified tutors, track your child’s progress, and manage schedules with ease.
        </p>
        <router-link to="/parents/login" class="HLC-login-btn-primary">Login</router-link>
        <router-link to="/Parents/SignUp" class="HLC-login-btn-secondary">Signup</router-link>
      </div>

      <!-- Tutors Card -->
      <div class="HLC-login-card">
        <div class="HLC-login-icon">🎓</div>
        <h3>For Tutors</h3>
        <p class="HLC-LOGIN-para-direct">
          Connect with students, share your expertise, and grow your tutoring business.
        </p>
        <router-link to="/tutors/login" class="HLC-login-btn-primary">Login</router-link>
        <router-link to="/SignUp" class="HLC-login-btn-secondary">Signup</router-link>
      </div>

      <!-- Admins Card -->
      <!-- <div class="HLC-login-card">
        <div class="HLC-login-icon">📊</div>
        <h3>For CRM & Admins</h3>
        <p>
          Manage users, monitor platform activity, and access comprehensive reports.
        </p>
        <router-link to="/admins/login" class="HLC-login-btn-primary">Login</router-link>
        <router-link to="/admins/signup" class="HLC-login-btn-secondary">Signup</router-link>
      </div> -->
    </div>
  </section>
</template>

<script>
export default {
  name: "LoginSelection",
};
</script>

<style>
.HLC-login-section {
  text-align: center;
  padding: 3rem 1rem;
  font-family: Arial, sans-serif;
}

.HLC-login-title {
  font-size: 2rem;
  font-weight: bold;
  color: #111;
}

.HLC-login-subtitle {
  font-size: 1rem;
  color: #666;
  /* max-width: 600px; */
  text-align: center;
  margin: 0.5rem auto 2rem auto;
}

.HLC-login-cards {
  display: flex;
  justify-content: center;
  gap: 1.5rem;
  flex-wrap: wrap;
  align-items: center;
}

.HLC-login-card {
  background: #fff;
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 2rem 1rem;
  width: 280px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.04);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.HLC-login-icon {
  font-size: 2.5rem;
  color: #2563eb;
  margin-bottom: 1rem;
}

.HLC-login-card h3 {
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
}

.HLC-login-card p {
  font-size: 0.9rem;
  color: #666;
  margin-bottom: 1.5rem;
  line-height: 1.4;
  text-align: center;
  margin: auto;
  justify-content: center;
  align-items: center;
}

.HLC-login-btn-primary,
.HLC-login-btn-secondary {
  display: inline-block;
  text-align: center;
  text-decoration: none;
  padding: 0.5rem 1rem;
  width: 80%;
  border-radius: 6px;
  font-size: 0.95rem;
  cursor: pointer;
}

.HLC-login-btn-primary {
  background: #2563eb;
  color: white;
  border: none;
  margin-bottom: 0.5rem;
}

.HLC-login-btn-primary:hover {
  background: #1e4fcf;
}

.HLC-login-btn-secondary {
  background: white;
  color: #333;
  border: 1px solid #ccc;
}

.HLC-login-btn-secondary:hover {
  background: #f5f5f5;
}

@media (max-width: 768px) {
  .HLC-login-cards {
    flex-direction: column;
    align-items: center;
  }
}
</style>
