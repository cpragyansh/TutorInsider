<template>
  <div>
    <DashboardHeader :username="user.username" :type="user.type"/>
    <div class="parent-dashboard-content">
      <div class="parent-dashboard-first-combined-section-mixing-block">
        <DemoSection />
        <NotificationSection />
      </div>
      <EnrolledInformationSection />
      <TutorSelection />
      <CrmChatting />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import DashboardHeader from '../Tutor/DashboardHeader.vue';
import DemoSection from './DemoSection.vue';
import NotificationSection from './NotificationSection.vue';
import EnrolledInformationSection from './EnrolledInformationSection.vue';
import TutorSelection from './TutorSelection.vue';
import CrmChatting from './CrmChatting.vue';

export default {
  components: {
    DashboardHeader,
    DemoSection,
    NotificationSection,
    EnrolledInformationSection,
    TutorSelection,
    CrmChatting
  },
  data() {
    return {
      user: {
        username: "",
        type: ""
      },
      dashboardData: {}
    };
  },
  async mounted() {
    // get user info from localStorage (set at login)
    this.user.username = localStorage.getItem("username");
    this.user.type = localStorage.getItem("type");

    const token = localStorage.getItem("token");

    if (token) {
      try {
        const res = await axios.get("/api/dashboard/parent", {
          headers: { Authorization: `Bearer ${token}` }
        });
        if (res.data.success) {
          this.dashboardData = res.data.user;
        }
      } catch (err) {
        console.error(err);
        alert("Failed to load dashboard data");
      }
    }
  }
};
</script>

<style scoped>
.parent-dashboard-first-combined-section-mixing-block {
  display: flex;
  justify-content: center;
  align-items: center;
}
.parent-dashboard-content {
  display: flex;
  flex-direction: column;
  gap: 4vw;
}
</style>
