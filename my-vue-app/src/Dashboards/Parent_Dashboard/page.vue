<template>
    <div class="DAshboard-parent-all-imports-settings-gapping">
        <div class="parent-dashboard-first-combined-section-mixing-block">
       <DemoSection />
       <NotificationSection/>
        </div>
    <EnrolledInformationSection/>
    <TutorSelection/>
    <CrmChatting/>
    </div>
</template>

<script>
// import CrmChatting from './CrmChatting.vue';
import CrmChatting from './CrmChatting.vue';
import DemoSection from './DemoSection.vue';
import EnrolledInformationSection from './EnrolledInformationSection.vue';
import NotificationSection from './NotificationSection.vue';
import TutorSelection from './TutorSelection.vue';

    export default {
        components:{
            DemoSection,
            NotificationSection,
            EnrolledInformationSection,
            TutorSelection,
            CrmChatting
        }
    }
</script>

<style lang="css" scoped>
.parent-dashboard-first-combined-section-mixing-block{
    display: flex;
    justify-content: center;
    align-items:  center;
}
.DAshboard-parent-all-imports-settings-gapping{
    display: flex;
    flex-direction: column;
    gap: 4vw;
    justify-content: center;
    /* align-items: center; */
}
</style>