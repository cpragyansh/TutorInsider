<template>
  <section class="HLC-login-form">
    <div class="HLC-login-box">
      <h1>Welcome Back</h1>
      <p class="HLC-login-subtitle">
        Log in to access your {{ roleName }} account.
      </p>

      <form @submit.prevent="handleLogin">
        <!-- Email -->
        <label>Email</label>
        <input
          type="email"
          placeholder="your.email@example.com"
          v-model="email"
          required
        />

        <!-- Password -->
        <label>Password</label>
        <div class="HLC-password-wrapper">
          <input
            :type="showPassword ? 'text' : 'password'"
            placeholder="********"
            v-model="password"
            required
          />
          <span class="HLC-toggle-password" @click="showPassword = !showPassword">
            {{ showPassword ? '🙈' : '👁' }}
          </span>
        </div>

        <!-- Submit -->
        <button type="submit" class="HLC-login-btn">Log In</button>
      </form>

      <div class="HLC-divider">OR</div>

      <p class="HLC-login-bottom">
        Don’t have an account?
        <router-link :to="`/${role}/signup`">Sign up</router-link>
      </p>
    </div>
  </section>
</template>

<script>
export default {
  name: "LoginForm",
  data() {
    return {
      email: "",
      password: "",
      showPassword: false,
    };
  },
  computed: {
    role() {
      return this.$route.params.role;
    },
    roleName() {
      const map = {
        parents: "TutorConnect Parent",
        tutors: "TutorConnect Tutor",
        admins: "TutorConnect CRM/Admin",
      };
      return map[this.role] || "TutorConnect";
    },
  },
  methods: {
    handleLogin() {
      // Simulate login success
      alert(`Logging in as ${this.roleName}`);

      // Redirect based on role
      if (this.role === "parents") {
        this.$router.push("/dashboard/parents");
      } else if (this.role === "tutors") {
        this.$router.push("/dashboard/tutors");
      } else if (this.role === "admins") {
        this.$router.push("/dashboard/admins");
      } else {
        // fallback route
        this.$router.push("/");
      }
    },
  },
};
</script>

<style>
.HLC-login-form {
  display: flex;
  justify-content: center;
  padding: 3rem 1rem;
  font-family: Arial, sans-serif;
}

.HLC-login-box {
  background: white;
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.05);
  max-width: 400px;
  width: 100%;
  text-align: center;
}

.HLC-login-box h1 {
  font-size: 1.8rem;
  font-weight: bold;
}

.HLC-login-subtitle {
  font-size: 0.9rem;
  color: #666;
  margin: 0.5rem 0 2rem 0;
}

form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  text-align: left;
}

label {
  font-weight: bold;
  font-size: 0.85rem;
}

input {
  padding: 0.6rem;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 1rem;
  width: 100%;
}

.HLC-password-wrapper {
  position: relative;
}

.HLC-toggle-password {
  position: absolute;
  right: 10px;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
}

.HLC-login-btn {
  background: #2563eb;
  color: white;
  border: none;
  padding: 0.7rem;
  border-radius: 6px;
  font-size: 1rem;
  cursor: pointer;
}

.HLC-login-btn:hover {
  background: #1e4fcf;
}

.HLC-divider {
  margin: 1.5rem 0;
  text-align: center;
  color: #888;
  font-size: 0.85rem;
}

.HLC-login-bottom {
  font-size: 0.85rem;
}
</style>
