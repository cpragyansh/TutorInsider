  <template>
    <div class="edit-container">
      <h2 class="page-title">Edit Profile</h2>
      <p class="subtitle">Manage and update your profile settings below.</p>

      <!-- Profile Picture -->
      <div class="card">
        <h3 class="section-title">Profile Picture</h3>
        <div class="profile-pic-section">
          <img :src="previewImage || defaultPic" alt="Profile" class="profile-pic" />
          <div class="upload-controls">
            <label for="profileUpload" class="upload-label">Update Profile Photo</label>
            <input id="profileUpload" type="file" @change="previewFile" />
            <p class="hint">Accepted formats: JPG, PNG. Max size: 5MB.</p>
          </div>
        </div>
      </div>

      <!-- Personal Details -->
      <div class="card">
        <h3 class="section-title">Personal Details</h3>
        <div class="grid-2">
          <input v-model="form.firstName" placeholder="First Name" />
          <input v-model="form.lastName" placeholder="Last Name" />
        </div>
        <div class="gender-toggle">
          <label>Gender:</label>
          <button :class="{ active: form.gender === 'Male' }" @click="form.gender = 'Male'">Male</button>
          <button :class="{ active: form.gender === 'Female' }" @click="form.gender = 'Female'">Female</button>
        </div>
      </div>

      <!-- Contact Information -->
      <div class="card">
        <h3 class="section-title">Contact Information</h3>
        <div class="grid-2">
          <input v-model="form.mobile" placeholder="Mobile No." />
          <input v-model="form.email" placeholder="Email Address" />
        </div>
      </div>

      <!-- Address -->
      <div class="card">
        <h3 class="section-title">Address</h3>
        <div class="grid-2">
          <select v-model="form.country">
            <option>India</option>
            <option>USA</option>
            <option>UK</option>
          </select>
          <input v-model="form.state" placeholder="State" />
        </div>
        <div class="grid-2">
          <input v-model="form.city" placeholder="City" />
          <input v-model="form.pincode" placeholder="Pincode" />
        </div>
        <input v-model="form.street" placeholder="Street Address" />
      </div>

      <!-- Teaching Preferences -->
      <div class="card">
        <h3 class="section-title">Teaching Preferences</h3>
        <div class="grid-2">
          <select v-model="form.modeOfTeaching">
            <option>Online</option>
            <option>Offline</option>
            <option>Both</option>
          </select>
          <select v-model="form.teachingExperience">
            <option v-for="i in 10" :key="i">{{ i }} Years</option>
            <option>Other</option>
          </select>
        </div>
        <div v-if="form.teachingExperience === 'Other'">
          <input v-model="form.customExperience" placeholder="Enter Experience" />
        </div>
        <div class="grid-2">
          <select v-model="form.jobType">
            <option>Part-time</option>
            <option>Full-time</option>
            <option>Both</option>
          </select>
          <div class="grid-2">
            <input type="time" v-model="form.timeFrom" />
            <input type="time" v-model="form.timeTo" />
          </div>
        </div>
      </div>

      <!-- Special Requests -->
      <div class="card">
        <h3 class="section-title">Special Requests</h3>
        <textarea v-model="form.specialRequest" placeholder="Any special notes or requests?"></textarea>
      </div>

      <!-- Document Upload -->
      <div class="card">
        <h3 class="section-title">Document Upload</h3>
        <div v-for="doc in documents" :key="doc.name" class="upload-row">
          <label>{{ doc.label }}</label>
          <input type="file" @change="(e) => startUpload(doc.name, e)" />
          <div class="progress-bar">
            <div class="progress" :style="{ width: doc.progress + '%' }"></div>
          </div>
          <div v-if="getDocUrl(doc.name)">
            <a :href="getDocUrl(doc.name)" target="_blank">View Uploaded File</a>
          </div>
        </div>
      </div>

      <!-- Qualification -->
      <div class="card">
        <h3 class="section-title">Qualification</h3>
        <div class="grid-2">
          <select v-model="form.academicBackground">
            <option>Bachelor's Degree</option>
            <option>Master's Degree</option>
            <option>PhD</option>
          </select>
          <input type="file" @change="(e) => startUpload('degree', e)" />
          <div v-if="getDocUrl('degree')">
            <a :href="getDocUrl('degree')" target="_blank">View Uploaded File</a>
          </div>
        </div>
      </div>

      <!-- Submit -->
      <button class="submit-btn" @click="saveProfile">Save Changes</button>
    </div>
  </template>

<script>
import axios from "axios";

const API = import.meta.env.VITE_API_URL || "http://localhost:5000/api";

export default {
  name: "EditProfile",
  data() {
    return {
      defaultPic: "https://via.placeholder.com/100",
      previewImage: null,
      docTypeMap: {
        address: "address",
        photo: "photoid",
        aadhaar: "aadhaar",
        cv: "cv",
        video: "video",
        degree: "degree"
      },
      form: {
        firstName: "",
        lastName: "",
        gender: "Male",
        mobile: "",
        email: "",
        country: "",
        state: "",
        city: "",
        pincode: "",
        street: "",
        modeOfTeaching: "Online",
        teachingExperience: "5 Years",
        customExperience: "",
        jobType: "Full-time",
        timeFrom: "09:00",
        timeTo: "17:00",
        specialRequest: "",
        academicBackground: "Bachelor's Degree",
      },
      documents: [
        { name: "address", label: "Address Proof", progress: 0 },
        { name: "photo", label: "Photo ID", progress: 0 },
        { name: "aadhaar", label: "Masked Aadhaar", progress: 0 },
        { name: "cv", label: "CV / Resume", progress: 0 },
        { name: "video", label: "Intro Video", progress: 0 },
        { name: "degree", label: "Degree Certificate", progress: 0 }
      ],
      profilePhotoUrl: null,
      allDocs: []
    };
  },
  computed: {
    authHeaders() {
      const token = localStorage.getItem("token");
      return { Authorization: `Bearer ${token}` };
    }
  },
  mounted() {
    this.fetchProfile();
  },
  methods: {
    getDocUrl(name) {
      const doc = this.allDocs.find(d => d.doc_type === this.docTypeMap[name]);
      return doc ? doc.url : null;
    },

    async fetchProfile() {
      try {
        const { data } = await axios.get(`${API}/me`, { headers: this.authHeaders });
        if (data?.user) {
          const p = data.user;
          this.form.firstName = p.first_name || "";
          this.form.lastName = p.last_name || "";
          this.form.gender = p.gender || "Male";
          this.form.mobile = p.mobile_number || "";
          this.form.email = p.email_address || "";
          this.form.country = p.country || "";
          this.form.state = p.state || "";
          this.form.city = p.city || "";
          this.form.pincode = p.pincode || "";
          this.form.street = p.street || "";
          this.form.modeOfTeaching = p.mode_of_teaching || "Online";
          this.form.teachingExperience = p.teaching_experience || "5 Years";
          this.form.customExperience = p.custom_experience || "";
          this.form.jobType = p.job_type || "Full-time";
          this.form.timeFrom = p.time_from || "09:00";
          this.form.timeTo = p.time_to || "17:00";
          this.form.specialRequest = p.special_request || "";
          this.form.academicBackground = p.academic_background || "Bachelor's Degree";
          this.profilePhotoUrl = p.profile_photo ? `${API.replace('/api', '')}${p.profile_photo}` : null;
          this.previewImage = this.profilePhotoUrl;
        }
        if (data?.user?.TutorDocuments) {
          this.allDocs = data.user.TutorDocuments.map(d => ({
            ...d,
            url: `${API.replace('/api', '')}${d.file_url}`
          }));
        }
      } catch (err) {
        console.error(err);
        alert(err?.response?.data?.message || 'Failed to load profile');
      }
    },

    async saveProfile() {
      try {
        const payload = {
          first_name: this.form.firstName,
          last_name: this.form.lastName,
          gender: this.form.gender,
          mobile_number: this.form.mobile,
          email_address: this.form.email,
          country: this.form.country,
          state: this.form.state,
          city: this.form.city,
          pincode: this.form.pincode,
          street: this.form.street,
          mode_of_teaching: this.form.modeOfTeaching,
          teaching_experience: this.form.teachingExperience,
          custom_experience: this.form.customExperience,
          job_type: this.form.jobType,
          time_from: this.form.timeFrom,
          time_to: this.form.timeTo,
          special_request: this.form.specialRequest,
          academic_background: this.form.academicBackground,
        };
        const { data } = await axios.put(`${API}/profile/me`, payload, { headers: this.authHeaders });
        if (data.success) {
          alert("Profile saved");
          this.fetchProfile();
        }
      } catch (err) {
        console.error(err);
        alert(err?.response?.data?.message || "Save failed");
      }
    },

    previewFile(event) {
      const file = event.target.files[0];
      if (file) {
        this.previewImage = URL.createObjectURL(file);
        this.uploadProfilePhoto(file);
      }
    },

    async uploadProfilePhoto(file) {
      try {
        const fd = new FormData();
        fd.append('file', file);
        const { data } = await axios.post(`${API}/me/profile-photo`, fd, {
          headers: { ...this.authHeaders, 'Content-Type': 'multipart/form-data' }
        });
        if (data.success) {
          this.profile_photo = `${API.replace('/api', '')}${data.file}`;
          this.previewImage = this.profile_photo;
        }
      } catch (err) {
        console.error(err);
        alert(err?.response?.data?.message || 'Photo upload failed');
      }
    },

    startUpload(docName, evt) {
      let doc = this.documents.find(d => d.name === docName);
      if (!doc) return;
      const file = evt?.target?.files?.[0];
      if (!file) return;
      doc.progress = 0;
      const timer = setInterval(() => {
        if (doc.progress >= 90) clearInterval(timer);
        else doc.progress += 10;
      }, 200);
      this.uploadDocument(docName, file).then(() => {
        doc.progress = 100;
      }).catch(() => {
        doc.progress = 0;
      });
    },
    async uploadDocument(docName, file) {
      try {
        const type = this.docTypeMap[docName] || docName;

        const fd = new FormData();
        fd.append('file', file);
        fd.append('doc_type', type); // ✅ Add doc_type field

        const { data } = await axios.post(`${API}/me/documents`, fd, {
          headers: {
            ...this.authHeaders,
            'Content-Type': 'multipart/form-data'
          }
        });

        if (data.success) {
          this.fetchProfile();
        }
      } catch (err) {
        console.error(err);
        alert(err?.response?.data?.message || 'Upload failed');
        throw err;
      }
    }

  }
};
</script>

<style scoped>
/* keep your CSS exactly as before */
.edit-container {
  max-width: 1000px;
  margin: auto;
  padding: 20px;
  background: #f9fafb;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.page-title {
  font-size: 26px;
  margin-bottom: 6px;
  color: #111827;
}

.subtitle {
  color: #6b7280;
  margin-bottom: 20px;
}

.card {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
  margin-bottom: 20px;
  box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.08);
}

.section-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 15px;
  color: #374151;
  border-bottom: 2px solid #e5e7eb;
  padding-bottom: 5px;
}

input,
select,
textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid #d1d5db;
  border-radius: 8px;
  font-size: 14px;
  transition: border 0.3s, box-shadow 0.3s;
}

input:focus,
select:focus,
textarea:focus {
  border-color: #2563eb;
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.2);
  outline: none;
}

.grid-2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 14px;
  margin-top: 10px;
}

@media (max-width: 768px) {
  .grid-2 {
    grid-template-columns: 1fr;
  }
}

.profile-pic-section {
  display: flex;
  align-items: center;
  gap: 20px;
}

.profile-pic {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  border: 3px solid #e5e7eb;
}

.upload-label {
  display: inline-block;
  background: #2563eb;
  color: #fff;
  padding: 6px 12px;
  border-radius: 6px;
  cursor: pointer;
  margin-bottom: 6px;
}

.upload-label:hover {
  background: #1d4ed8;
}

.hint {
  font-size: 12px;
  color: #6b7280;
}

.gender-toggle {
  margin-top: 12px;
}

.gender-toggle button {
  margin-left: 10px;
  padding: 8px 16px;
  border: 1px solid #d1d5db;
  background: #f3f4f6;
  border-radius: 6px;
  cursor: pointer;
  transition: background 0.3s, color 0.3s;
}

.gender-toggle button.active {
  background: #2563eb;
  color: #fff;
  border-color: #2563eb;
}

textarea {
  min-height: 100px;
  resize: vertical;
}

.upload-row {
  margin-bottom: 16px;
}

.progress-bar {
  background: #e5e7eb;
  height: 8px;
  border-radius: 6px;
  margin-top: 6px;
  overflow: hidden;
}

.progress {
  height: 100%;
  background: #10b981;
  width: 0%;
  transition: width 0.4s ease;
}

.submit-btn {
  background: #2563eb;
  color: #fff;
  padding: 14px 28px;
  border: none;
  border-radius: 10px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  margin-top: 20px;
  display: block;
  width: 100%;
  transition: background 0.3s, transform 0.2s;
}

.submit-btn:hover {
  background: #1d4ed8;
  transform: translateY(-2px);
}
</style>
