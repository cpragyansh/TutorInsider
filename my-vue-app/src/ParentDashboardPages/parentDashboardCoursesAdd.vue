<template>
  <div class="my-courses">
    <!-- Filter & Add -->
    <div class="filter-section">
      <div>
        <label for="subjectFilter">Filter by Subject:</label>
        <select id="subjectFilter" v-model="selectedSubject">
          <option value="">All Subjects</option>
          <option v-for="(sub, index) in subjects" :key="index" :value="sub">{{ sub }}</option>
        </select>
      </div>
      <button class="add-btn" @click="showAddForm = true">+ Add Subject</button>
    </div>

    <!-- Courses Cards -->
    <div class="courses-grid">
      <div 
        class="course-card" 
        v-for="(course, index) in filteredCourses" 
        :key="index"
      >
        <h3 class="course-title">{{ course.subject }}</h3>
        <p><strong>Tutor:</strong> {{ course.tutor }}</p>
        <p><strong>Start Date:</strong> {{ course.startDate }}</p>
        <p><strong>End Date:</strong> {{ course.endDate }}</p>
        <p>
          <strong>Payment Status:</strong>
          <span :class="['payment-status', course.paymentStatus.toLowerCase()]">
            {{ course.paymentStatus }}
          </span>
        </p>
      </div>
    </div>

    <!-- Add Subject Popup -->
    <div v-if="showAddForm" class="modal-overlay">
      <div class="modal">
        <h2>Add New Subject</h2>
        <form @submit.prevent="addCourse" class="form-grid">
          <div>
            <label>Subject Name:</label>
            <input v-model="form.subject" required />
          </div>
          <div>
            <label>Class of Student:</label>
            <input v-model="form.class" required />
          </div>
          <div>
            <label>Board of Student:</label>
            <input v-model="form.board" required />
          </div>
          <div>
            <label>Preferred Tutor Gender:</label>
            <select v-model="form.tutorGender" required>
              <option value="Any">Any</option>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
            </select>
          </div>
          <div>
            <label>Classes per Week:</label>
            <input type="number" v-model="form.classesPerWeek" required />
          </div>
          <div>
            <label>Start Date:</label>
            <input type="date" v-model="form.startDate" required />
          </div>
          <div>
            <label>End Date:</label>
            <input type="date" v-model="form.endDate" required />
          </div>
          <div>
            <label>Street Address:</label>
            <input v-model="form.address" required />
          </div>
          <div>
            <label>City:</label>
            <input v-model="form.city" required />
          </div>
          <div>
            <label>State:</label>
            <input v-model="form.state" required />
          </div>
          <div>
            <label>Pincode:</label>
            <input v-model="form.pincode" required />
          </div>
        </form>
        <div class="modal-actions">
          <button class="btn-primary" @click="addCourse">Add</button>
          <button class="btn-secondary" @click="showAddForm = false">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MyCourses",
  data() {
    return {
      selectedSubject: "",
      showAddForm: false,
      courses: [
        { subject: "Mathematics", tutor: "Mr. David Lee", startDate: "2024-10-01", endDate: "2025-03-01", paymentStatus: "Paid" },
        { subject: "Physics", tutor: "Ms. Emily Chen", startDate: "2024-10-05", endDate: "2025-03-05", paymentStatus: "Pending" }
      ],
      form: {
        subject: "",
        class: "",
        board: "",
        tutorGender: "Any",
        classesPerWeek: "",
        startDate: "",
        endDate: "",
        address: "",
        city: "",
        state: "",
        pincode: ""
      }
    };
  },
  computed: {
    subjects() {
      return [...new Set(this.courses.map(c => c.subject))];
    },
    filteredCourses() {
      if (!this.selectedSubject) return this.courses;
      return this.courses.filter(course => course.subject === this.selectedSubject);
    }
  },
  methods: {
    addCourse() {
      this.courses.push({
        subject: this.form.subject,
        tutor: "TBD",
        startDate: this.form.startDate,
        endDate: this.form.endDate,
        paymentStatus: "Pending"
      });
      this.showAddForm = false;
      this.resetForm();
    },
    resetForm() {
      this.form = {
        subject: "",
        class: "",
        board: "",
        tutorGender: "Any",
        classesPerWeek: "",
        startDate: "",
        endDate: "",
        address: "",
        city: "",
        state: "",
        pincode: ""
      };
    }
  }
};
</script>

<style scoped>
.my-courses {
  padding: 20px;
  font-family: Arial, sans-serif;
}

.filter-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.add-btn {
  padding: 8px 15px;
  background: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  border-radius: 6px;
}

.courses-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 20px;
}

.course-card {
  background: white;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0px 3px 8px rgba(0,0,0,0.08);
  transition: transform 0.2s ease;
}

.course-card:hover {
  transform: translateY(-5px);
}

.course-title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 8px;
}

.payment-status {
  padding: 4px 10px;
  border-radius: 5px;
  font-size: 12px;
}

.payment-status.paid {
  background: #e8f5e9;
  color: #4caf50;
}

.payment-status.pending {
  background: #fff4e5;
  color: #ff9800;
}

/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal {
  background: white;
  padding: 20px;
  width: 650px;
  border-radius: 8px;
  max-height: 90vh;
  overflow-y: auto;
}

.form-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px 20px;
}

.modal label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}

.modal input,
.modal select {
  width: 100%;
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.modal-actions {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

.btn-primary {
  background: #007bff;
  color: white;
  border: none;
  padding: 8px 15px;
  border-radius: 5px;
  cursor: pointer;
}

.btn-secondary {
  background: #ccc;
  color: black;
  border: none;
  padding: 8px 15px;
  border-radius: 5px;
  margin-left: 10px;
  cursor: pointer;
}
</style>
