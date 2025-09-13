<template>
    <div>
       <AboutUs />  
       <WhyChooseUs />
       <AboutUsMission />
    </div>
</template>

<script>
import AboutUs from './AboutUs.vue';
import AboutUsMission from './AboutUsMission.vue';
// import AboutUsMission from './AboutUsMission.vue';
import WhyChooseUs from './WhyChooseUs.vue';

    export default {
        name:"AboutPage",
        components:{
        AboutUs,
        WhyChooseUs,
        AboutUsMission,
        }
    }
</script>

<style lang="scss" scoped>

</style>