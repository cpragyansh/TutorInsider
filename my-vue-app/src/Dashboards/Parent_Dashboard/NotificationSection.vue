<template>
  <div class="notifications-container">
    <h2>Recent Notifications</h2>

    <div
      v-for="(notification, index) in notifications"
      :key="notification.id"
      class="notification-item"
      :class="{ highlighted: index === 0 }"
      @click="openNotification(notification)"
    >
      <div class="icon">
        <span v-if="notification.type === 'info'">🔔</span>
        <span v-else-if="notification.type === 'error'">❗</span>
      </div>

      <div class="content">
        <div class="title">{{ notification.title }}</div>
        <div class="message">{{ notification.message }}</div>
        <div class="date">{{ notification.date }}</div>
      </div>

      <span v-if="notification.new" class="badge">New</span>
      <span v-if="notification.important" class="red-dot"></span>
    </div>

    <!-- Popup Modal -->
    <div v-if="selectedNotification" class="modal-overlay">
      <div class="modal">
        <h3>{{ selectedNotification.title }}</h3>
        <p>{{ selectedNotification.message }}</p>
        <p class="date">{{ selectedNotification.date }}</p>

        <div class="modal-actions">
          <button class="btn-remove" @click="removeNotification(selectedNotification.id)">Remove</button>
          <button class="btn-close" @click="selectedNotification = null">Close</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Notifications",
  data() {
    return {
      notifications: [
        {
          id: 1,
          type: "info",
          title: "CRM Team: Welcome to your Parent Dashboard!",
          message: "Explore new features and manage your child's tutoring journey.",
          date: "2024-07-28",
          new: true,
          important: false
        },
        {
          id: 2,
          type: "info",
          title: "Tutor Sarah L.: Demo session completed successfully!",
          message: "Your child had a great session. Please leave feedback.",
          date: "2024-07-27",
          new: true,
          important: false
        },
        {
          id: 3,
          type: "error",
          title: "System: Demo Limit Reached",
          message: "You have reached your maximum of 3 demo sessions. Please select a tutor.",
          date: "2024-07-26",
          new: false,
          important: true
        }
      ],
      selectedNotification: null
    };
  },
  methods: {
    openNotification(notification) {
      this.selectedNotification = notification;
    },
    removeNotification(id) {
      this.notifications = this.notifications.filter(n => n.id !== id);
      this.selectedNotification = null;
    }
  }
};
</script>

<style scoped>
.notifications-container {
  max-width: 700px;
  margin: auto;
}

h2 {
  font-size: 20px;
  margin-bottom: 15px;
}

.notification-item {
  display: flex;
  align-items: flex-start;
  background: #fff;
  border-radius: 8px;
  padding: 12px;
  margin-bottom: 10px;
  position: relative;
  cursor: pointer;
  border: 1px solid transparent;
  transition: all 0.2s ease;
}

.notification-item.highlighted {
  border: 1px solid #d1c4e9; /* Light purple border like screenshot */
}

.notification-item:hover {
  background: #f9f9f9;
}

.icon {
  font-size: 20px;
  margin-right: 10px;
}

.content {
  flex: 1;
}

.title {
  font-weight: bold;
  margin-bottom: 4px;
}

.message {
  font-size: 14px;
  color: #555;
}

.date {
  font-size: 12px;
  color: #999;
}

.badge {
  background: #007bff;
  color: white;
  font-size: 12px;
  padding: 2px 8px;
  border-radius: 12px;
  position: absolute;
  right: 10px;
  top: 10px;
}

.red-dot {
  width: 8px;
  height: 8px;
  background: red;
  border-radius: 50%;
  position: absolute;
  right: 10px;
  top: 14px;
}

/* Modal styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal {
  background: white;
  padding: 20px;
  border-radius: 8px;
  max-width: 500px;
  width: 90%;
}

.modal-actions {
  display: flex;
  justify-content: flex-end;
  margin-top: 15px;
  gap: 10px;
}

.btn-remove {
  background: red;
  color: white;
  border: none;
  padding: 8px 12px;
  border-radius: 6px;
  cursor: pointer;
}

.btn-close {
  background: #ccc;
  border: none;
  padding: 8px 12px;
  border-radius: 6px;
  cursor: pointer;
}
</style>
