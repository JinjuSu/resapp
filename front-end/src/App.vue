<template>
  <Navbar></Navbar>
  <RouterView></RouterView>
</template>

<script>
import Navbar from "./components/NavbarComp.vue";

export default {
  name: "App",
  components: {
    Navbar,
  },
};
</script>

<style>
#app {
  font-family: Roboto, Helvetica, Arial, sans-serif;
}
</style>
