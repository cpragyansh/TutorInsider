<template>
  <div class="tutor-dashboard-upcomming-container">
    <h3 class="tutor-dashboard-upcomming-title">Upcoming Classes</h3>
    <div class="tutor-dashboard-upcomming-list">
      <div
        v-for="(cls, index) in classes"
        :key="index"
        class="tutor-dashboard-upcomming-item"
      >
        <div class="tutor-dashboard-upcomming-info">
          <p class="tutor-dashboard-upcomming-date">{{ cls.date }}</p>
          <h4 class="tutor-dashboard-upcomming-name">{{ cls.name }}</h4>
          <p class="tutor-dashboard-upcomming-teacher">
            with {{ cls.teacher }} ({{ cls.mode }})
          </p>
        </div>
        <span
          :class="[
            'tutor-dashboard-upcomming-status',
            cls.status === 'Confirmed'
              ? 'tutor-dashboard-upcomming-confirmed'
              : 'tutor-dashboard-upcomming-pending'
          ]"
        >
          {{ cls.status }}
        </span>
      </div>
    </div>
       <TutorScheduleChangeForm/>
  </div>
</template>

<script>
import TutorScheduleChangeForm from './TutorScheduleChangeForm.vue';

export default {
  name: "UpcomingClasses",
  data() {
    return {
      classes: [
        {
          date: "2024-07-20 at 10:00 AM (Class)",
          name: "Algebra I",
          teacher: "Ethan Chen",
          mode: "Remote (Zoom)",
          status: "Confirmed",
        },
        {
          date: "2024-07-22 at 02:30 PM (Demo)",
          name: "Intro to Python",
          teacher: "Mia Patel",
          mode: "Remote (Google Meet)",
          status: "Pending",
        },
        {
          date: "2024-07-25 at 04:00 PM (Class)",
          name: "English Literature",
          teacher: "Sophia Garcia",
          mode: "In-person (New York, NY)",
          status: "Confirmed",
        },
      ],
    };
  },
};
</script>

<style scoped>
.tutor-dashboard-upcomming-container {
  background: #fff;
  padding: 16px;
  border-radius: 8px;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
}
.tutor-dashboard-upcomming-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 12px;
}
.tutor-dashboard-upcomming-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.tutor-dashboard-upcomming-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  border-bottom: 1px solid #eee;
}
.tutor-dashboard-upcomming-info {
  flex: 1;
}
.tutor-dashboard-upcomming-date {
  font-size: 13px;
  color: #666;
}
.tutor-dashboard-upcomming-name {
  font-size: 15px;
  font-weight: 600;
  margin: 4px 0;
}
.tutor-dashboard-upcomming-teacher {
  font-size: 13px;
  color: #777;
}
.tutor-dashboard-upcomming-status {
  padding: 6px 10px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: 600;
  text-transform: capitalize;
}
.tutor-dashboard-upcomming-confirmed {
  background: #e6f4ea;
  color: #1e7d34;
}
.tutor-dashboard-upcomming-pending {
  background: #fdebd3;
  color: #c95f00;
}
</style>
