<template>
  <div class="payment-container">
    <h2 class="title">Complete Your Payment</h2>
    <p class="subtitle">Finalize your course purchase by completing the payment.</p>

    <div class="payment-grid">
      <!-- Payment Details -->
      <div class="card payment-details">
        <h3>Payment Details</h3>
        <p class="amount">₹{{ coursePrice.toFixed(2) }}</p>
        <p class="note">One-time payment for full course access.</p>
        <p><strong>Course:</strong> {{ courseName }}</p>
        <p><strong>Start Date:</strong> {{ startDate }}</p>
      </div>

      <!-- Payment Form -->
      <div class="card payment-form">
        <h3>Choose a Payment Method</h3>
        <div class="tabs">
          <button
            v-for="method in paymentMethods"
            :key="method.value"
            :class="['tab-btn', { active: selectedMethod === method.value }]"
            @click="selectedMethod = method.value"
          >
            {{ method.label }}
          </button>
        </div>

        <!-- Credit/Debit Card -->
        <div v-if="selectedMethod === 'card'" class="method-fields">
          <label>Card Number</label>
          <input v-model="cardDetails.number" type="text" maxlength="16" placeholder="XXXX XXXX XXXX XXXX" />
          
          <div class="two-cols">
            <div>
              <label>Expiry Date</label>
              <input v-model="cardDetails.expiry" type="text" placeholder="MM/YY" />
            </div>
            <div>
              <label>CVV</label>
              <input v-model="cardDetails.cvv" type="password" maxlength="3" placeholder="CVV" />
            </div>
          </div>

          <label>Name on Card</label>
          <input v-model="cardDetails.name" type="text" placeholder="Full Name" />
        </div>

        <!-- UPI -->
        <div v-if="selectedMethod === 'upi'" class="method-fields">
          <label>UPI ID</label>
          <input v-model="upiId" type="text" placeholder="example@upi" />
        </div>

        <!-- Net Banking -->
        <div v-if="selectedMethod === 'netbanking'" class="method-fields">
          <label>Select Bank</label>
          <select v-model="selectedBank">
            <option value="">-- Choose Bank --</option>
            <option>State Bank of India</option>
            <option>HDFC Bank</option>
            <option>ICICI Bank</option>
            <option>Axis Bank</option>
            <option>Kotak Mahindra Bank</option>
          </select>
        </div>

        <!-- Wallet -->
        <div v-if="selectedMethod === 'wallet'" class="method-fields">
          <label>Select Wallet</label>
          <select v-model="selectedWallet">
            <option value="">-- Choose Wallet --</option>
            <option>Paytm</option>
            <option>PhonePe</option>
            <option>Google Pay</option>
            <option>Amazon Pay</option>
          </select>
        </div>

        <!-- PayPal -->
        <div v-if="selectedMethod === 'paypal'" class="method-fields">
          <label>PayPal Email</label>
          <input v-model="paypalEmail" type="email" placeholder="your@email.com" />
        </div>

        <button class="pay-btn" @click="processPayment">Pay ₹{{ coursePrice.toFixed(2) }}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "PaymentGateway",
  data() {
    return {
      courseName: "Advanced Mathematics",
      startDate: "15 Aug 2025",
      coursePrice: 399,
      selectedMethod: "card",
      paymentMethods: [
        { value: "card", label: "Credit/Debit Card" },
        { value: "upi", label: "UPI" },
        { value: "netbanking", label: "Net Banking" },
        { value: "wallet", label: "Wallets" },
        { value: "paypal", label: "PayPal" }
      ],
      cardDetails: { number: "", expiry: "", cvv: "", name: "" },
      upiId: "",
      selectedBank: "",
      selectedWallet: "",
      paypalEmail: ""
    };
  },
  methods: {
    processPayment() {
      // Basic Validation
      if (this.selectedMethod === "card" && (!this.cardDetails.number || !this.cardDetails.expiry || !this.cardDetails.cvv || !this.cardDetails.name)) {
        return alert("Please fill all card details.");
      }
      if (this.selectedMethod === "upi" && !this.upiId) {
        return alert("Please enter UPI ID.");
      }
      if (this.selectedMethod === "netbanking" && !this.selectedBank) {
        return alert("Please select your bank.");
      }
      if (this.selectedMethod === "wallet" && !this.selectedWallet) {
        return alert("Please select a wallet.");
      }
      if (this.selectedMethod === "paypal" && !this.paypalEmail) {
        return alert("Please enter PayPal email.");
      }

      alert(`Processing payment via ${this.selectedMethod} for ₹${this.coursePrice}`);
    }
  }
};
</script>

<style scoped>
.payment-container {
  max-width: 1000px;
  margin: auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}
.title {
  font-size: 24px;
  font-weight: bold;
}
.subtitle {
  color: #555;
  margin-bottom: 20px;
}
.payment-grid {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}
.card {
  background: white;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  flex: 1;
  min-width: 300px;
}
.payment-details h3 {
  margin-bottom: 10px;
}
.amount {
  font-size: 28px;
  font-weight: bold;
  color: #333;
}
.note {
  color: #777;
  font-size: 14px;
}
.tabs {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  margin-bottom: 15px;
}
.tab-btn {
  padding: 8px 14px;
  border: 1px solid #ddd;
  background: #f8f8f8;
  border-radius: 6px;
  cursor: pointer;
}
.tab-btn.active {
  background: #007bff;
  color: white;
  border-color: #007bff;
}
.method-fields {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
label {
  font-weight: 600;
  font-size: 14px;
}
input, select {
  padding: 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
}
.two-cols {
  display: flex;
  gap: 10px;
}
.pay-btn {
  margin-top: 15px;
  background: #007bff;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}
.pay-btn:hover {
  background: #0056b3;
}
</style>
