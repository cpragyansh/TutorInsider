<template>
  <div>
    <DashboardHeader :username="user.username" :type="user.type"/>
    <div class="tutor-dashboard-content">
      <h1>Tutor Dashboard</h1>
      <!-- Here you can show tutor-specific data -->
      <pre>{{ dashboardData }}</pre>
    </div>

    <div class="tutor_main_page_component_1_combined">
    <TutorAccountActivationStatus/>
    <TutorAccountPaymentSummary/>
    </div>
    <TutorUpcomingClasses/>
    <TutorScheduleChangeForm/>
  </div>
</template>

<script>
import axios from "axios";
import DashboardHeader from './DashboardHeader.vue';
import TutorAccountActivationStatus from "./TutorAccountActivationStatus.vue";
import TutorAccountPaymentSummary from "./TutorAccountPaymentSummary.vue";
import TutorUpcomingClasses from "./TutorUpcomingClasses.vue";
import TutorScheduleChangeForm from "./TutorScheduleChangeForm.vue";

export default {
  components: { DashboardHeader,TutorAccountActivationStatus,TutorAccountPaymentSummary,TutorUpcomingClasses,TutorScheduleChangeForm },
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
        const res = await axios.get("http://localhost:5000/api/me", {
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
.tutor-dashboard-content {
  padding: 20px;
}
.tutor_main_page_component_1_combined{
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
}
</style>
