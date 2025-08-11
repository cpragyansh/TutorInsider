<template>
  <aside :class="['sidebar', { collapsed }]">
    <!-- Logo + Toggle -->
    <div class="sidebar-header">
      <!-- <img src="/logo.png" alt="Logo" class="logo" v-if="!collapsed" /> -->
      <button class="toggle-btn" @click="collapsed = !collapsed">
        <span v-if="collapsed">☰</span>
        <span v-else>×</span>
      </button>
    </div>

    <!-- Navigation -->
    <nav>
      <ul>
        <li>
          <router-link to="/dashboard/parents" class="nav-item" active-class="active">
            <i class="icon">🏠</i>
            <span v-if="!collapsed">Overview</span>
          </router-link>
        </li>
        <li>
          <router-link to="/dashboard/parents/Schedule" class="nav-item" active-class="active">
            <i class="icon">📅</i>
            <span v-if="!collapsed">Schedule</span>
          </router-link>
        </li>
        <!-- <li>
          <router-link to="/tutors" class="nav-item" active-class="active">
            <i class="icon">👥</i>
            <span v-if="!collapsed">Tutors</span>
          </router-link>
        </li> -->
        <li>
          <router-link to="/dashboard/parents/CourseManagement" class="nav-item" active-class="active">
            <i class="icon">📖</i>
            <span v-if="!collapsed">My Courses</span>
          </router-link>
        </li>
      </ul>

      <div class="section-title" v-if="!collapsed">MANAGEMENT</div>

      <ul>
        <li>
          <router-link to="/dashboard/parents/ParentDashboardNotificationCenter" class="nav-item" active-class="active">
            <i class="icon">🔔</i>
            <span v-if="!collapsed">Notifications</span>
            <span v-if="!collapsed" class="badge">3</span>
          </router-link>
        </li>
        <!-- <li>
          <router-link to="/messages" class="nav-item" active-class="active">
            <i class="icon">✉️</i>
            <span v-if="!collapsed">Messages</span>
          </router-link>
        </li> -->
        <li>
          <router-link to="/dashboard/parents/ParentDashboardSettingsCenter" class="nav-item" active-class="active">
            <i class="icon">⚙️</i>
            <span v-if="!collapsed">Settings</span>
          </router-link>
        </li>
      </ul>

      <ul>
        <!-- <li>
          <router-link to="/dashboard-home" class="nav-item" active-class="active">
            <i class="icon">🏠</i>
            <span v-if="!collapsed">Dashboard</span>
          </router-link>
        </li> -->
        <li>
          <router-link to="/dashboard/parents/ParentDashboardEnrolledStudents" class="nav-item" active-class="active">
            <i class="icon">👨‍🎓</i>
            <span v-if="!collapsed">Enrolled Students</span>
          </router-link>
        </li>
        <li>
          <router-link to="/dashboard/parents/ParentDashboardAddStudent" class="nav-item" active-class="active">
            <i class="icon">➕</i>
            <span v-if="!collapsed">Add New Student</span>
          </router-link>
        </li>
        <li>
          <router-link to="/dashboard/parents/ParentDashboardPaymentGateway" class="nav-item" active-class="active">
            <i class="icon">💳</i>
            <span v-if="!collapsed">Billing & Payments</span>
          </router-link>
        </li>
      </ul>
    </nav>
  </aside>
</template>

<script>
export default {
  name: "Sidebar",
  data() {
    return {
      collapsed: false
    };
  }
};
</script>

<style scoped>
.sidebar {
  width: 240px;
  height: 100vh;
  background: white;
  border-right: 1px solid #ddd;
  padding-top: 10px;
  display: flex;
  flex-direction: column;
  transition: width 0.3s ease;
}

.sidebar.collapsed {
  width: 70px;
}

.sidebar-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 15px;
  margin-bottom: 15px;
}

.logo {
  width: 80px;
}

.toggle-btn {
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
}

.section-title {
  font-size: 12px;
  font-weight: bold;
  color: #777;
  padding: 0 20px;
  margin: 10px 0;
}

nav {
  flex: 1;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0 0 10px 0;
}

.nav-item {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  color: #333;
  text-decoration: none;
  position: relative;
  font-size: 14px;
  border-radius: 6px;
  transition: all 0.2s ease;
}

.nav-item:hover {
  background: #e6f0ff;
  color: #0056d6;
}

.nav-item.active {
  background: #e6f0ff;
  color: #0056d6;
  font-weight: bold;
}

.icon {
  font-size: 16px;
  margin-right: 10px;
  transition: margin 0.3s ease;
}

.sidebar.collapsed .icon {
  margin-right: 0;
}

.badge {
  background: #007bff;
  color: white;
  border-radius: 50%;
  font-size: 12px;
  padding: 2px 6px;
  position: absolute;
  right: 15px;
}
</style>
