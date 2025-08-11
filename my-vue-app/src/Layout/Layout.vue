<template>
  <div class="layout">
    <!-- Navbar -->
    <Navbar />

    <!-- Main content from child pages -->
    <main>
      <router-view /> <!-- ✅ This is where your child pages load -->
    </main>

    <!-- Footer -->
    <Footer />
  </div>
</template>

<script>
// import Page from '../HomeLandingPage/page.vue';

import Navbar from "../components/Navbar/Navbar.vue";
import Footer from "../components/Footer/Footer.vue";

export default {
  name: "DefaultLayout",
  components: {
    Navbar,
    Footer
  }
};
</script>

<style scoped>
.layout {
  /* display: flex;
  flex-direction: column;
  min-height: 100vh; */
}

main {
  /* flex: 1; */
}
</style>
