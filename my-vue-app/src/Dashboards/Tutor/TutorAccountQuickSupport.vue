<template>
  <div class="quick-support">
    <h3>Quick Support</h3>
    <p>Need assistance? Our chatbot is here to help 24/7 with your queries.</p>
    <button class="chatbot-btn">Launch Chatbot</button>
    <div class="links">
      <a href="#">Access Help Center</a>
      <a href="#">Submit a Request</a>
    </div>
  </div>
</template>

<script>
export default {
  name: "QuickSupport",
};
</script>

<style scoped>
.quick-support {
  background: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.08);
  flex: 1;
  min-width: 280px;
}

.quick-support h3 {
  margin-bottom: 10px;
  font-size: 18px;
  font-weight: 600;
}

.quick-support p {
  font-size: 14px;
  color: #555;
  margin-bottom: 15px;
}

.chatbot-btn {
  background: #007bff;
  color: #fff;
  border: none;
  padding: 10px 16px;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  width: 100%;
  margin-bottom: 15px;
}

.chatbot-btn:hover {
  background: #0056b3;
}

.links {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.links a {
  font-size: 14px;
  color: #007bff;
  text-decoration: none;
}

.links a:hover {
  text-decoration: underline;
}
</style>
