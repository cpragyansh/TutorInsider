<template>
  <div class="dashboard-header">
    <h2>Welcome, {{ username }} ({{ type }})</h2>
  </div>
</template>

<script>
export default {
  props: ['username', 'type']
};
</script>

<style scoped>
.dashboard-header {
  background: #f5f5f5;
  padding: 12px 20px;
  font-size: 18px;
  font-weight: bold;
  border-bottom: 1px solid #ddd;
}
</style>
