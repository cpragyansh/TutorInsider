<template>
  <div class="schedule-container">
    <!-- Upcoming Sessions -->
    <h2>Upcoming Sessions Schedule</h2>
    <table class="schedule-table">
      <thead>
        <tr>
          <th>STUDENT</th>
          <th>TUTOR</th>
          <th>SUBJECT</th>
          <th>DATE</th>
          <th>TIME</th>
          <th>STATUS</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(session, index) in upcomingSessions" :key="'up-' + index">
          <td>{{ session.student }}</td>
          <td>{{ session.tutor }}</td>
          <td>{{ session.subject }}</td>
          <td>{{ session.date }}</td>
          <td>{{ session.time }}</td>
          <td>
            <span :class="['status', session.status.toLowerCase()]">
              {{ session.status }}
            </span>
          </td>
        </tr>
      </tbody>
    </table>

    <!-- Completed Classes -->
    <h2 style="margin-top: 30px;">Completed Classes</h2>
    <table class="schedule-table">
      <thead>
        <tr>
          <th>STUDENT</th>
          <th>TUTOR</th>
          <th>SUBJECT</th>
          <th>DATE</th>
          <th>TIME</th>
          <th>STATUS</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(session, index) in completedSessions" :key="'comp-' + index">
          <td>{{ session.student }}</td>
          <td>{{ session.tutor }}</td>
          <td>{{ session.subject }}</td>
          <td>{{ session.date }}</td>
          <td>{{ session.time }}</td>
          <td>
            <span :class="['status', session.status.toLowerCase()]">
              {{ session.status }}
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: "SessionsSchedule",
  data() {
    return {
      upcomingSessions: [
        { student: "Alice Johnson", tutor: "Mr. David Lee", subject: "Mathematics", date: "Oct 26, 2024", time: "3:00 PM", status: "Confirmed" },
        { student: "Bob Williams", tutor: "Ms. Emily Chen", subject: "Physics", date: "Oct 27, 2024", time: "5:00 PM", status: "Scheduled" },
        { student: "Charlie Brown", tutor: "Mr. James White", subject: "English", date: "Oct 28, 2024", time: "4:00 PM", status: "Confirmed" },
        { student: "Alice Johnson", tutor: "Mr. David Lee", subject: "Mathematics", date: "Oct 29, 2024", time: "3:00 PM", status: "Scheduled" },
        { student: "Bob Williams", tutor: "Ms. Emily Chen", subject: "Physics", date: "Oct 30, 2024", time: "5:00 PM", status: "Scheduled" }
      ],
      completedSessions: [
        { student: "Alice Johnson", tutor: "Mr. David Lee", subject: "Mathematics", date: "Oct 10, 2024", time: "3:00 PM", status: "Completed" },
        { student: "Bob Williams", tutor: "Ms. Emily Chen", subject: "Physics", date: "Oct 11, 2024", time: "5:00 PM", status: "Completed" },
        { student: "Charlie Brown", tutor: "Mr. James White", subject: "English", date: "Oct 12, 2024", time: "4:00 PM", status: "Completed" }
      ]
    };
  }
};
</script>

<style scoped>
.schedule-container {
  padding: 20px;
  font-family: Arial, sans-serif;
}

h2 {
  font-size: 20px;
  margin-bottom: 10px;
}

.schedule-table {
  width: 100%;
  border-collapse: collapse;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

.schedule-table th,
.schedule-table td {
  padding: 12px 15px;
  text-align: left;
}

.schedule-table thead {
  background: #f9f9f9;
}

.schedule-table tbody tr:nth-child(even) {
  background: #fdfdfd;
}

.status {
  padding: 4px 8px;
  border-radius: 8px;
  font-size: 12px;
  font-weight: bold;
}

.status.confirmed {
  background: #fff4e5;
  color: #ff9800;
}

.status.scheduled {
  background: #eaf4ff;
  color: #2196f3;
}

.status.completed {
  background: #e8f5e9;
  color: #4caf50;
}
</style>
