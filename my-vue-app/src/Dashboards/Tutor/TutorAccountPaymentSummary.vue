<template>
  <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_container">
    <h3 class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_title">Payment Summary</h3>


    <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_all-list-item-main-closure">
    <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row">
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_label">Status:</span>
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_value">{{ status }}</span>
    </div>

    <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row">
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_label">Last Payout:</span>
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_value">{{ lastPayout }}</span>
    </div>

    <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row">
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_label">Next Payout:</span>
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_value">{{ nextPayout }}</span>
    </div>

    <div class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row">
      <span class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_label">Payment Link:</span>
      <span 
        class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_badge"
        :class="{ 
          'disabled': paymentLink === 'Disabled', 
          'active': paymentLink !== 'Disabled' 
        }"
      >
        {{ paymentLink }}
      </span>
    </div>
</div>
    <button class="TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_button">
      Manage Payment Settings
    </button>
  </div>
</template>

<script>
export default {
  name: "PaymentSummary",
  props: {
    status: { type: String, default: "Pending Setup" },
    lastPayout: { type: String, default: "N/A" },
    nextPayout: { type: String, default: "Pending setup" },
    paymentLink: { type: String, default: "Disabled" }
  }
};
</script>

<style scoped>
.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_container {
  width: 25vw;
  background: #fff;
  padding: 16px 18px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
  font-family: Arial, Helvetica, sans-serif;
}
.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_all-list-item-main-closure{
    display: flex;
    flex-direction: column;
    /* justify-content: center; */
    /* align-items: center; */
    gap: 0.4vw;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_title {
  font-size: 16px;
  font-weight: 600;
  margin: 0 0 14px;
  border-left: 4px solid #6c63ff; /* purple accent */
  padding-left: 6px;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 8px 0;
  font-size: 14px;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_label {
  color: #444;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_value {
  font-weight: 500;
  color: #1a1a1a;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_badge {
  font-size: 12px;
  font-weight: 600;
  padding: 3px 8px;
  border-radius: 12px;
}

/* states */
.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_badge.disabled {
  background: #f8d7da;
  color: #b02a37;
}
.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_badge.active {
  background: #d1e7dd;
  color: #0f5132;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_button {
  width: 100%;
  margin-top: 16px;
  padding: 10px;
  font-size: 14px;
  font-weight: 500;
  border: 1px solid #ccc;
  border-radius: 6px;
  background: #fff;
  cursor: pointer;
  transition: all 0.2s ease;
}

.TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_button:hover {
  background: #f7f7f7;
}

/* Responsive */
@media (max-width: 420px) {
  .TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_container {
    max-width: 100%;
    padding: 14px;
  }
  .TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_title {
    font-size: 15px;
  }
  .TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_row {
    font-size: 13px;
  }
  .TUTORDASHBOARD_HOME_PAYMENT_SUMMARY_button {
    font-size: 13px;
    padding: 9px;
  }
}
</style>
