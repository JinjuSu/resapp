<template>
  <MDBContainer light bg="light ">
    <div class="container py-5" v-if="cartItems.length > 0">
      <div v-for="product in cartItems" :key="product.id">
        <div class="row justify-content-center text-center">
          <div class="col-8 col-md-3">
            <!-- Image goes here -->
            <div
              class="card border-0 shadow-none text-end image-product bg-transparent d-flex justify-content-end"
            >
              <img :src="product.image" class="img-fluid rounded-start" />
            </div>
          </div>

          <div class="col-8 col-md-3">
            <!-- Second card goes here -->
            <div class="card border-0 shadow-none text-start bg-transparent">
              <div class="card-body">
                <p>{{ product.name }}</p>
                <p>{{ product.price }}</p>
              </div>
            </div>
          </div>
          <div class="col-8 col-md-3">
            <!-- Third card goes here -->
            <div class="card border-0 shadow-none text-start bg-transparent">
              <div class="card-body">
                <!-- Decrenmentor and tncrementor tool group -->
                <div class="row">
                  <div class="col-auto">Qty.</div>
                  <!-- Minus icon -->
                  <div class="col-auto">
                    <div class="row border rounded">
                      <div class="col-auto">
                        <a v-mdb-ripple>
                          <i
                            class="fas fa-minus-square image-icon-qty"
                            v-on:click="deductFunction(product)"
                          ></i>
                        </a>
                      </div>
                      <!-- Number icon -->
                      <div class="col-auto">{{ product.qty }}</div>
                      <!-- Add icon -->
                      <div class="col-auto">
                        <a v-mdb-ripple>
                          <i
                            class="fas fa-plus-square image-icon-qty"
                            v-on:click="addFunction(product)"
                          ></i>
                        </a>
                      </div>
                    </div>
                  </div>
                  <!-- remove icon -->
                  <div class="col">
                    <i class="fas fa-trash-alt image-icon-trash"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8 col-md-3">
            <!-- Third card goes here -->
            <div class="card border-0 shadow-none text-start bg-transparent">
              <div class="card-body">
                <p>AU$ {{ product.price }}</p>
              </div>
            </div>
          </div>
        </div>
        <hr />
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
            <router-link :to="'/products'"
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
import { cartItems } from "@/assets/menu-details/menu.js";
import {
  MDBContainer,
  MDBCol,
  MDBRow,
  MDBIcon,
  MDBBtn,
  mdbRipple,
} from "mdb-vue-ui-kit";

export default {
  name: "Cart",
  data() {
    return {
      cartItems,
      product: {
        id: "",
        name: "",
        price: "",
        description: "",
        rating: "",
        image: "",
        qty: "",
      },
    };
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
  methods: {
    addFunction(product) {
      return product.qty++;
    },
    deductFunction(product) {
      if (product.qty > 0) {
        return product.qty--;
      }
    },
  },
};
</script>
