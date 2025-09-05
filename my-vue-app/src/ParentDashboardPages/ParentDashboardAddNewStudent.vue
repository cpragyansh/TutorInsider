<template>
  <div class="container">
    <h1 class="page-title">New Student Admission</h1>

    <!-- Admission Form -->
    <form class="form-card" @submit.prevent="openPreview">
      <!-- Course Information -->
      <section class="section">
        <h2 class="section-title">Course Information</h2>
        <h2 class="section-title">Area of study</h2>
        <div class="grid-2">
          <div class="field">
            <label>Academic Coaching</label>
            <select v-model="form.areaOfStudy">
              <option value="">Academic Coaching</option>
              <option>Special Kid(AAHD/ADD/AUTISM)</option>
              <option>Language Skilld</option>
              <option>Competitive Preparation</option>
              <option>IT Software & Hardware</option>
              <option>Life Skills</option>
              <option>Councelling</option>
            </select>
          </div>
          <div class="field">
            <label>Select Class</label>
            <select v-model="form.childClass">
              <option value="">Select Class</option>
              <option>Primary / Pre-Primary / LKG / UKG</option>
              <option>1st - 5th Classes</option>
              <option>6th - 8th Classes</option>
              <option>9th Class</option>
              <option>10th Class</option>
              <option>11th Class</option>
              <option>12th Class</option>
            </select>
          </div>
          <div class="field">
            <label>Choose School Board</label>
            <select v-model="form.schoolBoard">
              <option value="">School Board</option>
              <option>CBSE</option>
              <option>ICSE/ISC</option>
              <option>State Board</option>
              <option>International Baccalaureate(IB)</option>
              <option>IGCSE</option>
              <option>NIOS</option>
            </select>
          </div>
          <div class="field">
            <label>Selected Subjects</label>
            <input v-model="form.selectedSubjects" type="text" placeholder="E.g. English, Geography" />
          </div>
          <div class="field">
            <label>Preferred Tutor Gender</label>
            <select v-model="form.tutorGender">
              <option value="">Select</option>
              <option>Male Tutor</option>
              <option>Female Tutor</option>
              <option>Any</option>
            </select>
          </div>
          <div class="field">
            <label>Mode of Tuition</label>
            <select v-model="form.tuitionMode">
              <option value="">Select</option>
              <option>Online Tuition</option>
              <option>Offline Tuition</option>
            </select>
          </div>
          <div class="field">
            <label>No. of Classes Per Week</label>
            <select v-model="form.classesPerWeek">
              <option value="">Select</option>
              <option>1 Day a Week</option>
              <option>2 Day a Week</option>
              <option>3 Day a Week</option>
              <option>5 Day a Week</option>
            </select>
          </div>
          <div class="field">
            <label>Start Date</label>
            <input v-model="form.startDate" type="date" />
          </div>
          <div class="field">
            <label>End Date</label>
            <input v-model="form.endDate" type="date" />
          </div>
        </div>
      </section>

      <hr class="divider" />

      <!-- Address Information -->
      <section class="section">
        <h2 class="section-title">Address Information</h2>
        <div class="grid-3">
          <div class="field">
            <label>State</label>
            <input v-model="form.state" type="text" />
          </div>
          <div class="field">
            <label>City</label>
            <input v-model="form.city" type="text" />
          </div>
          <div class="field">
            <label>Pincode</label>
            <input v-model="form.pincode" type="text" maxlength="6" />
          </div>
          <div class="field full">
            <label>Location (Specific)</label>
            <input v-model="form.location" type="text" placeholder="Landmark / Colony / Sector" />
          </div>
        </div>
      </section>

      <hr class="divider" />

      <!-- Parent Information -->
      <section class="section">
        <h2 class="section-title">Parent Information</h2>
        <div class="grid-2">
          <div class="field">
            <label>First Name</label>
            <input v-model="form.parentFirstName" type="text" />
          </div>
          <div class="field">
            <label>Last Name</label>
            <input v-model="form.parentLastName" type="text" />
          </div>
          <div class="field">
            <label>Mobile No.</label>
            <input v-model="form.parentMobile" type="tel" maxlength="10" />
          </div>
          <div class="field">
            <label>Email Address</label>
            <input v-model="form.parentEmail" type="email" />
          </div>
          <div class="field full">
            <label>Gender</label>
            <div class="radio-row">
              <label><input type="radio" value="Male" v-model="form.parentGender" /> Male</label>
              <label><input type="radio" value="Female" v-model="form.parentGender" /> Female</label>
              <label><input type="radio" value="Other" v-model="form.parentGender" /> Other</label>
            </div>
          </div>
        </div>
      </section>

      <hr class="divider" />

      <!-- Student Information -->
      <section class="section">
        <h2 class="section-title">Student Information</h2>
        <div class="grid-2">
          <div class="field">
            <label>Child Name</label>
            <input v-model="form.childName" type="text" />
          </div>
          <div class="field">
            <label>Age</label>
            <input v-model.number="form.childAge" type="number" min="1" />
          </div>
          <div class="field">
            <label>Class</label>
            <input v-model="form.childClass" type="text" />
          </div>
          <div class="field full">
            <label>Child Gender</label>
            <div class="radio-row">
              <label><input type="radio" value="Male" v-model="form.childGender" /> Male</label>
              <label><input type="radio" value="Female" v-model="form.childGender" /> Female</label>
              <label><input type="radio" value="Other" v-model="form.childGender" /> Other</label>
            </div>
          </div>
          <div class="field full">
            <label>Other Information</label>
            <textarea v-model="form.otherInfo" rows="3"></textarea>
          </div>
        </div>
      </section>

      <!-- Actions -->
      <div class="actions">
        <button type="button" class="btn btn-light" @click="saveDraft">Save Draft</button>
        <div>
          <button type="button" class="btn btn-outline" @click="loadDraft">Load Draft</button>
          <button type="submit" class="btn btn-primary">Submit Admission</button>
        </div>
      </div>
    </form>
    
    <!-- Status Message -->
    <div v-if="statusMessage" class="status-message" :class="statusType">
      {{ statusMessage }}
    </div>

    <!-- Preview Modal -->
    <div v-if="showPreview" class="modal-overlay">
      <div class="modal-content">
        <h2 class="modal-title">Preview Admission Details</h2>

        <div class="preview-grid">
          <div><strong>Parent:</strong> {{ form.parentFirstName }} {{ form.parentLastName }}</div>
          <div><strong>Mobile:</strong> {{ form.parentMobile }}</div>
          <div><strong>Email:</strong> {{ form.parentEmail }}</div>
          <div><strong>Gender:</strong> {{ form.parentGender }}</div>

          <hr />

          <div><strong>Child Name:</strong> {{ form.childName }}</div>
          <div><strong>Age:</strong> {{ form.childAge }}</div>
          <div><strong>Class:</strong> {{ form.childClass }}</div>
          <div><strong>Gender:</strong> {{ form.childGender }}</div>

          <hr />

          <div><strong>Area of Study:</strong> {{ form.areaOfStudy }}</div>
          <div><strong>Subjects:</strong> {{ form.selectedSubjects }}</div>
          <div><strong>School Board:</strong> {{ form.schoolBoard }}</div>
          <div><strong>Tutor Gender:</strong> {{ form.tutorGender }}</div>
          <div><strong>Mode:</strong> {{ form.tuitionMode }}</div>
          <div><strong>Classes/Week:</strong> {{ form.classesPerWeek }}</div>
          <div><strong>Duration:</strong> {{ form.startDate }} → {{ form.endDate }}</div>

          <hr />

          <div><strong>Address:</strong> {{ form.location }}, {{ form.city }}, {{ form.state }} - {{ form.pincode }}
          </div>

          <div v-if="form.otherInfo"><strong>Other Info:</strong> {{ form.otherInfo }}</div>
        </div>

        <label class="checkbox-label">
          <input type="checkbox" v-model="isConfirmed" />
          I confirm that the information provided is correct
        </label>

        <div class="actions">
          <button class="btn btn-light" @click="closePreview">Edit Information</button>
          <button class="btn btn-primary" :disabled="!isConfirmed" @click="finalSubmit">
            Confirm & Submit
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// Import Axios for making HTTP requests
import axios from 'axios';

export default {
  name: "NewStudentForm",
  data() {
    return {
      parentId: null, // 👈 will be fetched from backend using token
      storageKey: "new-student-admission-draft",
      showPreview: false,
      isConfirmed: false,
      statusMessage: "",
      statusType: "", // 'success' or 'error'
      form: {
        areaOfStudy: "",
        schoolBoard: "",
        selectedSubjects: "",
        tutorGender: "",
        tuitionMode: "",
        classesPerWeek: "",
        startDate: "",
        endDate: "",
        state: "",
        city: "",
        pincode: "",
        location: "",
        parentFirstName: "",
        parentLastName: "",
        parentMobile: "",
        parentEmail: "",
        parentGender: "",
        childName: "",
        childAge: null,
        childClass: "",
        childGender: "",
        otherInfo: "",
        courseFee: null,
        paymentStatus: "",
        preferredTutor: "",
        remarks: ""
      }
    };
  },
  methods: {
    showStatus(message, type = 'success') {
      this.statusMessage = message;
      this.statusType = type;
      setTimeout(() => {
        this.statusMessage = "";
        this.statusType = "";
      }, 3000); // Hide after 3 seconds
    },
    saveDraft() {
      localStorage.setItem(this.storageKey, JSON.stringify(this.form));
      this.showStatus("Draft saved locally.");
    },
    loadDraft() {
      const raw = localStorage.getItem(this.storageKey);
      if (!raw) {
        this.showStatus("No draft found.", 'error');
        return;
      }
      this.form = JSON.parse(raw);
      this.showStatus("Draft loaded.");
    },
    openPreview() {
      if (!this.form.parentFirstName || !this.form.parentMobile || !this.form.childName) {
        this.showStatus("Please fill at least Parent First Name, Mobile and Child Name.", 'error');
        return;
      }
      this.showPreview = true;
    },
    closePreview() {
      this.showPreview = false;
      this.isConfirmed = false;
    },
    async finalSubmit() {
      try {
        // Build payload
      const payload = {
  parent_user_id: this.parentId,  // 👈 must match backend
  childName: this.form.childName,
  childAge: this.form.childAge,
  childClass: this.form.childClass,
  childGender: this.form.childGender,
  areaOfStudy: this.form.areaOfStudy,
  schoolBoard: this.form.schoolBoard,
  selectedSubjects: this.form.selectedSubjects,
  tutorGender: this.form.tutorGender,
  tuitionMode: this.form.tuitionMode,
  classesPerWeek: this.form.classesPerWeek,
  startDate: this.form.startDate,
  endDate: this.form.endDate,
  state: this.form.state,
  city: this.form.city,
  pincode: this.form.pincode,
  location: this.form.location,
  otherInfo: this.form.otherInfo,
  courseFee: this.form.courseFee,
  paymentStatus: this.form.paymentStatus,
  preferredTutor: this.form.preferredTutor,
  remarks: this.form.remarks
};


        // Send request with payload
        const response = await axios.post(
          "http://localhost:5000/admission/parents/newadmission",
          payload,
          { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
        );

        console.log("Submission successful:", response.data);
        this.showStatus("Admission submitted successfully!");

        localStorage.removeItem(this.storageKey);
        this.resetForm();
        this.closePreview();
      } catch (error) {
        console.error("Submission failed:", error);
        this.showStatus("Failed to submit admission. Please try again.", "error");
      }
    },
    resetForm() {
      Object.keys(this.form).forEach(key => (this.form[key] = ""));
    }
  },
  mounted() {
    // Load draft if available
    const raw = localStorage.getItem(this.storageKey);
    if (raw) this.form = JSON.parse(raw);

    // 🔹 Fetch logged-in parentId from backend using token
    const token = localStorage.getItem("token");
    if (token) {
      axios
        .get("http://localhost:5000/parents/me", {
          headers: { Authorization: `Bearer ${token}` }
        })
        .then(res => {
          if (res.data.success) {
            this.parentId = res.data.user.id; // ✅ set parentId
            localStorage.setItem("parentId", this.parentId); // optional cache
          }
        })
        .catch(err => {
          console.error("Failed to fetch parent info:", err);
        });
    }
  }
};
</script>


<style scoped>
/* Modal */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 100;
}

.modal-content {
  background: #fff;
  padding: 24px;
  border-radius: 12px;
  max-width: 700px;
  width: 100%;
  max-height: 85vh;
  overflow-y: auto;
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.modal-title {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 16px;
}

.preview-grid {
  display: flex;
  flex-direction: column;
  gap: 10px;
  font-size: 14px;
  margin-bottom: 16px;
}

.preview-grid hr {
  border: none;
  border-top: 1px solid #e5e7eb;
  margin: 12px 0;
}

.checkbox-label {
  display: flex;
  align-items: center;
  margin: 12px 0;
  gap: 8px;
  font-size: 14px;
}

/* Container */
.container {
  max-width: 1000px;
  margin: 32px auto;
  padding: 20px;
  font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial;
  color: #1f2937;
}

/* Page title */
.page-title {
  margin-bottom: 18px;
  font-size: 24px;
  font-weight: 700;
}

/* Form card */
.form-card {
  background: #ffffff;
  border: 1px solid #e6e9ef;
  border-radius: 10px;
  padding: 22px;
  box-shadow: 0 6px 20px rgba(20, 20, 50, 0.04);
}

/* Sections */
.section+.section {
  margin-top: 18px;
}

.section-title {
  margin-bottom: 12px;
  font-size: 16px;
  font-weight: 600;
  color: #111827;
}

/* Layout grids */
.grid-2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 14px;
}

.grid-3 {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 14px;
}

/* Field */
.field {
  display: flex;
  flex-direction: column;
}

.field.full {
  grid-column: 1 / -1;
}

label {
  font-size: 13px;
  margin-bottom: 8px;
  color: #374151;
  font-weight: 600;
}

/* Inputs */
input[type="text"],
input[type="email"],
input[type="tel"],
input[type="number"],
input[type="date"],
select,
textarea {
  background: #f3f4f6;
  border: 1px solid #e6e9ef;
  padding: 10px 12px;
  border-radius: 8px;
  font-size: 14px;
  color: #111827;
  outline: none;
  transition: box-shadow .12s, border-color .12s;
}

input:focus,
select:focus,
textarea:focus {
  box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.08);
  border-color: #3b82f6;
}

/* Radio layout */
.radio-row {
  display: flex;
  gap: 18px;
  align-items: center;
  padding-top: 6px;
}

.radio-row label {
  font-weight: 500;
  color: #374151;
  display: flex;
  align-items: center;
  gap: 6px;
}

/* Divider */
.divider {
  border: 0;
  border-top: 1px solid #eef2f7;
  margin: 18px 0;
}

/* Actions */
.actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 18px;
  gap: 12px;
}

/* Buttons */
.btn {
  display: inline-block;
  border-radius: 8px;
  padding: 10px 14px;
  font-weight: 600;
  cursor: pointer;
  border: 1px solid transparent;
}

.btn-primary {
  background: #0b74f0;
  color: white;
  border-color: #0b74f0;
}

.btn-light {
  background: #f3f4f6;
  color: #111827;
  border-color: #e6e9ef;
}

.btn-outline {
  background: white;
  color: #0b74f0;
  border-color: #0b74f0;
}

/* Utility button styles applied via classes */
button.btn-light {
  border: 1px solid #e6e9ef;
}

button.btn-outline {
  border: 1px solid #0b74f0;
  color: #0b74f0;
}

button.btn-primary {
  border: 1px solid #0b74f0;
}

/* Status Message */
.status-message {
  position: fixed;
  top: 20px;
  right: 20px;
  padding: 12px 20px;
  border-radius: 8px;
  font-weight: 600;
  z-index: 101;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  transition: opacity 0.3s ease-in-out;
}

.status-message.success {
  background-color: #d1fae5;
  color: #065f46;
}

.status-message.error {
  background-color: #fee2e2;
  color: #991b1b;
}

/* small screens */
@media (max-width: 850px) {
  .grid-2 {
    grid-template-columns: 1fr;
  }

  .grid-3 {
    grid-template-columns: 1fr;
  }

  .actions {
    flex-direction: column-reverse;
    align-items: stretch;
  }

  .actions>div,
  .actions>button {
    width: 100%;
  }
}
</style>
