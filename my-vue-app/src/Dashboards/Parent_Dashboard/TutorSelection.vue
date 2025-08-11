<template>
  <div class="tutor-section">
    <h3 class="title">Tutor Selection & Feedback</h3>

    <!-- Tabs -->
    <div class="tabs">
      <button
        :class="{ active: activeTab === 'selection' }"
        @click="activeTab = 'selection'"
      >
        Tutors Ready for Selection
      </button>
      <button
        :class="{ active: activeTab === 'feedback' }"
        @click="activeTab = 'feedback'"
      >
        Feedback for Finalized Tutors
      </button>
      <button
        :class="{ active: activeTab === 'rejected' }"
        @click="activeTab = 'rejected'"
      >
        Rejected Tutors
      </button>
    </div>

    <!-- Tutor Selection Tab -->
    <div v-if="activeTab === 'selection'" class="tab-content">
      <p>Select your ideal tutor for the next 6 months based on demo sessions.</p>
      <div class="tutor-list">
        <div
          v-for="tutor in tutors"
          :key="tutor.id"
          class="tutor-card"
        >
          <img :src="tutor.image" alt="tutor" class="avatar" />
          <h4>{{ tutor.name }}</h4>
          <p class="subject">{{ tutor.subject }}</p>
          <div class="rating">
            ⭐⭐⭐⭐⭐ <span>{{ tutor.rating }}</span>
          </div>
          <p class="experience">{{ tutor.experience }}</p>
          <button
            :disabled="selectedTutors.some(t => t.id === tutor.id)"
            @click="selectTutor(tutor)"
            class="btn"
          >
            {{ selectedTutors.some(t => t.id === tutor.id) ? 'Tutor Selected' : 'Select Tutor' }}
          </button>
          <button
            class="btn deselect"
            @click="rejectTutor(tutor)"
          >
            Reject
          </button>
        </div>
      </div>
    </div>

    <!-- Feedback Tab -->
    <div v-if="activeTab === 'feedback'" class="tab-content">
      <div v-if="selectedTutors.length" class="tutor-list">
        <div
          v-for="tutor in selectedTutors"
          :key="tutor.id"
          class="tutor-card selected"
        >
          <img :src="tutor.image" alt="tutor" class="avatar" />
          <h4>{{ tutor.name }}</h4>
          <p class="subject">{{ tutor.subject }}</p>
          <div class="rating">
            ⭐⭐⭐⭐⭐ <span>{{ tutor.rating }}</span>
          </div>
          <p class="experience">{{ tutor.experience }}</p>
          <button class="btn" @click="openFeedbackModal(tutor)">Add Feedback</button>
          <button class="btn deselect" @click="deselectTutor(tutor.id)">Deselect</button>
        </div>
      </div>
      <p v-else>No tutor selected yet.</p>
    </div>

    <!-- Rejected Tutors Tab -->
    <div v-if="activeTab === 'rejected'" class="tab-content">
      <div v-if="rejectedTutors.length" class="tutor-list">
        <div
          v-for="tutor in rejectedTutors"
          :key="tutor.id"
          class="tutor-card rejected"
        >
          <img :src="tutor.image" alt="tutor" class="avatar" />
          <h4>{{ tutor.name }}</h4>
          <p class="subject">{{ tutor.subject }}</p>
          <p class="reject-reason">Reason: {{ tutor.reason }}</p>
          <p class="rejected-date">Rejected on: {{ tutor.date }}</p>
          <button class="btn" @click="manageRejection(tutor)">Manage Rejection</button>
        </div>
      </div>
      <p v-else>No tutors rejected yet.</p>
    </div>

    <!-- Feedback Modal -->
    <div v-if="showModal" class="modal-overlay">
      <div class="modal">
        <h4>Feedback for {{ currentTutor?.name }}</h4>
        <textarea v-model="feedbackText" placeholder="Write your feedback here..."></textarea>
        <div class="modal-actions">
          <button class="btn" @click="submitFeedback">Submit</button>
          <button class="btn deselect" @click="closeFeedbackModal">Close</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TutorSelectionFeedback",
  data() {
    return {
      activeTab: "selection",
      tutors: [
        { id: 1, name: "Bob Williams", subject: "Mathematics", rating: 4.8, experience: "5+ years experience", image: "https://via.placeholder.com/80" },
        { id: 2, name: "David Lee", subject: "Physics", rating: 4.5, experience: "7+ years experience", image: "https://via.placeholder.com/80" },
        { id: 3, name: "Emma Chen", subject: "Chemistry", rating: 4.9, experience: "3+ years experience", image: "https://via.placeholder.com/80" }
      ],
      selectedTutors: [],
      rejectedTutors: [],
      showModal: false,
      currentTutor: null,
      feedbackText: ""
    };
  },
  methods: {
    selectTutor(tutor) {
      if (!this.selectedTutors.some(t => t.id === tutor.id)) {
        this.selectedTutors.push(tutor);
      }
      this.activeTab = "feedback";
    },
    deselectTutor(id) {
      this.selectedTutors = this.selectedTutors.filter(t => t.id !== id);
    },
    rejectTutor(tutor) {
      const reason = prompt("Enter rejection reason:");
      if (reason) {
        this.rejectedTutors.push({
          ...tutor,
          reason,
          date: new Date().toISOString().split("T")[0]
        });
        this.tutors = this.tutors.filter(t => t.id !== tutor.id);
      }
    },
    manageRejection(tutor) {
      alert(`Manage rejection for ${tutor.name}`);
    },
    openFeedbackModal(tutor) {
      this.currentTutor = tutor;
      this.showModal = true;
    },
    closeFeedbackModal() {
      this.showModal = false;
    },
    submitFeedback() {
      alert(`Feedback for ${this.currentTutor?.name}: ${this.feedbackText}`);
      this.feedbackText = "";
      this.showModal = false;
    }
  }
};
</script>

<style scoped>
.tutor-section {
  font-family: Arial, sans-serif;
}

.title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
}

.tabs {
  display: flex;
  background: #f5f5f5;
  border-radius: 4px;
  overflow: hidden;
}

.tabs button {
  flex: 1;
  padding: 10px;
  border: none;
  background: transparent;
  cursor: pointer;
  font-size: 0.9vw;
}

.tabs button.active {
  background: #fff;
  font-weight: bold;
  border-bottom: 2px solid #007bff;
}

.tab-content {
  margin-top: 15px;
  text-align: center;
}

.tutor-list {
  display: flex;
  gap: 2vw;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}

.tutor-card {
  flex: 1 1 calc(33% - 15px);
  border: 1px solid #ddd;
  padding: 15px;
  border-radius: 6px;
  text-align: center;
  background: #fff;
  max-width: 350px;
}

.tutor-card.selected {
  border: 2px solid #007bff;
}

.tutor-card.rejected {
  border: 2px solid #dc3545;
}

.reject-reason {
  color: red;
  font-size: 14px;
}

.rejected-date {
  font-size: 12px;
  color: #777;
}

.avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
}

.subject {
  color: #666;
  font-size: 14px;
}

.rating {
  font-size: 14px;
  margin: 5px 0;
}

.experience {
  font-size: 13px;
  color: #777;
}

.btn {
  display: block;
  width: 100%;
  padding: 8px;
  background: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  margin-top: 10px;
  cursor: pointer;
}

.btn.deselect {
  background: #dc3545;
}

/* Modal styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal {
  background: #fff;
  padding: 20px;
  border-radius: 6px;
  width: 400px;
}

.modal textarea {
  width: 100%;
  height: 100px;
  margin-top: 10px;
}

.modal-actions {
  display: flex;
  gap: 10px;
  margin-top: 10px;
}
</style>
