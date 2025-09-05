<template>
  <div class="tutor-dashboard-schedule-chaange-container">
    <h3 class="tutor-dashboard-schedule-chaange-title">Propose Class Changes</h3>
    <p class="tutor-dashboard-schedule-chaange-desc">
      Use this form to request changes to class schedules or other related
      information. Be specific about the class ID and proposed changes.
    </p>
    <textarea
      v-model="requestText"
      class="tutor-dashboard-schedule-chaange-textarea"
      placeholder="E.g., Request to reschedule Algebra I (ID: upc-001) from 10:00 AM to 11:30 AM on July 20th due to a prior commitment. Student Ethan Chen has been informed."
    ></textarea>
    <button
      class="tutor-dashboard-schedule-chaange-button"
      @click="submitRequest"
    >
      Submit Request
    </button>
  </div>
</template>

<script>
export default {
  name: "ScheduleChangeForm",
  data() {
    return {
      requestText: "",
    };
  },
  methods: {
    submitRequest() {
      if (!this.requestText.trim()) {
        alert("Please enter a request before submitting.");
        return;
      }
      alert("Request submitted: " + this.requestText);
      this.requestText = "";
    },
  },
};
</script>

<style scoped>
.tutor-dashboard-schedule-chaange-container {
  background: #fff;
  padding: 16px;
  border-radius: 8px;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
}
.tutor-dashboard-schedule-chaange-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 10px;
}
.tutor-dashboard-schedule-chaange-desc {
  font-size: 13px;
  color: #666;
  margin-bottom: 12px;
}
.tutor-dashboard-schedule-chaange-textarea {
  width: 100%;
  height: 100px;
  padding: 10px;
  font-size: 13px;
  border: 1px solid #ddd;
  border-radius: 6px;
  resize: none;
  margin-bottom: 12px;
}
.tutor-dashboard-schedule-chaange-button {
  width: 100%;
  background: #3b82f6;
  color: #fff;
  border: none;
  padding: 10px;
  font-size: 14px;
  font-weight: 600;
  border-radius: 6px;
  cursor: pointer;
}
.tutor-dashboard-schedule-chaange-button:hover {
  background: #2563eb;
}
</style>
