<template>
  <div class="TUTORDASHBOARD_HOME_container">
    <h3 class="TUTORDASHBOARD_HOME_title">Account Activation Status</h3>

    <!-- Progress row -->
    <div class="TUTORDASHBOARD_HOME_progressRow">
      <div class="TUTORDASHBOARD_HOME_progressBar">
        <div class="TUTORDASHBOARD_HOME_progressFill" :style="{ width: progress + '%' }"></div>
      </div>
      <div class="TUTORDASHBOARD_HOME_progressText">
        {{ progress }}% Complete
      </div>
    </div>

    <!-- Task list -->
    <ul class="TUTORDASHBOARD_HOME_list">
      <li
        v-for="(task, i) in tasks"
        :key="i"
        class="TUTORDASHBOARD_HOME_item"
      >
        <input
          type="checkbox"
          v-model="task.completed"
          class="TUTORDASHBOARD_HOME_checkbox"
          :aria-label="task.label"
        />

        <span class="TUTORDASHBOARD_HOME_label">{{ task.label }}</span>

        <!-- right column -->
        <div class="TUTORDASHBOARD_HOME_rightCol">
          <a
            v-if="task.action && !task.completed"
            href="#"
            class="TUTORDASHBOARD_HOME_action"
          >{{ task.action }}</a>

          <span
            v-else
            class="TUTORDASHBOARD_HOME_status"
          >Completed</span>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "AccountActivationStatus",
  data() {
    return {
      tasks: [
        { label: "Verify Identity", completed: true },
        { label: "Complete Training Modules", completed: true },
        { label: "Submit Background Check", completed: false, action: "Start Check" },
        { label: "Link Bank Account", completed: false, action: "Add Details" },
        { label: "Review Tutor Handbook", completed: true },
        { label: "Set Availability Preferences", completed: true },
      ],
    };
  },
  computed: {
    progress() {
      const total = this.tasks.length;
      const done = this.tasks.filter(t => t.completed).length;
      return Math.round((done / total) * 100);
    },
  },
};
</script>

<style scoped>
/* Base */
.TUTORDASHBOARD_HOME_container{
  width: 40vw;
  margin: 0 auto;
  background: #fff;
  padding: 20px 24px;
  border-radius: 10px;
  box-shadow: 0 3px 12px rgba(0,0,0,0.08);
  font-family: Arial, Helvetica, sans-serif;
}

.TUTORDASHBOARD_HOME_title{
  font-size: 18px;
  font-weight: 600;
  margin: 0 0 14px;
  color: #1f1f1f;
}

/* Progress */
.TUTORDASHBOARD_HOME_progressRow{
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 12px;
}

.TUTORDASHBOARD_HOME_progressBar{
  position: relative;
  flex: 1;
  height: 10px;
  border-radius: 6px;
  overflow: hidden;
  background: #e9f2ff;         /* light remaining bar */
}

.TUTORDASHBOARD_HOME_progressFill{
  height: 100%;
  background: #1b74e4;         /* primary blue */
  transition: width .25s ease;
}

.TUTORDASHBOARD_HOME_progressText{
  min-width: 120px;
  text-align: right;
  font-size: 13.5px;
  color: #4a4a4a;
}

/* List */
.TUTORDASHBOARD_HOME_list{
  list-style: none;
  margin: 6px 0 0;
  padding: 0;
  border-top: 1px solid #f0f0f0;
}

.TUTORDASHBOARD_HOME_item{
  display: grid;
  grid-template-columns: 22px 1fr 160px; /* checkbox | label | right column */
  align-items: center;
  column-gap: 12px;
  padding: 12px 0;
  border-bottom: 1px solid #f0f0f0;
}

.TUTORDASHBOARD_HOME_checkbox{
  width: 16px;
  height: 16px;
  accent-color: #1b74e4; /* blue check like screenshot */
  cursor: pointer;
  margin: 0;
}

.TUTORDASHBOARD_HOME_label{
  color: #333;
  font-size: 14px;
  line-height: 1.3;
}

.TUTORDASHBOARD_HOME_rightCol{
  text-align: right;
  white-space: nowrap;
}

.TUTORDASHBOARD_HOME_action{
  font-size: 13px;
  color: #1b74e4;
  text-decoration: none;
}

.TUTORDASHBOARD_HOME_action:hover{ text-decoration: underline; }

.TUTORDASHBOARD_HOME_status{
  font-size: 13px;
  color: #2e9a41; /* success green */
  font-weight: 600;
}

/* Responsive */
@media (max-width: 580px){
  .TUTORDASHBOARD_HOME_container{ padding: 16px; }
  .TUTORDASHBOARD_HOME_progressText{ min-width: auto; font-size: 13px; }
  .TUTORDASHBOARD_HOME_item{
    grid-template-columns: 22px 1fr auto;
  }
}

@media (max-width: 440px){
  .TUTORDASHBOARD_HOME_item{
    grid-template-columns: 22px 1fr;
    row-gap: 6px;
  }
  .TUTORDASHBOARD_HOME_rightCol{
    grid-column: 2 / -1;
    text-align: left; /* stack neatly on small screens */
  }
}
</style>
