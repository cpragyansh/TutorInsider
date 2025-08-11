<template>
  <div class="dashboard-layout">
    <Sidebar />
    <main class="dashboard-content">
      <router-view />
    </main>
  </div>
</template>

<script setup>
import Sidebar from "../components/Sidebar/Sidebar.vue";
</script>

<style scoped>
.dashboard-layout {
  display: flex;
}
.dashboard-content {
  flex: 1;
  padding: 2rem;
}
</style>
