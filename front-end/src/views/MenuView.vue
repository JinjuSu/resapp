<template>
  <div class="container my-5">
    <!-- Search bar -->
    <MDBInput class="mb-4" v-model="searchItem" placeholder="Search" />
    <div class="row mb-4">
      <!-- Product column 3 cards per row -->
      <div class="col">
        <div class="row">
          <div
            class="col-4"
            v-for="menuItem in paginatedProducts"
            :key="menuItem.ItemID"
          >
            <div class="card grid-wrap">
              <div class="card-header text-center">
                <img class="img-fluid" :src="menuItem.Image" />
              </div>
              <div class="card-body">
                <h5 class="card-title">{{ menuItem.ItemName }}</h5>
                <p class="card-text">{{ menuItem.Price }}</p>
                <!-- <router-link :to="'/cart/' + menuItem.ItemID"></router-link>
 -->
                <a
                  href="#!"
                  class="btn btn-sm btn-dark button-shop"
                  data-mdb-ripple-init
                  @click="addToCart(menuItem)"
                >
                  Add to cart
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <nav aria-label="Page navigation example">
      <MDBPagination>
        <MDBPageNav
          prev
          :disabled="currentPage === 1"
          @click="changePage(currentPage - 1)"
        ></MDBPageNav>
        <MDBPageItem
          v-for="n in totalPages"
          :key="n"
          :class="{ active: n === currentPage }"
        >
          <a class="page-link" href="#" @click.prevent="changePage(n)">{{
            n
          }}</a>
        </MDBPageItem>
        <MDBPageNav
          next
          :disabled="currentPage === totalPages"
          @click="changePage(currentPage + 1)"
        ></MDBPageNav>
      </MDBPagination>
    </nav>
  </div>
</template>

<script>
import {
  MDBContainer,
  MDBCollapse,
  MDBBtn,
  MDBInput,
  MDBIcon,
  MDBPagination,
  MDBPageNav,
  MDBPageItem,
} from "mdb-vue-ui-kit";
import { ref, computed } from "vue";
import { menu } from "../assets/menu-details/menu.js";
import { store } from "../assets/menu-details/store";

export default {
  name: "Products",
  data() {
    return {
      searchItem: "",
      menu,
    };
  },
  mounted() {
    console.log(menu);
  },
  components: {
    MDBContainer,
    MDBCollapse,
    MDBBtn,
    MDBInput,
    MDBIcon,
    MDBPagination,
    MDBPageNav,
    MDBPageItem,
  },
  setup() {
    const searchItem = ref("");
    const currentPage = ref(1);
    const itemsPerPage = ref(9);

    const filteredProducts = computed(() => {
      return menu.filter((product) =>
        product.ItemName.toLowerCase().includes(searchItem.value.toLowerCase())
      );
    });

    const paginatedProducts = computed(() => {
      const start = (currentPage.value - 1) * itemsPerPage.value;
      const end = start + itemsPerPage.value;
      return filteredProducts.value.slice(start, end);
    });

    const totalPages = computed(() => {
      return Math.ceil(filteredProducts.value.length / itemsPerPage.value);
    });

    function changePage(page) {
      if (page >= 1 && page <= totalPages.value) {
        currentPage.value = page;
      }
    }
    // const addToCart = (menuItem) => {
    //   store.addToCart(menuItem);
    //   console.log("Cart Items:", store.cartItems);
    // };

    return {
      searchItem,
      filteredProducts,
      paginatedProducts,
      currentPage,
      totalPages,
      changePage,
    };
  },
  methods: {
    addToCart(menuItem) {
      store.addToCart(menuItem);
      //this.cartItems.push(itemId);
      console.log("Cart Items:", store.cartItems);
    },
  },
};
</script>
