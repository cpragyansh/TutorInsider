<template>
  <div class="chat-container">
    <div class="header">
      Live Chat with CRM Team
    </div>
    <div class="messages">
      <div
        v-for="(msg, index) in messages"
        :key="index"
        :class="['message', msg.sender]"
      >
        <div class="bubble">{{ msg.text }}</div>
      </div>
    </div>
    <div class="input-area">
      <input
        type="text"
        v-model="newMessage"
        placeholder="Type your message..."
        @keyup.enter="sendMessage"
      />
      <button @click="sendMessage">Send</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "ParentChat",
  data() {
    return {
      messages: [
        { sender: "crm", text: "Hello! How can I assist you with your tutoring needs today?" },
        { sender: "parent", text: "I have a question about selecting a long-term tutor after the demos." },
        { sender: "crm", text: "Certainly! After completing your demo sessions, you'll receive a summary of all available tutors. You can then select your preferred tutor for a 6-month course." },
        { sender: "parent", text: "Great, thank you! Where can I see the feedback forms for the completed demo sessions?" }
      ],
      newMessage: ""
    };
  },
  methods: {
    sendMessage() {
      if (this.newMessage.trim() !== "") {
        this.messages.push({ sender: "parent", text: this.newMessage });
        this.newMessage = "";

        // Simulated CRM reply
        setTimeout(() => {
          this.messages.push({
            sender: "crm",
            text: "Thank you for your message! We will get back to you shortly."
          });
        }, 1000);
      }
    }
  }
};
</script>

<style scoped>
.chat-container {
  width: 100%;
  max-width: 100%;
  background: white;
  border: 1px solid #ccc;
  display: flex;
  flex-direction: column;
  border-radius: 8px;
  overflow: hidden;
  margin: auto;
}

.header {
  background: #f1f1f1;
  padding: 10px 15px;
  font-weight: bold;
  border-bottom: 1px solid #ddd;
}

.messages {
  flex: 1;
  padding: 15px;
  overflow-y: auto;
  min-height: 300px;
}

.message {
  margin-bottom: 15px;
  display: flex;
}

.message.crm {
  justify-content: flex-start;
}

.message.parent {
  justify-content: flex-end;
}

.bubble {
  max-width: 70%;
  padding: 10px 15px;
  border-radius: 15px;
  font-size: 14px;
  line-height: 1.4;
}

.crm .bubble {
  background: #f1f0f0;
  border-bottom-left-radius: 0;
}

.parent .bubble {
  background: #007bff;
  color: white;
  border-bottom-right-radius: 0;
}

.input-area {
  display: flex;
  border-top: 1px solid #ddd;
}

.input-area input {
  flex: 1;
  padding: 10px;
  border: none;
  font-size: 14px;
}

.input-area button {
  padding: 10px 15px;
  background: #007bff;
  border: none;
  color: white;
  font-size: 14px;
  cursor: pointer;
}
</style>
