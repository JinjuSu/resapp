<template>
  <MDBContainer light bg="light ">
    <div class="container py-5" v-if="cartItems.length > 0">
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

      <div class="row justify-content-between">
        <div class="col-auto">
          <h2>Total</h2>
        </div>
        <div class="col-auto">
          <h2>AU$ {{ totalCartPrice }}</h2>
          <!-- Display the computed total price -->
        </div>
      </div>

      <div class="my-5">
        <router-link :to="'/payment'">
          <a
            href="#!"
            class="btn btn-sm btn-dark button-shop"
            data-mdb-ripple-init
          >
            Proceed to check out
          </a>
        </router-link>
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
                >Start browsing
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
import { ref, computed } from "vue";
import { cartItems as initialCartItems } from "@/assets/menu-details/menu.js";

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
  setup() {
    const cartItems = ref(
      initialCartItems.map((item) => ({
        ...item,
        Quantity: 1,
        TotalPrice: Math.round(item.Price * 1 * 100) / 100,
      }))
    );

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

    return {
      cartItems,
      totalCartPrice,
      addFunction,
      deductFunction,
    };
  },
};
</script>
