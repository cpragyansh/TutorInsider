<template>
  <footer class="HLC-footer">
    <div class="HLC-footer-container">
      <!-- Left Section -->
      <div class="HLC-footer-left">
        <div class="HLC-footer-logo">
          <!-- <img src="/logo.png" alt="Logo" /> -->
        </div>
        <p class="HLC-footer-tagline">Your partner in academic success.</p>
        <div class="HLC-footer-socials">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
      </div>

      <!-- Right Section (Links) -->
      <div class="HLC-footer-links">
        <div class="HLC-footer-column">
          <h4>Products</h4>
          <ul>
            <li><a href="#">Academic Tutoring</a></li>
            <li><a href="#">Exam Preparation</a></li>
            <li><a href="#">Skill Development</a></li>
          </ul>
        </div>
        <div class="HLC-footer-column">
          <h4>Company</h4>
          <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Our Tutors</a></li>
            <li><a href="#">Blog</a></li>
          </ul>
        </div>
        <div class="HLC-footer-column">
          <h4>Resources</h4>
          <ul>
            <li><a href="#">Student Success Stories</a></li>
            <li><a href="#">Help Center</a></li>
            <li><a href="#">Partners</a></li>
          </ul>
        </div>
      </div>
    </div>

    <hr class="HLC-footer-divider" />
    <p class="HLC-footer-bottom">© 2024 Acme Tutoring. All rights reserved.</p>
  </footer>
</template>

<script>
export default {
  name: "Footer",
};
</script>

<style>
.HLC-footer {
  background: white;
  padding: 2rem 1rem;
  color: #333;
  border-top: 1px solid #eee;
  font-family: Arial, sans-serif;
}

.HLC-footer-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  max-width: 1200px;
  margin: auto;
}

.HLC-footer-left {
  flex: 1 1 250px;
}

.HLC-footer-logo img {
  max-height: 40px;
}

.HLC-footer-tagline {
  margin: 0.5rem 0;
  color: #666;
}

.HLC-footer-socials {
  margin-top: 0.5rem;
}

.HLC-footer-socials a {
  margin-right: 10px;
  color: #333;
  font-size: 16px;
  text-decoration: none;
}

.HLC-footer-links {
  display: flex;
  flex: 2 1 500px;
  justify-content: space-around;
}

.HLC-footer-column h4 {
  margin-bottom: 0.5rem;
  font-size: 16px;
  font-weight: bold;
}

.HLC-footer-column ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.HLC-footer-column ul li {
  margin-bottom: 0.4rem;
}

.HLC-footer-column ul li a {
  text-decoration: none;
  color: #555;
}

.HLC-footer-column ul li a:hover {
  text-decoration: underline;
}

.HLC-footer-divider {
  border: none;
  border-top: 1px solid #eee;
  margin: 1rem 0;
}

.HLC-footer-bottom {
  text-align: center;
  font-size: 14px;
  color: #777;
}

/* Responsive */
@media (max-width: 768px) {
  .HLC-footer-container {
    flex-direction: column;
    align-items: flex-start;
  }
  .HLC-footer-links {
    flex-direction: column;
    gap: 1rem;
    margin-top: 1.5rem;
  }
}
</style>
