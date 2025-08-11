<template>
  <div class="notifications-page">
    <h1 class="title">Recent Notifications</h1>

    <div class="notifications-list">
      <div
        v-for="(notification, index) in notifications"
        :key="index"
        class="notification-item"
        :class="notification.type"
      >
        <div class="icon">
          <span v-if="notification.type === 'info'">🔔</span>
          <span v-if="notification.type === 'warning'">⚠️</span>
          <span v-if="notification.type === 'error'">❗</span>
        </div>
        <div class="content">
          <div class="header">
            <strong>{{ notification.title }}</strong>
            <span v-if="notification.isNew" class="badge">New</span>
          </div>
          <p>{{ notification.message }}</p>
          <span class="date">{{ notification.date }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NotificationsPage",
  data() {
    return {
      notifications: [
        {
          type: "info",
          title: "CRM Team: Welcome to your Parent Dashboard!",
          message: "Explore new features and manage your child's tutoring journey.",
          date: "2024-07-28",
          isNew: true
        },
        {
          type: "warning",
          title: "Tutor Sarah L.: Demo session completed successfully!",
          message: "Your child had a great session. Please leave feedback.",
          date: "2024-07-27",
          isNew: true
        },
        {
          type: "error",
          title: "System: Demo Limit Reached",
          message: "You have reached your maximum of 3 demo sessions. Please select a tutor.",
          date: "2024-07-26",
          isNew: false
        },
        {
          type: "info",
          title: "CRM Team: New feature released!",
          message: "Check out the new progress tracking feature for students.",
          date: "2024-07-25",
          isNew: false
        },
        {
          type: "warning",
          title: "Tutor Alex B.: Rescheduled session",
          message: "Your session has been rescheduled to August 5th, 2024.",
          date: "2024-07-24",
          isNew: false
        },
        {
          type: "error",
          title: "System: Payment Failed",
          message: "Your last payment attempt was unsuccessful. Please update billing info.",
          date: "2024-07-23",
          isNew: true
        }
      ]
    };
  }
};
</script>

<style scoped>
.notifications-page {
  padding: 40px;
  font-family: Arial, sans-serif;
  background: #fff;
  min-height: 100vh;
}

.title {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 30px;
}

.notifications-list {
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.notification-item {
  display: flex;
  background: white;
  border-radius: 10px;
  padding: 25px;
  box-shadow: 0px 4px 12px rgba(0,0,0,0.05);
  border-left: 6px solid transparent;
  align-items: flex-start;
}

.notification-item.info {
  border-left-color: #007bff;
}

.notification-item.warning {
  border-left-color: #ff9800;
}

.notification-item.error {
  border-left-color: #f44336;
}

.icon {
  font-size: 28px;
  margin-right: 20px;
}

.content {
  flex: 1;
}

.header {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 18px;
  font-weight: bold;
}

.header strong {
  font-weight: bold;
}

.badge {
  background: #007bff;
  color: white;
  font-size: 12px;
  padding: 4px 8px;
  border-radius: 20px;
}

p {
  margin: 6px 0;
  font-size: 16px;
  color: #555;
}

.date {
  display: block;
  margin-top: 6px;
  font-size: 14px;
  color: #999;
}
</style>
