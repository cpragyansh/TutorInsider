<!-- HeroCarousel.vue -->
<template>
    <section class="hero-carousel" role="region" aria-roledescription="carousel" aria-label="Tutor Insider hero"
        @mouseenter="stopAutoplay" @mouseleave="startAutoplay">
        <!-- Prev -->
        <button class="nav nav-left" aria-label="Previous slide" @click="prev">
            <svg viewBox="0 0 24 24" width="28" height="28" aria-hidden="true">
                <path d="M15 18l-6-6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                    stroke-linejoin="round" />
            </svg>
        </button>

        <!-- Slide -->
        <transition name="fade-slide" mode="out-in">
            <div v-if="activeSlide" :key="current" class="slide"
                :aria-label="`Slide ${current + 1} of ${slides.length}`">
                <div class="slide-grid">
                    <!-- Left: image with blob mask -->
                    <div class="image-wrap">
                        <svg viewBox="0 0 680 680" class="blob">
                            <!-- <defs>
                <clipPath :id="`blobClip-${current}`" clipPathUnits="objectBoundingBox">
                  <path
                    d="M568.5,359.5Q534,439,468.5,496Q403,553,323,575.5Q243,598,161,560.5Q79,523,74,431.5Q69,340,94.5,265.5Q120,191,179.5,138Q239,85,321.5,71.5Q404,58,470,108.5Q536,159,569,239.5Q602,320,568.5,359.5Z"
                  />
                </clipPath>
              </defs> -->
                            <image :href="activeSlide.image" width="680" height="680"
                                preserveAspectRatio="xMidYMid slice" :clip-path="`url(#blobClip-${current})`"
                                alt="error loading image" />
                        </svg>
                    </div>

                    <!-- Right: text -->
                    <div class="copy">
                        <h1 class="headline">
                            <span class="accent">{{ activeSlide.heading }}</span>
                        </h1>

                        <p v-for="(para, idx) in activeSlide.paragraphs" :key="idx" class="lead">
                            {{ para }}
                        </p>
                        <p class="lead">
                            Unlock your academic success with personalized guidance from the best tutors,
                            catering to your unique learning needs.
                        </p>

                        <div class="cta-row">
                            <a class="btn btn-orange" :href="activeSlide.primaryCta.href">
                                {{ activeSlide.primaryCta.label }}
                            </a>
                            <a class="btn btn-blue" :href="activeSlide.secondaryCta.href">
                                {{ activeSlide.secondaryCta.label }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </transition>

        <!-- Next -->
        <button class="nav nav-right" aria-label="Next slide" @click="next">
            <svg viewBox="0 0 24 24" width="28" height="28" aria-hidden="true">
                <path d="M9 6l6 6-6 6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                    stroke-linejoin="round" />
            </svg>
        </button>

        <!-- Dots -->
        <div class="dots" role="tablist" :aria-label="`Slide dots`">
            <button v-for="(s, i) in slides" :key="i" class="dot" :class="{ active: i === current }" role="tab"
                :aria-selected="i === current" :aria-label="`Go to slide ${i + 1}`" @click="goTo(i)" />
        </div>
    </section>
</template>

<script>
export default {
    name: "HeroCarousel",
    data() {
        return {
            current: 0,
            timer: null,
            interval: 5000, // autoplay ms
            slides: [
                {
                    image: "/assets/homesliderimages/Welcome-to-tutorinsider.webp",
                    heading: "Welcome To Tutor Insider",
                    paragraphs: [
                        "Your premier destination for expert home and online tutoring services. We offer qualified and experienced tutors across India, including cities like Bangalore, Hyderabad, Delhi, Mumbai, Chennai, Pune, Dehradun, Gurgaon, Mysore, and Jaipur.",
                        "Unlock your academic success with personalized guidance from the best tutors, catering to your unique learning needs."
                    ],
                    primaryCta: { label: "GET A TUTOR", href: "/get-a-tutor" },
                    secondaryCta: { label: "JOIN AS A TUTOR", href: "/join-as-a-tutor" }
                },
                {
                    image: "https://tutorinsider.com/wp-content/uploads/2025/05/empowering-your-childs-journey.png",
                    heading: "Empowering Your Child’s Journey",
                    paragraphs: [
                        "Discover tailored learning programs designed to build confidence and academic excellence.",
                        "With expert guidance, we ensure your child thrives in every subject and beyond."
                    ],
                    primaryCta: { label: "GET A TUTOR", href: "/get-a-tutor" },
                    secondaryCta: { label: "JOIN AS A TUTOR", href: "/join-as-a-tutor" }
                },
                {
                    image: "https://tutorinsider.com/wp-content/uploads/2025/05/Shadow-Teachers.png",
                    heading: "Shadow Teachers Support",
                    paragraphs: [
                        "Specialized shadow teachers to assist children with unique learning requirements.",
                        "We help foster independence, participation, and confidence in every child."
                    ],
                    primaryCta: { label: "GET A TUTOR", href: "/get-a-tutor" },
                    secondaryCta: { label: "JOIN AS A TUTOR", href: "/join-as-a-tutor" }
                }
            ]

        };
    },
    computed: {
        activeSlide() {
            return this.slides[this.current] || null;
        }
    },
    methods: {
        next() {
            this.current = (this.current + 1) % this.slides.length;
        },
        prev() {
            this.current = (this.current - 1 + this.slides.length) % this.slides.length;
        },
        goTo(i) {
            this.current = i;
        },
        startAutoplay() {
            this.stopAutoplay();
            this.timer = setInterval(this.next, this.interval);
        },
        stopAutoplay() {
            if (this.timer) {
                clearInterval(this.timer);
                this.timer = null;
            }
        },
        handleKey(e) {
            if (e.key === "ArrowRight") this.next();
            if (e.key === "ArrowLeft") this.prev();
        }
    },
    mounted() {
        this.startAutoplay();
        window.addEventListener("keydown", this.handleKey);
    },
    beforeUnmount() {
        this.stopAutoplay();
        window.removeEventListener("keydown", this.handleKey);
    }
};
</script>

<style scoped>
/* Layout */
.hero-carousel {
    position: relative;
    max-width: 90%;
    margin: 0 auto;
    padding: clamp(16px, 4vw, 28px);
    min-height: 540px;
}

.slide {
    background: #fff;

}

.slide-grid {
    display: grid;
    grid-template-columns: 1fr 1.1fr;
    align-items: center;
    gap: clamp(24px, 4vw, 56px);
}

/* Image + blob */
.image-wrap {
    display: grid;
    place-items: center;
}

.blob {
    width: min(620px, 42vw);
    height: auto;
    display: block;
    border-radius: 20%;
}

/* Copy */
.copy {
    color: #1f2937;
}

.headline {
    margin: 0 0 6px 0;
    line-height: 1.1;
    font-size: clamp(28px, 4.4vw, 56px);
    font-weight: 800;
}

.accent {
    color: #ff8a3a;
    /* orange like screenshot */
}

.lead {
    margin: 12px 0 0 0;
    font-size: clamp(14px, 1.2vw, 20px);
    font-weight: 500;
    line-height: 1.8;
    color: #4b5563;
}

.cta-row {
    display: flex;
    gap: 20px;
    margin-top: 28px;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 14px 24px;
    border-radius: 999px;
    font-weight: 800;
    text-decoration: none;
    font-size: 16px;
    box-shadow: 0 6px 14px rgba(0, 0, 0, 0.08);
    border: 1px solid transparent;
}

.btn-orange {
    background: #ff8a3a;
    color: #fff;
}

.btn-orange:hover {
    filter: brightness(0.95);
}

.btn-blue {
    background: #2d83ea;
    color: #fff;
}

.btn-blue:hover {
    filter: brightness(0.95);
}

/* Arrows */
.nav {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 44px;
    height: 44px;
    border-radius: 999px;
    background: #ffffff;
    border: 1px solid #e5e7eb;
    color: #111827;
    display: grid;
    place-items: center;
    cursor: pointer;
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
    transition: transform .15s ease, box-shadow .15s ease;
    z-index: 2;
}

.nav:hover {
    transform: translateY(-50%) scale(1.04);
    box-shadow: 0 10px 22px rgba(0, 0, 0, 0.12);
}

.nav-left {
    left: 8px;
}

.nav-right {
    right: 8px;
}

/* Dots */
.dots {
    position: absolute;
    left: 50%;
    bottom: 8px;
    transform: translateX(-50%);
    display: flex;
    gap: 10px;
}

.dot {
    width: 8px;
    height: 8px;
    border-radius: 999px;
    background: #d1d5db;
    border: none;
    cursor: pointer;
    transition: width .2s ease, background .2s ease;
}

.dot.active {
    width: 26px;
    background: #9ca3af;
}

/* Transitions */
.fade-slide-enter-active,
.fade-slide-leave-active {
    transition: opacity .35s ease, transform .35s ease;
}

.fade-slide-enter-from {
    opacity: 0;
    transform: translateX(20px);
}

.fade-slide-leave-to {
    opacity: 0;
    transform: translateX(-20px);
}

/* Responsive */
@media (max-width: 980px) {
    .slide-grid {
        grid-template-columns: 1fr;
        text-align: center;
    }

    .cta-row {
        justify-content: center;
    }

    .nav-left {
        left: 6px;
    }

    .nav-right {
        right: 6px;
    }
}
</style>
