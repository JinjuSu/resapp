<template>
  <div class="container my-5">
    <!-- Search bar -->

    <MDBInput class="mb-4" v-model="searchProduct" placeholder="Search" />
    <div class="row mb-4">
      <!-- Product column 3 cards per row -->
      <div class="col">
        <div class="row">
          <div
            class="col-4"
            v-for="product in paginatedProducts"
            :key="product.id"
          >
            <div class="card grid-wrap">
              <div class="card-header text-center">
                <img class="image-product" :src="product.image" />
              </div>
              <div class="card-body">
                <h5 class="card-title">{{ product.name }}</h5>
                <p class="card-text">{{ product.price }}</p>
                <router-link :to="'/product/' + product.id">
                  <a
                    href="#!"
                    class="btn btn-sm btn-dark button-shop"
                    data-mdb-ripple-init
                  >
                    Shop now
                  </a></router-link
                >
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
import { products } from "../assets/menu-details/menu.js";

export default {
  name: "Products",
  data() {
    return {
      searchProduct: {
        id: "",
        name: "",
        price: "",
        description: "",
        img: "",
      },
      products,
      test: "test printing",
    };
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
    const searchProduct = ref("");
    const currentPage = ref(1);
    const itemsPerPage = ref(6);

    const filteredProducts = computed(() => {
      return products.filter((product) =>
        product.name.toLowerCase().includes(searchProduct.value.toLowerCase())
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
      currentPage.value = page;
    }

    return {
      searchProduct,
      filteredProducts,
      paginatedProducts,
      currentPage,
      totalPages,
      changePage,
    };
  },
  computed: {
    filterProducts: function () {
      return this.products.filter((product) => {
        return product.name // products please find an item whose name matches the searchProduct.name
          .toLowerCase()
          .includes(this.searchProduct.toLowerCase());
      });
    },
  },
};
</script>
