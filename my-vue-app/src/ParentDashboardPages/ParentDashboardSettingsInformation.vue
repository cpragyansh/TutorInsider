<template>
  <div class="details-form">
    <h2 class="form-title">Detailed Information Form</h2>

    <form @submit.prevent="continueToPayment">
      <!-- Row 1 -->
      <div class="form-row">
        <div class="form-group">
          <label>Area of Study:</label>
          <input v-model="form.areaOfStudy" type="text" />
        </div>
        <div class="form-group">
          <label>Selected Subjects:</label>
          <input v-model="form.selectedSubjects" type="text" />
        </div>
      </div>

      <!-- Row 2 -->
      <div class="form-row">
        <div class="form-group">
          <label>Preferred Tutor Gender:</label>
          <select v-model="form.tutorGender">
            <option>Male Tutor</option>
            <option>Female Tutor</option>
            <option>Any</option>
          </select>
        </div>
        <div class="form-group">
          <label>Mode Of Tuition:</label>
          <select v-model="form.modeOfTuition">
            <option>Online Tuition</option>
            <option>Offline Tuition</option>
          </select>
        </div>
      </div>

      <!-- Row 3 -->
      <div class="form-row">
        <div class="form-group">
          <label>No. Of Classes Per Week:</label>
          <select v-model="form.classesPerWeek">
            <option>1 Day a Week</option>
            <option>2 Day a Week</option>
            <option>3 Day a Week</option>
            <option>5 Day a Week</option>
          </select>
        </div>
        <div class="form-group">
          <label>Start Date:</label>
          <input v-model="form.startDate" type="date" />
        </div>
      </div>

      <!-- Row 4 -->
      <div class="form-row">
        <div class="form-group">
          <label>State:</label>
          <input v-model="form.state" type="text" />
        </div>
        <div class="form-group">
          <label>City:</label>
          <input v-model="form.city" type="text" />
        </div>
      </div>

      <!-- Row 5 -->
      <div class="form-row">
        <div class="form-group">
          <label>Pincode:</label>
          <input v-model="form.pincode" type="text" />
        </div>
        <div class="form-group">
          <label>Location (Specific):</label>
          <input v-model="form.location" type="text" />
        </div>
      </div>

      <!-- Row 6 -->
      <div class="form-row">
        <div class="form-group">
          <label>First Name:</label>
          <input v-model="form.firstName" type="text" />
        </div>
        <div class="form-group">
          <label>Last Name:</label>
          <input v-model="form.lastName" type="text" />
        </div>
      </div>

      <!-- Row 7 -->
      <div class="form-row">
        <div class="form-group">
          <label>Mobile No.:</label>
          <input v-model="form.mobile" type="text" />
        </div>
        <div class="form-group">
          <label>Email Address:</label>
          <input v-model="form.email" type="email" />
        </div>
      </div>

      <!-- Row 8 -->
      <div class="form-row">
        <div class="form-group">
          <label>Gender:</label>
          <div class="radio-group">
            <label><input type="radio" value="Male" v-model="form.gender" /> Male</label>
            <label><input type="radio" value="Female" v-model="form.gender" /> Female</label>
            <label><input type="radio" value="Other" v-model="form.gender" /> Other</label>
          </div>
        </div>
      </div>

      <!-- Row 9 -->
      <div class="form-row">
        <div class="form-group">
          <label>Child Name:</label>
          <input v-model="form.childName" type="text" />
        </div>
        <div class="form-group">
          <label>Age:</label>
          <input v-model="form.age" type="number" />
        </div>
      </div>

      <!-- Row 10 -->
      <div class="form-row">
        <div class="form-group">
          <label>Class:</label>
          <input v-model="form.class" type="text" />
        </div>
        <div class="form-group">
          <label>Child Gender:</label>
          <div class="radio-group">
            <label><input type="radio" value="Male" v-model="form.childGender" /> Male</label>
            <label><input type="radio" value="Female" v-model="form.childGender" /> Female</label>
            <label><input type="radio" value="Other" v-model="form.childGender" /> Other</label>
          </div>
        </div>
      </div>

      <!-- Row 11 -->
      <div class="form-row">
        <div class="form-group full-width">
          <label>Other Information:</label>
          <input v-model="form.otherInfo" type="text" />
        </div>
      </div>

      <!-- Buttons -->
      <div class="form-actions">
        <button type="button" class="save-btn" @click="saveDraft">Save Draft</button>
        <button type="submit" class="continue-btn">Continue to Payment</button>
        <router-link to="/dashboard/parents/ParentDashboardPaymentGateway" ><button type="submit" class="continue-btn">Continue to Payment</button></router-link>
    </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "DetailedInformationForm",
  data() {
    return {
      form: {
        areaOfStudy: "",
        selectedSubjects: "",
        tutorGender: "",
        modeOfTuition: "",
        classesPerWeek: "",
        startDate: "",
        state: "",
        city: "",
        pincode: "",
        location: "",
        firstName: "",
        lastName: "",
        mobile: "",
        email: "",
        gender: "",
        childName: "",
        age: "",
        class: "",
        childGender: "",
        otherInfo: ""
      }
    };
  },
  methods: {
    saveDraft() {
      localStorage.setItem("studentForm", JSON.stringify(this.form));
      alert("Draft saved!");
    },
    continueToPayment() {
      console.log("Form submitted:", this.form);
      alert("Proceeding to payment...");
    }
  },
  mounted() {
    const savedForm = localStorage.getItem("studentForm");
    if (savedForm) {
      this.form = JSON.parse(savedForm);
    }
  }
};
</script>

<style scoped>
.details-form {
  background: #fff;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0px 4px 12px rgba(0,0,0,0.05);
  max-width: 1000px;
  margin: auto;
  font-family: Arial, sans-serif;
}

.form-title {
  font-size: 24px;
  margin-bottom: 20px;
  font-weight: bold;
}

form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-row {
  display: flex;
  gap: 20px;
}

.form-group {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.form-group label {
  font-size: 14px;
  margin-bottom: 6px;
  font-weight: 600;
}

input, select {
  padding: 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 14px;
}

.full-width {
  flex: 1 1 100%;
}

.radio-group {
  display: flex;
  gap: 15px;
  margin-top: 5px;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
}

.save-btn {
  background: #f1f1f1;
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
}

.continue-btn {
  background: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
}

.continue-btn:hover {
  background: #0056b3;
}
</style>
