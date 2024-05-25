<template>
  <div class="container form-width">
    <div v-if="order.OrderStatus == 'Waiting for payment'">
      <h1>Order No: #{{ order.OrderID }}</h1>

      <h2>Order Satus: {{ order.OrderStatus }}</h2>
      <form class="needs-validation" @submit.prevent="submitForm">
        <div>
          <label for="card-name" class="form-label">Card name</label>
          <input
            type="text"
            placeholder="John doe"
            required
            v-model.trim="cardHolderName"
            class="form-control"
            @input="checkcardHolderName"
          />
        </div>
        <div v-if="errorMsg.cardHolderName" v-bind:style="{ color: 'red' }">
          {{ errorMsg.cardHolderName }}
        </div>

        <div>
          <label for="card-number" class="form-label">Card number</label>
          <input
            type="text"
            placeholder="4123 4567 8900 5432"
            maxlength="16"
            required
            v-model.trim="cardNumber"
            class="form-control"
            @input="checkCardNumber"
          />
        </div>
        <div v-if="errorMsg.cardNumber" v-bind:style="{ color: 'red' }">
          {{ errorMsg.cardNumber }}
        </div>

        <div class="row justify-content-between my-3">
          <div class="col-auto">
            <label for="expiration-date">Expiration date </label>

            <p>
              <input type="date" v-model="expiryDate" required />
            </p>
          </div>
          <div class="col-auto">
            <label for="security-code">Security code</label>
            <input
              type="text"
              placeholder="123"
              minlength="3"
              maxlength="3"
              required
              v-model.trim="securityCode"
              class="form-control"
              @input="checkSecurityCode"
            />
            <div v-if="errorMsg.securityCode" v-bind:style="{ color: 'red' }">
              {{ errorMsg.securityCode }}
            </div>
          </div>
        </div>

        <!-- Terms and Conditions -->
        <div>
          <p>
            By clicking "Agree to terms and conditions", you accept our
            <a href="/terms">Terms and Conditions</a>. You agree to pay the
            total amount shown, which includes all applicable taxes and fees.
            Your payment information is secure and encrypted. Please review your
            order carefully.
          </p>
          <div class="form-check">
            <input
              class="form-check-input"
              type="checkbox"
              v-model="agree"
              required
            />
            <label class="form-check-label">
              I have read and agree to terms and conditions
            </label>
          </div>
        </div>
        <p>
          <button
            type="submit"
            v-bind:disabled="!formIsFilled"
            :class="['btn', submitButtonColor]"
          >
            Confirm payment: $AU {{ order.Total }}
          </button>
        </p>
      </form>
    </div>
    <div v-else>
      <div class="row justify-content-center">
        <div class="col-auto ms-0 text-center">
          <h1>Payment completed</h1>
          <div class="my-5">
            <img src="../assets/icons/complete-icon.png" class="img-fluid" />
          </div>
          <div>
            <p>Your order is now being prepared.</p>
          </div>
          <div class="my-4">
            <router-link :to="'/menu'"
              ><a
                href="#!"
                class="btn btn-sm btn-dark button-shop"
                data-mdb-ripple-init
                >Go to home
              </a></router-link
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  MDBContainer,
  MDBCol,
  MDBRow,
  MDBIcon,
  MDBBtn,
  mdbRipple,
} from "mdb-vue-ui-kit";
import axios from "axios";

export default {
  name: "Payment",
  props: {
    orderID: String,
    required: true,
  },
  data() {
    return {
      cardHolderName: "",
      cardNumber: "",
      expiryDate: "",
      securityCode: "",
      agree: false,
      errorMsg: {
        cardHolderName: "",
        cardNumber: "",
        expiryDate: "",
        securityCode: "",
        agree: "",
      },
      order: {
        OrderID: this.orderID,
        OrderStatus: "",
        Total: 0,
      },
    };
  },
  async mounted() {
    console.log("PaymentView, this.OrderID: ", this.orderID);
    console.log("PaymentView, order: ", this.order);
    await this.fetchOrderDetails();
  },
  component: {
    MDBContainer,
    MDBCol,
    MDBRow,
    MDBIcon,
    MDBBtn,
  },
  directives: {
    mdbRipple,
  },
  computed: {
    formIsFilled: function () {
      return (
        this.cardHolderName &&
        this.cardNumber &&
        this.expiryDate &&
        this.securityCode &&
        this.agree
      );
    },
    submitButtonColor: function () {
      this.checkSubmit();
      if (this.formIsFilled && this.canSubmit) {
        return "btn-dark button-shop";
      } else {
        return "btn-outline-secondary button-shop";
      }
    },
  },
  methods: {
    async fetchOrderDetails() {
      try {
        const response = await axios.get(
          `http://localhost:3000/orders/${this.orderID}`
        );
        this.order = response.data;
        console.log("Fetched order details: ", this.order);
      } catch (error) {
        console.error(
          "Error fetching order details:",
          error.response ? error.response.data : error.message
        );
      }
    },
    checkcardHolderName() {
      if (!this.cardHolderName.trim().match(/^[a-zA-Z]+$/)) {
        this.errorMsg.cardHolderName = "Card name is alphabet only";
      } else {
        this.errorMsg.cardHolderName = null;
      }
    },
    checkCardNumber() {
      const visaRegex = /^4[0-9]{12}(?:[0-9]{3})?$/;
      const masterCardRegex = /^5[1-5][0-9]{14}$/;

      if (this.cardNumber.trim() === "") {
        this.errorMsg.cardNumber = "Card number is required";
      } else if (
        !visaRegex.test(this.cardNumber) &&
        !masterCardRegex.test(this.cardNumber)
      ) {
        this.errorMsg.cardNumber =
          "Invalid card number. Must be a Visa or MasterCard.";
      } else {
        this.errorMsg.cardNumber = "";
      }
    },
    checkSecurityCode() {
      if (/[^\d]/.test(this.securityCode)) {
        this.errorMsg.securityCode = "Post code must be number only";
      } else {
        this.errorMsg.securityCode = null;
      }
    },
    checkSubmit() {
      this.canSubmit = true;

      for (let key in this.errorMsg) {
        if (this.errorMsg[key]) {
          this.canSubmit = false;
          break;
        }
      }
    },
    async submitForm() {
      if (this.canSubmit) {
        try {
          const paymentDetails = {
            CardType: null,
            CardNumber: this.cardNumber,
            ExpiryDate: this.expiryDate,
            CardHolderName: this.cardHolderName,
          };

          const response = await axios.put(
            `http://localhost:3000/orders/${this.orderID}`,
            {
              PaymentDetails: paymentDetails,
              OrderStatus: "Pending",
            }
          );

          console.log("Payment submitted!", response.data);
          this.message = "Payment submitted!";
        } catch (error) {
          console.error(
            "Error submitting payment:",
            error.response ? error.response.data : error.message
          );
          this.message =
            "There was an error submitting your payment. Please try again.";
        }
      }
    },
  },
};
</script>
