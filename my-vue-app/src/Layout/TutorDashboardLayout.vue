<template>
  <div class="dashboard-layout-tutor">
    <TutorSidebar />
    <main class="dashboard-content-tutor">
      <router-view />
    </main>
  </div>
</template>

<script setup>
// import Sidebar from "../components/Sidebar/Sidebar.vue";
import TutorSidebar from "../components/TutorSidebar/tutorSidebar.vue";
</script>

<style scoped>
.dashboard-layout-tutor {
  display: flex;
}
.dashboard-content-tutor {
  flex: 1;
  padding: 2rem;
}
</style>
