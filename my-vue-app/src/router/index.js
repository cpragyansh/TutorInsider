import { createRouter, createWebHistory } from 'vue-router';
import DefaultLayout from '../Layout/Layout.vue';
import Home from '../HomeLandingPage/page.vue';
import LoginLanding from '../Login/LoginLanding.vue';
import LoginFOrm from '../Login/LoginFOrm.vue';
import DashboardLayout from "../Layout/DashboardLayout.vue";

const routes = [
  {
    path: '/',
    component: DefaultLayout,
    children: [
      {
        path: '/', // ✅ Empty path means it loads at "/"
        name: 'Home',
        component: Home
      },
      {
        path: '/Login', // ✅ Empty path means it loads at "/"
        name: 'Login',
        component: LoginLanding
      },
      { path: "/:role/login", component: LoginFOrm },
//   { path: "/:role/signup", component: () => import("../components/SignupForm.vue") },
    ]
  },



  {
    path: "/dashboard",
    component: DashboardLayout,
    children: [
      { path: "/dashboard/parents", component: () => import("../Dashboards/Parent_Dashboard/page.vue") },
      { path: "/dashboard/parents/Schedule", component: () => import("../ParentDashboardPages/ParentDashboardClassSchedule.vue") },
      { path: "/dashboard/parents/CourseManagement", component: () => import("../ParentDashboardPages/parentDashboardCoursesAdd.vue") },
      { path: "/dashboard/parents/ParentDashboardNotificationCenter", component: () => import("../ParentDashboardPages/ParentDashboardNotificationCenter.vue") },
      { path: "/dashboard/parents/ParentDashboardSettingsCenter", component: () => import("../ParentDashboardPages/ParentDashboardSettingsInformation.vue") },
      { path: "/dashboard/parents/ParentDashboardPaymentGateway", component: () => import("../ParentDashboardPages/ParentDashboardPAymentGateway.vue") },
      { path: "/dashboard/parents/ParentDashboardAddStudent", component: () => import("../ParentDashboardPages/ParentDashboardAddNewStudent.vue") },
      { path: "/dashboard/parents/ParentDashboardEnrolledStudents", component: () => import("../ParentDashboardPages/ParentDashboardEnrolledStudentsData.vue") }
    ]
  }

];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
