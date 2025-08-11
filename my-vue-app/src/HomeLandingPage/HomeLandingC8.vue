<template>
  <section class="HLC8-gallery">
    <h2 class="HLC8-title">Moments of Learning &amp; Growth</h2>

    <!-- Gallery Grid -->
    <div class="HLC8-gallery-grid">
      <div
        v-for="(image, index) in images"
        :key="index"
        class="HLC8-gallery-item"
        @click="openPreview(index)"
      >
        <img :src="image.src" :alt="'Gallery image ' + (index + 1)" />
        <div class="HLC8-overlay">
          <span class="HLC8-preview-text">Preview</span>
        </div>
      </div>
    </div>

    <!-- Full Screen Preview Modal -->
    <div v-if="previewVisible" class="HLC8-fullscreen">
      <span class="HLC8-close" @click="closePreview">&times;</span>
      <img :src="images[currentImage].src" class="HLC8-fullscreen-img" />

      <!-- Navigation Arrows -->
      <span class="HLC8-prev" @click="prevImage">&#10094;</span>
      <span class="HLC8-next" @click="nextImage">&#10095;</span>
    </div>
  </section>
</template>

<script>
export default {
  name: "MomentsGallery",
  data() {
    return {
      images: [
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
        { src: "/assets/Images/HomeLandingPageAssets/section-8-gallery-image.png" },
      ],
      previewVisible: false,
      currentImage: 0,
    };
  },
  methods: {
    openPreview(index) {
      this.currentImage = index;
      this.previewVisible = true;
    },
    closePreview() {
      this.previewVisible = false;
    },
    nextImage() {
      this.currentImage = (this.currentImage + 1) % this.images.length;
    },
    prevImage() {
      this.currentImage =
        (this.currentImage - 1 + this.images.length) % this.images.length;
    },
  },
};
</script>

<style scoped>
.HLC8-gallery {
  max-width: 1100px;
  margin: 0 auto;
  padding: 2rem 1rem;
}

.HLC8-title {
  font-size: 1.8rem;
  font-weight: 700;
  margin-bottom: 2rem;
  text-align: center;
}

.HLC8-gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1rem;
}

.HLC8-gallery-item {
  position: relative;
  overflow: hidden;
  border-radius: 10px;
  cursor: pointer;
}

.HLC8-gallery-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.4s ease;
}

.HLC8-gallery-item:hover img {
  transform: scale(1.05);
}

.HLC8-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.4s ease;
}

.HLC8-gallery-item:hover .HLC8-overlay {
  opacity: 1;
}

.HLC8-preview-text {
  color: #fff;
  font-size: 1.2rem;
  font-weight: 500;
}

/* Full Screen Modal */
.HLC8-fullscreen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.9);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
}

.HLC8-fullscreen-img {
  max-width: 90%;
  max-height: 90%;
  border-radius: 8px;
}

.HLC8-close {
  position: absolute;
  top: 20px;
  right: 35px;
  color: white;
  font-size: 40px;
  font-weight: bold;
  cursor: pointer;
  transition: 0.3s;
}

.HLC8-close:hover {
  color: #ccc;
}

/* Navigation arrows */
.HLC8-prev,
.HLC8-next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  color: white;
  font-size: 50px;
  padding: 10px;
  transition: 0.3s;
  user-select: none;
}

.HLC8-prev:hover,
.HLC8-next:hover {
  color: #bbb;
}

.HLC8-prev {
  left: 20px;
}

.HLC8-next {
  right: 20px;
}
</style>
