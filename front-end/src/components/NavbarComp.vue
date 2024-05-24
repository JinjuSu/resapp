<template>
  <MDBNavbar expand="lg" light bg="light" container>
    <MDBNavbarBrand href="#" class="fw-bold"
      ><router-link class="link-text" to="/menu"
        >RelaxingKoala</router-link
      ></MDBNavbarBrand
    >
    <MDBNavbarToggler
      @click="collapse1 = !collapse1"
      target="#navbarSupportedContent"
    ></MDBNavbarToggler>
    <MDBCollapse v-model="collapse1" id="navbarSupportedContent">
      <MDBNavbarNav class="mb-2 mb-lg-0">
        <router-link class="link-text" to="/">
          <MDBNavbarItem href="#" active> Home </MDBNavbarItem>
        </router-link>

        <router-link class="link-text" to="/menu">
          <MDBNavbarItem href="#">Menu </MDBNavbarItem></router-link
        >
        <router-link class="link-text" to="/reservations">
          <MDBNavbarItem href="#"> Reservations </MDBNavbarItem></router-link
        >
      </MDBNavbarNav>

      <MDBBtn outline="dark"
        ><router-link to="/login" style="text-decoration: none; color: black"
          >Log in</router-link
        ></MDBBtn
      >
      <!-- Cart icon logic -->

      <MDBBtn
        ><router-link to="/cart"
          ><img
            class="image-icon-cart"
            src="../assets/icons/cart-item-icon.png" /></router-link
      ></MDBBtn>
    </MDBCollapse>
  </MDBNavbar>
</template>
<!-- Navbar script -->
<script>
import {
  MDBBtn,
  MDBNavbar,
  MDBNavbarToggler,
  MDBNavbarBrand,
  MDBNavbarNav,
  MDBNavbarItem,
  MDBCollapse,
  MDBDropdown,
  MDBDropdownToggle,
  MDBDropdownMenu,
  MDBDropdownItem,
} from "mdb-vue-ui-kit";
import { ref } from "vue";

export default {
  name: "NavbarComp",
  data() {
    return {};
  },
  components: {
    MDBBtn,
    MDBNavbar,
    MDBNavbarToggler,
    MDBNavbarBrand,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBCollapse,
    MDBDropdown,
    MDBDropdownToggle,
    MDBDropdownMenu,
    MDBDropdownItem,
  },
  setup() {
    const collapse1 = ref(false);
    const dropdown1 = ref(false);
    return {
      collapse1,
      dropdown1,
    };
  },
};
</script>

<style scoped>
#app {
  font-family: Roboto, Helvetica, Arial, sans-serif;
}

.image-logo {
  max-width: 50px;
  max-height: 50px;
}

.image-icon {
  max-width: 20px;
  max-height: 20px;
  color: #fbfbfb26;
}

.image-icon-cart {
  max-width: 40px;
  max-height: 40px;
}

.link-text {
  color: black;
  font-weight: semi-bold;
  text-decoration-line: none;
}
</style>
