<template>
  <div class="profile-container">
    <!-- Top Profile Card -->
    <button class="edit-btn" @click="$router.push('/dashboard/tutor/tutorInformationEdit')">
      ✎
    </button>
    <div class="card profile-card" v-if="profile">
      <div class="profile-header">
        <div class="profile-left">
          <img :src="profilePic" alt="Profile" class="profile-pic" />
          <div>
            <h3 class="profile-name">{{ profile.first_name }} {{ profile.last_name }}</h3>
            <p class="profile-email">{{ profile.email_address }}</p>
          </div>
        </div>
        <button class="edit-btn" @click="$router.push('/dashboard/tutor/tutorInformationEdit')">
          ✎
        </button>
      </div>
      <div class="profile-info">
        <p><strong>Contact No:</strong> {{ profile.mobile_number }}</p>
        <p><strong>Gender:</strong> {{ profile.gender }}</p>
        <p><strong>Address:</strong> {{ profile.street }}</p>
        <p><strong>City:</strong> {{ profile.city }}</p>
        <p><strong>State:</strong> {{ profile.state }}</p>
        <p><strong>Pincode:</strong> {{ profile.pincode || 'N/A' }}</p>
      </div>
    </div>

    <!-- Teaching Preference -->
    <div class="card" v-if="profile">
      <h3>Teaching Preference</h3>
      <p><strong>Mode of Teaching:</strong> {{ profile.mode_of_teaching }}</p>
      <p><strong>Teaching Experience:</strong> {{ profile.teaching_experience }}</p>
      <p><strong>Job Type:</strong> {{ profile.job_type }}</p>
      <p><strong>Time Availability:</strong> {{ profile.time_from }} to {{ profile.time_to }}</p>
      <p><strong>Special Request:</strong> {{ profile.special_request || 'N/A' }}</p>
    </div>

    <!-- Uploaded Documents -->
    <div class="card">
      <h3>Uploaded Document</h3>
      <div v-for="doc in documents" :key="doc.id">
        <p>
          {{ doc.type }}: 
          <a :href="doc.url" target="_blank">{{ doc.original_name }}</a> ✅
        </p>
      </div>
      <div v-if="documents.length===0">
        <p>No documents uploaded ❌</p>
      </div>
    </div>

    <!-- Qualification -->
    <div class="card" v-if="profile">
  <h3>Qualification</h3>

  <!-- Academic Background Text -->
  <p v-if="profile.academic_background">
    <strong>Academic Background:</strong> {{ profile.academic_background }}
  </p>

  <!-- Academic Documents -->
  <div>
    <p><strong>Academic Documents:</strong></p>
    <div v-if="documents && documents.length">
      <div v-for="doc in documents" :key="doc.id">
        <a :href="doc.url" target="_blank">{{ doc.original_name }}</a> 📄
      </div>
    </div>
    <p v-else>No academic documents uploaded ❌</p>
  </div>

  <button class="reset-btn">Reset Password</button>
</div>

  </div>
</template>

<script>
import axios from "axios";
const API = import.meta.env.VITE_API_URL || "http://localhost:5000/api";

export default {
  name: "ProfilePage",
  data() {
    return {
      profile: null,
      documents: [],
      profilePic: "https://via.placeholder.com/80"
    };
  },
  computed: {
    authHeaders() {
      const token = localStorage.getItem("token");
      return { Authorization: `Bearer ${token}` };
    },
    academicDoc() {
      return this.documents.find(d => d.type === "degree") || null;
    }
  },
  mounted() {
    this.fetchProfile();
  },
  methods: {
    async fetchProfile() {
      try {
        const { data } = await axios.get(`${API}/me`, { headers: this.authHeaders });
        if (data?.user) {
          this.profile = data.user;
          if (data.user.profile_photo) {
            this.profilePic = `${API.replace("/api","")}${data.user.profile_photo}`;
          }
        }
        if (data?.user?.TutorDocuments) {
          this.documents = data.user.TutorDocuments.map(d => ({
            ...d,
            url: `${API.replace("/api","")}${d.file_url}`
          }));
        }
      } catch (err) {
        console.error(err);
        alert("Failed to fetch profile");
      }
    }
  }
};
</script>

<style scoped>
/* your styles unchanged */
.profile-container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  padding: 20px;
}
.card {
  background: #fff;
  border-radius: 8px;
  padding: 16px;
  box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
}
.profile-card {
  grid-column: span 2;
}
.profile-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.profile-left {
  display: flex;
  align-items: center;
}
.profile-pic {
  border-radius: 50%;
  width: 80px;
  margin-right: 15px;
}
.edit-btn {
  background: transparent;
  border: none;
  font-size: 20px;
  cursor: pointer;
}
.reset-btn {
  background: #007bff;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  margin-top: 12px;
  cursor: pointer;
}
</style>
