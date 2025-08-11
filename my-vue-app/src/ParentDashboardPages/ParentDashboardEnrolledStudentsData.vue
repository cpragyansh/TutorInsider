<template>
  <div class="students-container">
    <h2>Your Registered Students</h2>
    <div class="students-grid">
      <div class="student-card" v-for="student in students" :key="student.id">
        <img :src="student.image" alt="Profile" class="profile-pic" />
        <h3>{{ student.name }}</h3>
        <p><strong>Subject:</strong> {{ student.subject }}</p>
        <p><strong>Next Session:</strong> {{ student.nextSession }}</p>
        <button @click="openProfile(student)">View Profile</button>
      </div>
    </div>

    <!-- Modal -->
    <div v-if="selectedStudent" class="modal-overlay" @click.self="closeProfile">
      <div class="modal-content">
        <span class="close-btn" @click="closeProfile">&times;</span>
        <h2>{{ selectedStudent.name }}</h2>
        <img :src="selectedStudent.image" alt="Profile" class="modal-pic" />

        <div class="info-grid">
          <div><strong>Area of Study:</strong> {{ selectedStudent.areaOfStudy }}</div>
          <div><strong>Selected Subjects:</strong> {{ selectedStudent.selectedSubjects }}</div>
          <div><strong>Preferred Tutor Gender:</strong> {{ selectedStudent.tutorGender }}</div>
          <div><strong>Mode of Tuition:</strong> {{ selectedStudent.modeOfTuition }}</div>
          <div><strong>Classes/Week:</strong> {{ selectedStudent.classesPerWeek }}</div>
          <div><strong>Start Date:</strong> {{ selectedStudent.startDate }}</div>
          <div><strong>State:</strong> {{ selectedStudent.state }}</div>
          <div><strong>City:</strong> {{ selectedStudent.city }}</div>
          <div><strong>Pincode:</strong> {{ selectedStudent.pincode }}</div>
          <div><strong>Location:</strong> {{ selectedStudent.location }}</div>
          <div><strong>Parent Name:</strong> {{ selectedStudent.parentFirstName }} {{ selectedStudent.parentLastName }}</div>
          <div><strong>Mobile:</strong> {{ selectedStudent.mobile }}</div>
          <div><strong>Email:</strong> {{ selectedStudent.email }}</div>
          <div><strong>Parent Gender:</strong> {{ selectedStudent.parentGender }}</div>
          <div><strong>Child Name:</strong> {{ selectedStudent.childName }}</div>
          <div><strong>Age:</strong> {{ selectedStudent.childAge }}</div>
          <div><strong>Class:</strong> {{ selectedStudent.childClass }}</div>
          <div><strong>Child Gender:</strong> {{ selectedStudent.childGender }}</div>
          <div><strong>Other Info:</strong> {{ selectedStudent.otherInfo }}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "RegisteredStudents",
  data() {
    return {
      students: [
        {
          id: 1,
          name: "Alice Johnson",
          subject: "Mathematics (Grade 8)",
          nextSession: "Monday, Oct 26, 3:00 PM",
          image: "https://via.placeholder.com/100",
          areaOfStudy: "Academic Coaching",
          selectedSubjects: "English, Geography",
          tutorGender: "Female Tutor",
          modeOfTuition: "Offline Tuition",
          classesPerWeek: "3 Days A Week",
          startDate: "21/08/2025",
          state: "Rajasthan",
          city: "Udaipur",
          pincode: "313001",
          location: "N/A",
          parentFirstName: "Anam",
          parentLastName: "Dev",
          mobile: "9880415308",
          email: "anamdev109@gmail.com",
          parentGender: "Male",
          childName: "Azin",
          childAge: "14",
          childClass: "9th",
          childGender: "Male",
          otherInfo: "N/A"
        },
        {
          id: 2,
          name: "Bob Williams",
          subject: "Physics (Grade 10)",
          nextSession: "Tuesday, Oct 27, 5:00 PM",
          image: "https://via.placeholder.com/100",
          areaOfStudy: "Science Coaching",
          selectedSubjects: "Physics, Chemistry",
          tutorGender: "Male Tutor",
          modeOfTuition: "Online Tuition",
          classesPerWeek: "4 Days A Week",
          startDate: "10/09/2025",
          state: "Delhi",
          city: "New Delhi",
          pincode: "110001",
          location: "N/A",
          parentFirstName: "John",
          parentLastName: "Smith",
          mobile: "9876543210",
          email: "johnsmith@gmail.com",
          parentGender: "Male",
          childName: "Mark",
          childAge: "15",
          childClass: "10th",
          childGender: "Male",
          otherInfo: "N/A"
        }
      ],
      selectedStudent: null
    };
  },
  methods: {
    openProfile(student) {
      this.selectedStudent = student;
    },
    closeProfile() {
      this.selectedStudent = null;
    }
  }
};
</script>

<style scoped>
.students-container {
  padding: 20px;
  background: #fff;
}
.students-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
}
.student-card {
  background: #fff;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  text-align: center;
}
.profile-pic {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
.student-card h3 {
  margin: 10px 0;
}
.student-card button {
  padding: 10px 20px;
  background: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.student-card button:hover {
  background: #0056b3;
}
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
.modal-content {
  background: #fff;
  padding: 30px;
  border-radius: 10px;
  max-width: 800px;
  width: 90%;
  position: relative;
  max-height: 90vh;
  overflow-y: auto;
}
.modal-pic {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  display: block;
  margin: 10px auto;
}
.close-btn {
  position: absolute;
  top: 15px;
  right: 20px;
  font-size: 24px;
  cursor: pointer;
}
.info-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 15px;
  margin-top: 20px;
}
</style>
