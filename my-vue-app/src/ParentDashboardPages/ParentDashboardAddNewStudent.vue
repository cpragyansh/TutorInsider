<template>
  <div class="container">
    <h1 class="page-title">New Student Admission</h1>

    <form class="form-card" @submit.prevent="handleSubmit">
      <!-- Course Information -->
      <section class="section">
        <h2 class="section-title">Course Information</h2>
        <div class="grid-2">
          <div class="field">
            <label>Area of Study</label>
            <input v-model="form.areaOfStudy" type="text" placeholder="E.g. Academic Coaching" />
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
            <input v-model="form.parentMobile" type="tel" placeholder="10 digit mobile" maxlength="10" />
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
            <input v-model="form.childClass" type="text" placeholder="E.g. 9th, 10th" />
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

      <!-- Course Payment & Extra Info -->
      <hr class="divider" />
      <section class="section">
        <h2 class="section-title">Course & Payment Info</h2>
        <div class="grid-2">
          <div class="field">
            <label>Course Fee (INR)</label>
            <input v-model.number="form.courseFee" type="number" min="0" />
          </div>
          <div class="field">
            <label>Payment Status</label>
            <select v-model="form.paymentStatus">
              <option value="">Select</option>
              <option>Paid</option>
              <option>Pending</option>
              <option>Cancelled</option>
            </select>
          </div>

          <div class="field">
            <label>Preferred Tutor (optional)</label>
            <input v-model="form.preferredTutor" type="text" />
          </div>

          <div class="field">
            <label>Notes / Remarks</label>
            <input v-model="form.remarks" type="text" />
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
  </div>
</template>

<script>
export default {
  name: "NewStudentForm",
  data() {
    return {
      storageKey: "new-student-admission-draft",
      form: {
        // Course Info
        areaOfStudy: "",
        selectedSubjects: "",
        tutorGender: "",
        tuitionMode: "",
        classesPerWeek: "",
        startDate: "",
        endDate: "",
        // Address
        state: "",
        city: "",
        pincode: "",
        location: "",
        // Parent
        parentFirstName: "",
        parentLastName: "",
        parentMobile: "",
        parentEmail: "",
        parentGender: "",
        // Student
        childName: "",
        childAge: null,
        childClass: "",
        childGender: "",
        otherInfo: "",
        // Course & Payment
        courseFee: null,
        paymentStatus: "",
        preferredTutor: "",
        remarks: ""
      }
    };
  },
  methods: {
    saveDraft() {
      try {
        localStorage.setItem(this.storageKey, JSON.stringify(this.form));
        alert("Draft saved locally.");
      } catch (err) {
        console.error(err);
        alert("Failed to save draft.");
      }
    },
    loadDraft() {
      try {
        const raw = localStorage.getItem(this.storageKey);
        if (!raw) {
          alert("No draft found.");
          return;
        }
        this.form = JSON.parse(raw);
        alert("Draft loaded.");
      } catch (err) {
        console.error(err);
        alert("Failed to load draft.");
      }
    },
    handleSubmit() {
      // basic front-end validation sample (you can extend)
      if (!this.form.parentFirstName || !this.form.parentMobile || !this.form.childName) {
        alert("Please fill at least Parent First Name, Mobile and Child Name.");
        return;
      }

      // Here you would call an API to submit the form. For now we log and clear draft.
      console.log("Submitting admission form:", this.form);

      // simulate successful submit
      try {
        localStorage.removeItem(this.storageKey);
      } catch (e) {
        // ignore
      }

      alert("Admission submitted successfully.");
      // reset form to blank
      this.resetForm();
    },
    resetForm() {
      this.form = {
        areaOfStudy: "",
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
      };
    }
  },
  mounted() {
    // auto-load draft if exists
    const raw = localStorage.getItem(this.storageKey);
    if (raw) {
      try {
        this.form = JSON.parse(raw);
      } catch (e) {
        // ignore parse errors
      }
    }
  }
};
</script>

<style scoped>
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
.section + .section {
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
  .actions > div, .actions > button {
    width: 100%;
  }
}
</style>
