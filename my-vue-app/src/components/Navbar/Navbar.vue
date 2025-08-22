<template>
  <nav class="navbar">
    <div class="nav-container">
      <div class="nav-logo">Tutor Insider</div>

      <button class="menu-toggle" @click="toggleMobileMenu">
        ☰
      </button>

      <ul :class="['nav-links', { 'nav-active': mobileMenuOpen }]">
        <li><a href="#">Home</a></li>

        <li
          class="dropdown"
          @mouseenter="openDropdown('services')"
          @mouseleave="closeDropdown"
        >
          <a href="#">Services ▾</a>
          <ul v-show="activeDropdown === 'services'" class="dropdown-menu">
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Mobile App</a></li>
            <li><a href="#">SEO</a></li>
          </ul>
        </li>

        <li
          class="dropdown"
          @mouseenter="openDropdown('about')"
          @mouseleave="closeDropdown"
        >
          <a href="#">About ▾</a>
          <ul v-show="activeDropdown === 'about'" class="dropdown-menu">
            <li><a href="#">Our Team</a></li>
            <li><a href="#">Careers</a></li>
          </ul>
        </li>

        <li><a href="#">Contact</a></li>
      </ul>
      <div class="login-signup-buttons-HLC-navbar">
        <div class="HLC-navbar-btns-direct-division">
           <router-link to="/Login" class="HLC-navbar-login-button">Login</router-link>
            <!-- <router-link to="Login">  <button class="HLC-navbar-login-button">Login</button> <router-link/> -->
            <!-- <button class="HLC-navbar-signup-button">Sign Up</button> -->
              <router-link to="/SignUp" class="HLC-navbar-signup-button"><button class="HLC-navbar-signup-button">Sign Up</button></router-link>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar",
  data() {
    return {
      mobileMenuOpen: false,
      activeDropdown: null,
    };
  },
  methods: {
    toggleMobileMenu() {
      this.mobileMenuOpen = !this.mobileMenuOpen;
    },
    openDropdown(name) {
      this.activeDropdown = name;
    },
    closeDropdown() {
      this.activeDropdown = null;
    },
  },
};
</script>

<style>
/* Navbar styles */
.navbar {
  background:white;
  color: black;
  padding: 0.5rem 1rem;
}

.nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-logo {
  font-size: 1.2rem;
  font-weight: bold;
}

.menu-toggle {
  display: none;
  background: none;
  border: none;
  color: black;
  font-size: 1.5rem;
  cursor: pointer;
}

/* Desktop Menu */
.nav-links {
  display: flex;
  list-style: none;
  gap: 1rem;
  color: black;
}

.nav-links li {
  position: relative;
}

.nav-links a {
  color: black;
  text-decoration: none;
  font-size: 1vw;
}

.nav-links a:hover {
  text-decoration: underline;
}

/* Dropdown */
.dropdown-menu {
  position: absolute;
  top: 100%;
  left: 0;
  background: white;
  list-style: none;
  padding: 0.5rem 0;
  margin: 0;
  min-width: 15px;
  display: none;
}

.dropdown-menu li {
  padding: 0.5rem 1rem;
}

.dropdown-menu a {
  color: black;
}

.dropdown:hover .dropdown-menu {
  display: block;
}

.HLC-navbar-login-button{
    background-color: white;
    color: black;
    font-size: 1vw;
    border: 2px solid white;
    font-style: none;
      list-style: none;
        text-decoration: none;

}
.HLC-navbar-signup-button{
    background: #0077B3FF; 
     opacity: 1;
    color: white;
    font-size: 1vw;
    width: 5.5vw;
    height: 2.5vw;
    border-radius:20px ;
    border: 2px solid white;
}

/* Mobile Styles */
@media (max-width: 768px) {
  .menu-toggle {
    display: block;
  }

  .nav-links {
    position: absolute;
    top: 60px;
    left: 0;
    background: #333;
    flex-direction: column;
    width: 100%;
    display: none;
    padding: 1rem 0;
  }

  .nav-links.nav-active {
    display: flex;
  }

  .dropdown-menu {
    position: static;
    display: block;
    background: none;
    padding-left: 1rem;
  }
}
</style>
