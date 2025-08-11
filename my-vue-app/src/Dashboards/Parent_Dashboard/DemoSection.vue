<template>
  <div class="ParentDashboardDemoSection-container">
    <!-- Title -->
    <h2 class="ParentDashboardDemoSection-title">Demo Sessions Remaining</h2>
    <p class="ParentDashboardDemoSection-subtitle">
      You have 2 out of 3 demo sessions left.
    </p>

    <!-- Session Card -->
    <div class="ParentDashboardDemoSection-sessionCard">
      <img
        src="https://randomuser.me/api/portraits/women/44.jpg"
        alt="Alice Johnson"
        class="ParentDashboardDemoSection-avatar"
      />
      <div class="ParentDashboardDemoSection-details">
        <p class="ParentDashboardDemoSection-name">Alice Johnson</p>
        <p class="ParentDashboardDemoSection-date">Aug 5, 2024 at 10:00 AM PST</p>
        <span class="ParentDashboardDemoSection-status">Scheduled</span>
      </div>
      <button class="ParentDashboardDemoSection-feedbackBtn">Give Feedback</button>
    </div>

    <!-- Footer -->
    <div class="ParentDashboardDemoSection-footer">
      <span class="ParentDashboardDemoSection-demoCount">2 Demos</span>
      <button class="ParentDashboardDemoSection-bookBtn">Book Another Demo</button>
    </div>
  </div>
</template>

<style scoped>
.ParentDashboardDemoSection-container {
  background-color: #f0f8ff;
  border-radius: 12px;
  padding: 16px;
  width: 30vw;
  font-family: Arial, sans-serif;
  font-size: 14px;
}

.ParentDashboardDemoSection-title {
  font-weight: 600;
  color: #1f2937;
  margin: 0;
}

.ParentDashboardDemoSection-subtitle {
  color: #6b7280;
  margin: 4px 0 0 0;
}

.ParentDashboardDemoSection-sessionCard {
  background-color: white;
  border-radius: 10px;
  display: flex;
  align-items: center;
  padding: 12px;
  margin-top: 16px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.ParentDashboardDemoSection-avatar {
  width: 5vw;
  height: 5vw;
  border-radius: 50%;
}

.ParentDashboardDemoSection-details {
  flex: 1;
  margin-left: 10px;
}

.ParentDashboardDemoSection-name {
  font-weight: 600;
  font-size: 1.1vw;
  color: #1f2937;
  margin: 0;
}

.ParentDashboardDemoSection-date {
  color: #6b7280;
  font-size: 0.9vw;
  margin: 2px 0;
}

.ParentDashboardDemoSection-status {
  display: inline-block;
  background-color: #e5e7eb;
  color: #374151;
  font-size: 11px;
  padding: 8px 20px;
  border-radius: 999px;
  margin-top: 0.6vw;
}

.ParentDashboardDemoSection-feedbackBtn {
  background-color: #dbeafe;
  color: #3b82f6;
  font-size: 12px;
  font-weight: 600;
  padding: 6px 10px;
  border-radius: 8px;
  border: none;
  cursor: pointer;
}

.ParentDashboardDemoSection-feedbackBtn:hover {
  background-color: #bfdbfe;
}

.ParentDashboardDemoSection-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 14px;
}

.ParentDashboardDemoSection-demoCount {
  background-color: #dfe1e4;
  padding: 8px 20px;
  border-radius: 999px;
  font-size: 0.8vw;
  color: #1f2937;
  font-weight: 600;
}

.ParentDashboardDemoSection-bookBtn {
  border: 1px solid #d1d5db;
background-color: #dfe1e4;
  color: #1f2937;
  padding: 8px 20px;
  font-size: 0.8vw;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
}

.ParentDashboardDemoSection-bookBtn:hover {
  background-color: #f9fafb;
}
</style>
