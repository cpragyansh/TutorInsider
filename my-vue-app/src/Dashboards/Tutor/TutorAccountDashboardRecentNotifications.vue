<template>
  <div class="recent-notifications">
    <h3>Recent Notifications</h3>
    <div v-for="(note, index) in notifications" :key="index" class="notification">
      <span class="icon">{{ note.icon }}</span>
      <div class="text">
        <p class="message">{{ note.message }}</p>
        <p class="time">{{ note.time }}</p>
      </div>
    </div>
    <a href="#" class="view-all">View All Notifications</a>
  </div>
</template>

<script>
export default {
  name: "RecentNotifications",
  data() {
    return {
      notifications: [
        { icon: "⚠️", message: "Reminder: Background check due in 3 days.", time: "2 hours ago" },
        { icon: "📘", message: "New training module 'Advanced Tutoring Techniques' available.", time: "Yesterday" },
        { icon: "🔔", message: "Your profile has been updated by admin.", time: "2 days ago" },
        { icon: "⚠️", message: "Payment setup required for upcoming payouts.", time: "3 days ago" },
      ],
    };
  },
};
</script>

<style scoped>
.recent-notifications {
  background: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.08);
  flex: 1;
  min-width: 280px;
}

.recent-notifications h3 {
  margin-bottom: 15px;
  font-size: 18px;
  font-weight: 600;
}

.notification {
  display: flex;
  align-items: flex-start;
  margin-bottom: 15px;
  border-bottom: 1px solid #eee;
  padding-bottom: 10px;
}

.notification:last-child {
  border-bottom: none;
}

.icon {
  font-size: 18px;
  margin-right: 10px;
}

.text {
  flex: 1;
}

.message {
  font-size: 14px;
  margin: 0;
  color: #333;
}

.time {
  font-size: 12px;
  color: #777;
}

.view-all {
  display: block;
  margin-top: 10px;
  font-size: 14px;
  text-align: center;
  color: #007bff;
  text-decoration: none;
}

.view-all:hover {
  text-decoration: underline;
}
</style>
