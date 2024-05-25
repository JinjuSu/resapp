<template>
  <MDBContainer light bg="light ">
    <div class="container py-5" v-if="cartItems.length > 0">
      <div class="row justify-content-between">
        <div class="col-auto">
          <h2>Table No:</h2>
        </div>
        <div class="col-auto text-end">
          <input
            type="text"
            minlength="1"
            maxlength="2"
            placeholder="00"
            required
            v-model="order.TableID"
            @input="checkSubmit"
          />
          <div v-if="errorMsg" v-bind:style="{ color: 'red' }">
            {{ errorMsg }}
          </div>
        </div>
      </div>

      <div v-for="menuItem in cartItems" :key="menuItem.ItemID">
        <div class="row justify-content-between">
          <div class="col-8 col-md-3">
            <!-- Image goes here -->
            <div
              class="card border-0 shadow-none text-end image-product bg-transparent d-flex justify-content-end"
            >
              <img :src="menuItem.Image" class="img-fluid rounded-start" />
            </div>
          </div>

          <div class="col-8 col-md-3">
            <!-- Menu name goes here -->
            <div class="card border-0 shadow-none text-start bg-transparent">
              <div class="card-body">
                <h4>{{ menuItem.ItemName }}</h4>
              </div>
            </div>
          </div>
          <div class="col-8 col-md-3">
            <!-- Decrementer and Incrementer group -->

            <div class="card border-0 shadow-none text-start bg-transparent">
              <div class="card-body">
                <p><strong> Quantity </strong></p>
                <div class="row">
                  <!-- Minus icon -->
                  <div class="col-auto">
                    <div class="row border rounded">
                      <div class="col-auto">
                        <a v-mdb-ripple>
                          <i
                            class="fas fa-minus-square image-icon-qty"
                            v-on:click="deductFunction(menuItem)"
                          ></i>
                        </a>
                      </div>
                      <!-- Quantity-->
                      <div class="col-auto">{{ menuItem.Quantity }}</div>
                      <!-- Add icon -->
                      <div class="col-auto">
                        <a v-mdb-ripple>
                          <i
                            class="fas fa-plus-square image-icon-qty"
                            v-on:click="addFunction(menuItem)"
                          ></i>
                        </a>
                      </div>
                    </div>
                  </div>
                  <!-- remove icon -->
                  <div class="col">
                    <i class="fas fa-trash-alt image-icon-trash" />
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8 col-md-3">
            <!-- Total price goes here -->
            <div class="card border-0 shadow-none bg-transparent">
              <div class="card-body text-end">
                <p><strong> Total</strong></p>
                <p>AU$ {{ menuItem.TotalPrice }}</p>
              </div>
            </div>
          </div>
        </div>
        <hr />
      </div>

      <div class="row justify-content-between my-3">
        <div class="col-auto">
          <h2>Total</h2>
        </div>
        <div class="col-auto">
          <h2>AU$ {{ totalCartPrice }}</h2>
          <!-- Display the computed total price -->
        </div>
      </div>
      <div v-if="errorMsg" v-bind:style="{ color: 'red' }">
        {{ errorMsg }}
      </div>
      <div class="my-3">
        <a
          href="#!"
          data-mdb-ripple-init
          v-bind:disabled="!formIsFilled"
          :class="['btn', submitButtonColor]"
          @click="submitOrder"
        >
          Proceed to check out
        </a>
      </div>
    </div>
    <div v-else-if="cartItems.length === 0" class="container my-5 text-center">
      <div class="row justify-content-center">
        <div class="col-5 ms-0">
          <h1>Your cart is empty</h1>
          <img
            src="../assets/icons/cart-icon.png"
            class="img-fluid image-empty-cart"
          />
          <div class="">
            <router-link :to="'/menu'"
              ><a
                href="#!"
                class="btn btn-sm btn-dark button-shop"
                data-mdb-ripple-init
                >Start ordering
              </a></router-link
            >
          </div>
        </div>
      </div>
    </div>
  </MDBContainer>
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
import { computed } from "vue";
import { store } from "../assets/menu-details/store";
import axios from "axios";

export default {
  name: "Cart",
  components: {
    MDBContainer,
    MDBCol,
    MDBRow,
    MDBIcon,
    MDBBtn,
  },
  directives: {
    mdbRipple,
  },
  data() {
    return {
      order: {
        Timestamp: new Date().toISOString().slice(0, 19).replace("T", " "),
        TableID: "",
        Items: store.cartItems,
        Total: this.totalCartPrice,
        PaymentDetails: {},
        OrderStatus: "Waiting for payment",
      },
      errorMsg: "",
      message: "",
    };
  },
  mounted() {
    console.log("CartView, this.order :", this.order);
    this.updateOrderDetails();
  },
  computed: {
    formIsFilled: function () {
      return this.order.TableID;
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

  setup() {
    const cartItems = computed(() => store.cartItems);

    const totalCartPrice = computed(() => {
      return cartItems.value
        .reduce((acc, item) => acc + item.TotalPrice, 0)
        .toFixed(2);
    });

    const addFunction = (menuItem) => {
      menuItem.Quantity++;
      updateTotalPrice(menuItem);
    };

    const deductFunction = (menuItem) => {
      if (menuItem.Quantity > 1) {
        menuItem.Quantity--;
        updateTotalPrice(menuItem);
      }
    };

    const updateTotalPrice = (menuItem) => {
      menuItem.TotalPrice =
        Math.round(menuItem.Price * menuItem.Quantity * 100) / 100;
    };
    console.log("Retrieved cartItems: ", cartItems);
    console.log("Produced totalCartPrice: ", totalCartPrice);
    return {
      cartItems,
      totalCartPrice,
      addFunction,
      deductFunction,
    };
  },
  methods: {
    checkTableID() {
      console.log(this.order.TableID);
      if (!this.order.TableID) {
        this.errorMsg = "Table number is required";
      } else {
        this.errorMsg = null;
      }
    },
    checkSubmit() {
      this.canSubmit = true;

      for (let key in this.message) {
        if (this.message[key]) {
          this.canSubmit = false;
          break;
        }
      }
    },
    updateOrderDetails() {
      this.order.Items = store.cartItems;
      this.order.Total = this.totalCartPrice;
    },
    async submitOrder() {
      this.checkTableID();
      this.order.Timestamp = new Date()
        .toISOString()
        .slice(0, 19)
        .replace("T", " ");
      this.updateOrderDetails();

      try {
        console.log("Submitting order with data:", this.order);
        const response = await axios.post(
          "http://localhost:3000/orders",
          this.order
        );
        console.log("CartView: Order created!", response.data);
        this.message = "Order created!";

        const orderId = response.data.OrderID;
        if (!orderId) {
          throw new Error("OrderID not found in response");
        } else {
          console.log("CartView, New OrderID:", orderId);
        }

        // Clear the order
        this.order = {
          Timestamp: new Date().toISOString().slice(0, 19).replace("T", " "),
          TableID: "",
          Items: [],
          Total: 0,
          PaymentDetails: {},
          OrderStatus: "Waiting for payment",
        };
        // Clear cart items in the store
        store.cartItems = [];

        // Redirect to the payment page with the OrderID
        this.$router.push({
          name: "payment",
          params: { orderID: orderId },
        });
      } catch (error) {
        console.error(
          "Error submitting order:",
          error.response ? error.response.data : error.message
        );
        this.message =
          "There was an error submitting your order. Please try again.";
      }
    },
  },
};
</script>
