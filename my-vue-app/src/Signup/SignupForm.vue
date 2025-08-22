<template>
  <div class="signup-container">
    <div class="signup-card">
      <h1>Sign Up</h1>
      <form @submit.prevent="submitForm">

        <input v-model="form.first_name" type="text" placeholder="First Name" />
        <p v-if="errors.first_name" class="error">{{ errors.first_name }}</p>

        <input v-model="form.last_name" type="text" placeholder="Last Name" />
        <p v-if="errors.last_name" class="error">{{ errors.last_name }}</p>

        <input v-model="form.mobile_number" type="text" placeholder="Mobile Number" />
        <p v-if="errors.mobile_number" class="error">{{ errors.mobile_number }}</p>

        <input v-model="form.email_address" type="email" placeholder="Email Address" />
        <p v-if="errors.email_address" class="error">{{ errors.email_address }}</p>

        <input v-model="form.username" type="text" placeholder="Username" />
        <p v-if="errors.username" class="error">{{ errors.username }}</p>

        <input v-model="form.password" type="password" placeholder="Password" />
        <p v-if="errors.password" class="error">{{ errors.password }}</p>

        <input v-model="form.confirm_password" type="password" placeholder="Confirm Password" />
        <p v-if="errors.confirm_password" class="error">{{ errors.confirm_password }}</p>

        <select v-model="form.gender">
          <option value="" disabled>Select Gender</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
          <option value="other">Other</option>
        </select>
        <p v-if="errors.gender" class="error">{{ errors.gender }}</p>

        <input v-model="form.address" type="text" placeholder="Address" />
        <p v-if="errors.address" class="error">{{ errors.address }}</p>

        <input v-model="form.state" type="text" placeholder="State" />
        <p v-if="errors.state" class="error">{{ errors.state }}</p>

        <input v-model="form.city" type="text" placeholder="City" />
        <p v-if="errors.city" class="error">{{ errors.city }}</p>

        <select v-model="form.type">
          <option value="" disabled>Select Type</option>
          <option value="tutor">Tutor</option>
          <option value="parent">Parent</option>
        </select>
        <p v-if="errors.type" class="error">{{ errors.type }}</p>

        <button type="submit" :disabled="loading">{{ loading ? 'Signing up...' : 'Sign Up' }}</button>
      </form>

      <p v-if="backendMessage" :class="backendSuccess ? 'success' : 'error'">{{ backendMessage }}</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Signup",
  data() {
    return {
      form: {
        first_name: "",
        last_name: "",
        mobile_number: "",
        email_address: "",
        username: "",
        password: "",
        confirm_password: "",
        gender: "",
        address: "",
        state: "",
        city: "",
        type: "",
      },
      errors: {},
      backendMessage: "",
      backendSuccess: false,
      loading: false,
    };
  },
  methods: {
    validate() {
      this.errors = {};

      if (!this.form.first_name) this.errors.first_name = "First name is required";
      if (!this.form.last_name) this.errors.last_name = "Last name is required";
      if (!this.form.mobile_number) this.errors.mobile_number = "Mobile number is required";
      else if (!/^\d{10}$/.test(this.form.mobile_number)) this.errors.mobile_number = "Mobile must be 10 digits";

      if (!this.form.email_address) this.errors.email_address = "Email is required";
      else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.form.email_address)) this.errors.email_address = "Invalid email";

      if (!this.form.username) this.errors.username = "Username is required";

      if (!this.form.password) this.errors.password = "Password is required";
      if (!this.form.confirm_password) this.errors.confirm_password = "Confirm password is required";
      else if (this.form.password !== this.form.confirm_password) this.errors.confirm_password = "Passwords do not match";

      if (!this.form.gender) this.errors.gender = "Select gender";
      if (!this.form.address) this.errors.address = "Address is required";
      if (!this.form.state) this.errors.state = "State is required";
      if (!this.form.city) this.errors.city = "City is required";
      if (!this.form.type) this.errors.type = "Select type";

      return Object.keys(this.errors).length === 0;
    },
    async submitForm() {
      if (!this.validate()) return;

      this.loading = true;
      this.backendMessage = "";

      try {
        const res = await axios.post("http://localhost:5000/api/auth/signup", this.form);
        if (res.data.success) {
          this.backendSuccess = true;
          this.backendMessage = res.data.message;
          setTimeout(() => this.$router.push("/Login"), 1000);
        } else {
          this.backendSuccess = false;
          this.backendMessage = res.data.message || "Signup failed";
        }
      } catch (err) {
        this.backendSuccess = false;
        this.backendMessage = err.response?.data?.message || "Server error";
      } finally {
        this.loading = false;
      }
    },
  },
};
</script>

<style scoped>
.signup-container {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f5f7fa;
  padding: 20px;
}
.signup-card {
  background: #fff;
  padding: 30px;
  border-radius: 10px;
  width: 100%;
  max-width: 500px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}
input, select, button {
  display: block;
  width: 100%;
  margin-bottom: 12px;
  padding: 10px;
  font-size: 14px;
}
button {
  background: #0077B3;
  color: #fff;
  border: none;
  cursor: pointer;
}
button:disabled {
  background: #555;
}
.error { color: red; font-size: 13px; }
.success { color: green; font-size: 13px; }
</style>
