<template>
  <div class="student-overview">
    <h3 class="title">Student Overview</h3>

    <div class="overview-cards">
      <div class="card">
        <div class="icon">👥</div>
        <div class="number">10</div>
        <div class="label">Total Enrolled</div>
      </div>

      <div class="card">
        <div class="icon">🧑‍🏫</div>
        <div class="number">6</div>
        <div class="label">Active Sessions</div>
      </div>

      <div class="card">
        <div class="icon">➕</div>
        <div class="number">2</div>
        <div class="label">New This Month</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "StudentOverview"
};
</script>

<style scoped>
.student-overview {
  max-width: 100%;
}

.title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 15px;
}

.overview-cards {
  display: flex;
  gap: 20px;
}

.card {
  flex: 1;
  background: #fff;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  box-shadow: 0 1px 2px rgba(0,0,0,0.05);
}

.icon {
  font-size: 28px;
  color: #007bff;
  margin-bottom: 5px;
}

.number {
  font-size: 24px;
  font-weight: bold;
  color: #007bff;
}

.label {
  font-size: 14px;
  color: #555;
}
</style>
